unit AspiCD;

interface
uses
  SysUtils,
  Classes,
  Windows,
  Registry,
  wnaspi32,
  scsidefs;

type
  ENoInterFace = Exception;

  TTOC = record
    //M : Byte;
    S : Integer;
    F : Byte;
    AudioTrack : BOOL; // indicates if the track is an audio or data track
  end;

  TCdToc = record
    TracksOnCD : Byte;
    LeadOut : TTOC;
    Tracks : array[0..99] of TTOC;
  end;
  PCdToc = ^TCdToc;

  TCdRom = record
    HaId : Byte;
    Target : Byte;
    Lun : Byte;
    Vendor : ShortString;
    ProductId : ShortString;
    Revision : ShortString;
    VendorSpec : ShortString;
    Description : ShortString;
    DriveLetter : Char;
  end;

  TCdRoms = record
    ActiveCdRom : Byte;
    CdRomCount : Byte;
    CdRom : array[0..25] of TCdRom;
  end;

  TCDInterface = ( cdiAutoDetect, cdiASPI, cdiNTSCSI );

const
  myTrue = 1;
  myFalse = 0;

function AspiInstalled : Integer;
function InterfaceInstalled : Boolean;
function GetCdRomDrives( var CdRoms : TCdRoms; UseInterface : TCDInterface ) : Boolean;
function ReadCdTOC( CdRoms : TCdRoms; DriveNo : integer; var Toc : TCdToc; UseInterface : TCDInterface ) :
  Boolean;
function GetAssignedDriveLetter( DriveStr : string; UseInterface : TCDInterface ) : Char;
implementation

uses SptiCD;
var NTScsiAvail : Boolean = False;
// TRUE no error, FALSE error

function CheckSenseKey( SenseKey : array of Byte ) : Boolean;
var
  I : Integer;
begin
  Result := SenseKey[0] = 0;
  I := 1;
  while ( I < High( SenseKey ) ) and Result do
  begin
    Result := SenseKey[I] = 0;
    I := I + 1;
  end;
end;

{*******************************************************************************
                                                                    AspiIntalled
*******************************************************************************}

function InterfaceInstalled : Boolean;
begin
  //Checks if an interface for TOC retrieval is present.

  Result := False;

  //First we've got to check if we're having an NT system.
  case getOsVersion of
    OS_WINNT35..OS_WINXP :
      begin
        //So, we've got SPTI or CDROM_IOCTL
        Result := True;
        NTSCSIAvail := True;
      end;
    OS_WIN95..OS_WIN98 :
      begin
        case AspiInstalled of
          -1 :
            begin
              Result := False;
            end;
        else
          begin
            Result := True;
          end;
        end;
      end;
  end;
end;

function AspiInstalled : Integer;
var
  AspiStatus : Cardinal;
begin
  if WNASPI_LOADED then
  begin
    AspiStatus := GetASPI32SupportInfo;
    if HIBYTE( LOWORD( AspiStatus ) ) = SS_COMP then
    begin
      // get number of host installed on the system
      Result := LOBYTE( LOWORD( AspiStatus ) );
    end
    else
      Result := -1
  end
  else
    Result := -1
end;

function GetCdRomText( DriveNo : integer; var CdRoms : TCdRoms; UseInterface : TCDInterface ) : Boolean;
var
  Buf : array[1..100] of char;
  hEvent : THandle;
  S : SRB_ExecSCSICmd;
  HaID, Target, Lun : Byte;
  i : integer;
begin
  Result := False;
  if (AspiInstalled > 0) and
  ( ( (NTSCSIAvail = False) and (UseInterface = cdiAutoDetect) ) or
  ( UseInterface = cdiASPI ) ) then // At least one adapter
  begin
    HaID := CdRoms.CdRom[DriveNo].HaId;
    Target := CdRoms.CdRom[DriveNo].Target;
    Lun := CdRoms.CdRom[DriveNo].Lun;

    FillChar( Buf, 100, 0 );
    FillChar( S, SizeOf( SRB_ExecSCSICmd ), 0 );

    hEvent := CreateEvent( nil, TRUE, FALSE, nil );
    ResetEvent( hEvent );

    //Lba := 0;
    s.SRB_Cmd := SC_EXEC_SCSI_CMD;
    s.SRB_HaID := HaId;
    s.SRB_Target := Target;
    s.SRB_Lun := Lun;
    s.SRB_Flags := SRB_DIR_IN or SRB_EVENT_NOTIFY;
    s.SRB_BufLen := 100;
    s.SRB_BufPointer := @Buf;
    s.SRB_SenseLen := SENSE_LEN;
    s.SRB_CDBLen := 6;
    s.SRB_PostProc := Pointer( hEvent );
    s.CDBByte[4] := SizeOf( Buf ); //100;
    s.CDBByte[0] := SCSI_INQUIRY;

    SendASPI32Command( @s );
    if S.SRB_Status = SS_PENDING then
      WaitForSingleObject( hevent, INFINITE );
    CloseHandle( hevent );

    CdRoms.CdRom[DriveNo].HaId := HaId;
    CdRoms.CdRom[DriveNo].Target := Target;
    CdRoms.CdRom[DriveNo].Lun := Lun;
    CdRoms.CdRom[DriveNo].Vendor := PChar( Copy( Buf, 8 + 1, 8 ) ); // Vendor
    CdRoms.CdRom[DriveNo].ProductId := PChar( Copy( Buf, 16 + 1, 16 ) );
    // Product ID
    CdRoms.CdRom[DriveNo].Revision := PChar( Copy( Buf, 32 + 1, 4 ) );
    // Revision
    CdRoms.CdRom[DriveNo].VendorSpec := PChar( Copy( Buf, 36 + 1, 20 ) );
    // Vendor Spec.
    CdRoms.CdRom[DriveNo].Description := CdRoms.CdRom[DriveNo].Vendor +
      CdRoms.CdRom[DriveNo].ProductId + CdRoms.CdRom[DriveNo].Revision;
    Result := CheckSenseKey( S.SenseArea );
  end
  else
    if InterfaceInstalled and NTScsiAvail and ( (UseInterface = cdiNTSCSI) or (UseInterface = cdiAutoDetect) ) then
    begin

      if ntGetNumDrives( CdRoms ) > 0 then
      begin
        //Result := sptiGetDriveInformation( DriveNo, CdRoms );
        If not sptiGetDriveInformation( DriveNo, CdRoms ) then
        begin
          for i := 0 to CdRoms.CdRomCount - 1 do
            CdRoms.CdRom[i].Description := CdRoms.CdRom[i].DriveLetter + ':\';
        end;
        Result := True;
      end;
    end;
   // else
   //   raise ENoInterFace.Create( 'No usable interface available' );
end;

{*******************************************************************************
                                                          Scan for Cd-Rom Drives
*******************************************************************************}

function GetCdRomDrives( var CdRoms : TCdRoms; UseInterface : TCDInterface ) : Boolean;
var
  hEvent : THandle;
  HaId, Target, Lun : Byte;
  HAInquiry : SRB_HAInquiry;
  GDEVBlock : SRB_GDEVBlock;
  HostCount : Integer;
  TARG : Byte;
  i : integer;
begin
  Result := False;
  if (AspiInstalled > 0) and
  ( ( (NTSCSIAvail = False) and (UseInterface = cdiAutoDetect) ) or
  ( UseInterface = cdiASPI ) ) then
  begin
    Result := TRUE;
    CdRoms.CdRomCount := 0;

    HostCount := AspiInstalled;
    if HostCount = -1 then
      Exit;

    hEvent := CreateEvent( nil, TRUE, FALSE, nil );
    // scan for cd-rom drive
    for HaId := 0 to HostCount - 1 do
    begin
      FillChar( HAInquiry, SizeOf( SRB_HAInquiry ), 0 );
      HAInquiry.SRB_Cmd := SC_HA_INQUIRY;
      HAInquiry.SRB_HaID := HaId;

      SendASPI32Command( @HAInQuiry );

      if HAInquiry.SRB_Status <> SS_COMP then
        Continue;

      TARG := HaInquiry.HA_Unique[3];
      if TARG = 0 then
        TARG := MAXTARG;

      for Target := 0 to TARG - 1 do
        for Lun := 0 to MAX_SCSI_LUNS do
        begin
          FillChar( GDEVBlock, SizeOf( SRB_GDEVBlock ), 0 );
          with GDEVBlock do
          begin
            SRB_Cmd := SC_GET_DEV_TYPE;
            SRB_HaId := HaId;
            SRB_Target := Target;
            SRB_Lun := Lun;
          end;

          ResetEvent( hEvent );
          SendASPI32Command( @GDEVBlock );

          if GDEVBlock.SRB_Status = SS_PENDING then
            WaitForSingleObject( hEvent, INFINITE );

          if ( GDEVBLOCK.SRB_Status = SS_COMP ) and
            ( GDEVBLOCK.SRB_DeviceType = DTYPE_CROM ) then
          begin
            CdRoms.CdRom[CdRoms.CdRomCount].HaId := HaId;
            CdRoms.CdRom[CdRoms.CdRomCount].Target := Target;
            CdRoms.CdRom[CdRoms.CdRomCount].Lun := Lun;
            Result := Result and GetCdRomText( CdRoms.CdRomCount,
              CdRoms, UseInterface );
            CdRoms.CdRom[CdRoms.CdRomCount].DriveLetter := Copy( UpperCase(
              GetAssignedDriveLetter( CdRoms.CdRom[CdRoms.CdRomCount].Vendor +
                ';'
              + CdRoms.CdRom[CdRoms.CdRomCount].ProductID, UseInterface ) ), 0, 1 )[1];
            Inc( CdRoms.CdRomCount );
          end;
        end;
    end;
    CloseHandle( hEvent );
  end
  else
    if InterfaceInstalled and NTScsiAvail and ( (UseInterface = cdiNTSCSI) or (UseInterface = cdiAutoDetect) ) then
    begin
      // This has to be called anyway because
      // Ha, Target and Lun have to be retrieved.
      if ntGetNumDrives( CdRoms ) > 0 then
      begin
        for i := 0 to CdRoms.CdRomCount - 1 do
        begin
          sptiGetDriveInformation( i, CdRoms );
          GetCdRomText( i, CdRoms, UseInterface );
        end;
        Result := True;
      end;
    end;
    //else
    //  raise ENoInterFace.Create( 'No usable interface available or selected interface not available' );
end;

{*******************************************************************************
                                                                        Read Toc
*******************************************************************************}

function ReadCdTOC( CdRoms : TCdRoms; DriveNo : integer; var Toc : TCdToc; UseInterface : TCDInterface ) :
  Boolean;
type
  TTocDescriptor = packed record // Fromat 0000b
    Reserved01 : Byte;
    ADR_Control : Byte;
    TrackNumber : Byte;
    Reserved02 : Byte;
    LBA : LongInt;
  end;

  TSRBToc = packed record
    TocLength : Word; // Toc Data Length
    First : Byte; // First Track/Session/Reserved Field(Hex)
    Last : Byte; // Last Track/Session/Reserved Field(Hex)
    Toc : array[0..99] of TTocDescriptor;
  end;
var
  SRB : SRB_ExecSCSICmd;
  hEvent : THandle;
  I : Integer;
  SRBToc : TSRBToc;
  SPTIToc : WCDToc;
begin
  Result := False;
  if (AspiInstalled > 0) and
  ( ( (NTSCSIAvail = False) and (UseInterface = cdiAutoDetect) ) or
  ( UseInterface = cdiASPI ) ) then
  begin
    FillChar( SRBToc, SizeOf( SRBToc ), 0 );
    FillChar( SRB, SizeOf( SRB ), 0 );

    hEvent := CreateEvent( nil, TRUE, FALSE, nil );
    ResetEvent( hEvent );
    SRB.SRB_Cmd := SC_EXEC_SCSI_CMD;
    SRB.SRB_HaID := CdRoms.CdRom[DriveNo].HaId;
    SRB.SRB_Target := CdRoms.CdRom[DriveNo].Target;
    SRB.SRB_Lun := CdRoms.CdRom[DriveNo].Lun;
    SRB.SRB_Flags := SRB_DIR_IN or SRB_EVENT_NOTIFY;
    SRB.SRB_BufLen := SizeOf( SRBToc );
    SRB.SRB_BufPointer := @SRBToc;
    SRB.SRB_SenseLen := SENSE_LEN;
    SRB.SRB_CDBLen := 10;
    SRB.SRB_PostProc := Pointer( hEvent );
    SRB.CDBByte[9] := 0; // v1.01 changed value 2 to 0
    SRB.CDBByte[8] := LoByte( Word( SRB.SRB_BufLen ) );
    SRB.CDBByte[7] := HiByte( Word( SRB.SRB_BufLen ) );
    SRB.CDBByte[6] := 0;
    SRB.CDBByte[2] := 0;
    SRB.CDBByte[1] := 2;
    SRB.CDBByte[0] := SCSI_READ_TOC;

    SendASPI32Command( @SRB );
    if SRB.SRB_Status = SS_PENDING then
      WaitForSingleObject( hEvent, INFINITE );
    CloseHandle( hEvent );

    // fill Toc structure
    FillChar( Toc, SizeOf( Toc ), 0 );
    Toc.TracksOnCD := SRBToc.Last;
    for I := 0 to Toc.TracksOnCD - 1 do
      with Toc.Tracks[I] do
      begin
        //M := HiByte( LoWord( SRBToc.Toc[I].Lba ) );
        S := LoByte( HiWord( SRBToc.Toc[I].Lba ) )+(60*HiByte( LoWord( SRBToc.Toc[I].Lba ) ));
        F := HiByte( HiWord( SRBToc.Toc[I].Lba ) );

        AudioTrack := ( SRBToc.Toc[I].ADR_Control and $0D = 0 ) or
          // 2 audio channels without pre-emphasis
        ( SRBToc.Toc[I].ADR_Control and $0D = 1 ) or
          // 2 audio channels with pre-emphasis of 50/15 µs
        ( SRBToc.Toc[I].ADR_Control and $0D = 8 ) or
          // audio channels without pre-emphasis (reserved in CD-R/RW)
        ( SRBToc.Toc[I].ADR_Control and $0D = 9 );
        // audio channels with pre-emphasis of 50/15 µs (reserved in CD-R/RW)

      end;
    //Toc.LeadOut.M := HiByte( LoWord( SRBToc.Toc[Toc.TracksOnCD].Lba ) );
   { Toc.LeadOut.S := LoByte( HiWord( SRBToc.Toc[Toc.TracksOnCD].Lba ) )+(60*HiByte( LoWord( SRBToc.Toc[Toc.TracksOnCD].Lba ) ));
    Toc.LeadOut.F := HiByte( HiWord( SRBToc.Toc[Toc.TracksOnCD].Lba ) );
    Toc.LeadOut.AudioTrack := False;     }
    Toc.Tracks[Toc.TracksOnCD].S := LoByte( HiWord( SRBToc.Toc[Toc.TracksOnCD].Lba ) )+(60*HiByte( LoWord( SRBToc.Toc[Toc.TracksOnCD].Lba ) ));
    Toc.Tracks[Toc.TracksOnCD].F := HiByte( HiWord( SRBToc.Toc[Toc.TracksOnCD].Lba ) );
    Toc.Tracks[Toc.TracksOnCD].AudioTrack := False;
    Result := not CheckSenseKey( SRB.SenseArea );
  end
  else
    if InterfaceInstalled and NTScsiAvail and ( (UseInterface = cdiNTSCSI) or (UseInterface = cdiAutoDetect) ) then
    begin
      case sptiReadToc( CdRoms, DriveNo, @SptiToc ) of
        -1 :
          begin
            ioctlReadToc( CdRoms, DriveNo, @SptiToc );
            if ( SptiToc.firstTrack = 0 ) and ( SptiToc.lastTrack = 0 ) then
            begin
              Result := False;
            end
            else
              Result := True;
          end;
        0 :
          if ( SptiToc.firstTrack = 0 ) and ( SptiToc.lastTrack = 0 ) then
          begin
          //Tured around
            Result := False;
          end
          else
            Result := True;
      end;
      ConvertToc( @SptiToc, Toc );
    end;
   // else
   //   raise ENoInterFace.Create( 'No usable interface available or selected interface not available' );
end;

function GetAssignedDriveLetter( DriveStr : string; UseInterface : TCDInterface ) : Char;

{takes the manufacturer and product ID of the CD device as string
 and returns the drive letter (under Win9x only).
 This code is donated under any Open Source License as long as you share any
changes made
 with the author. This comment must be maintained in all copies /
Modifications of the source code.
 Original Author: John Zitterkopf http://www.zittware.com }

var
  regInfo : TRegistry;
  Cnt1, Cnt2 : Integer;
  DrvType : Byte;
  ListofDrives,
    Busses : TStringList;
  Manufacturer,
    ProductID,
    DriveLetter : string;
begin

  Result := #0; {NULL char means not found}
  if (AspiInstalled > 0) and
  ( ( (NTSCSIAvail = False) and (UseInterface = cdiAutoDetect) ) or
  ( UseInterface = cdiASPI ) ) then
  begin
    {only supports Win9x at this time}

    regInfo := TRegisTry.Create;
    try
      regInfo.RootKey := HKEY_LOCAL_MACHINE;
      if regInfo.OpenKey( 'Enum\SCSI', False ) and regInfo.HasSubKeys then
      begin
        ListofDrives := TStringList.Create;
        try
          regInfo.GetKeyNames( ListOfDrives );
          for Cnt1 := 0 to ListOfDrives.Count - 1 do
          begin
            if regInfo.OpenKey( ListOfDrives[Cnt1], FALSE ) and
              regInfo.HasSubKeys then
            begin
              Busses := TStringList.Create;
              try
                regInfo.GetKeyNames( Busses );
                for Cnt2 := 0 to Busses.Count - 1 do
                begin
                  if regInfo.OpenKey( Busses[Cnt2], FALSE ) then
                    if regInfo.ValueExists( 'DeviceType' ) then
                    begin
                      regInfo.ReadBinaryData( 'DeviceType', DrvType, SizeOf(
                        DrvType ) );
                      if DrvType = 5 then
                      try {this is a CDROM device!}
                        with regInfo do
                        begin
                          Manufacturer := Trim( ReadString( 'Manufacturer' ) );
                          ProductId := Trim( ReadString( 'ProductId' ) );
                          DriveLetter := Trim( ReadString(
                            'CurrentDriveLetterAssignment' ) );
                        end;

                        if ( Pos( Manufacturer, DriveStr ) > 0 ) and
                          ( Pos( ProductId, DriveStr ) > 0 ) then
                          GetAssignedDriveLetter := DriveLetter[1];
                      except
                        on EXCEPTION do
                          GetAssignedDriveLetter := #0;
                      end;
                    end;
                  regInfo.CloseKey;
                  regInfo.OpenKey( 'Enum\SCSI' + ListOfDrives[Cnt1], FALSE );
                end;
              finally
                Busses.Free;
              end;
            end;
            regInfo.CloseKey;
            regInfo.OpenKey( 'Enum\SCSI', False );
          end; {For Cnt1}
        finally
          ListofDrives.Free;
        end;
      end;
    finally
      regInfo.Free;
    end;
  end
  else
    if InterfaceInstalled and NTScsiAvail and ( (UseInterface = cdiNTSCSI) or (UseInterface = cdiAutoDetect) ) then
    begin
      // When using SPTI, the description is the letter of the drive
      Result := DriveStr[1];
    end
    else
      raise ENoInterFace.Create( 'No usable interface available or selected interface not available' );
end;

end.

