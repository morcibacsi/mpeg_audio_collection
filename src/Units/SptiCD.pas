unit SptiCD;

interface
uses
  Dialogs,
  Windows,
  AspiCD,
  SysUtils;

const
  OS_UNKNOWN = -1;
  OS_WIN95 = 0;
  OS_WIN98 = 1;
  OS_WINNT35 = 2;
  OS_WINNT4 = 3;
  OS_WIN2K = 4;
  OS_WINXP = 5;

type
  ENotAdmin = Exception;

  NTSCSIDRIVE = record
    ha : byte;
    tgt : byte;
    lun : byte;
    driveLetter : Char; //Was byte
    bUsed : Bool;
    hDevice : THandle;
    inqData : array[0..36 - 1] of byte;
  end;
  PNTSCSIDRIVE = ^NTSCSIDRIVE;

  SCSI_ADDRESS = record
    Length : LongInt;
    PortNumber : Byte;
    PathId : Byte;
    TargetId : Byte;
    Lun : Byte;
  end;
  PSCSI_ADDRESS = ^SCSI_ADDRESS;

  WTOCTRACK = record
    rsvd : BYTE;
    ADR : BYTE;
    trackNumber : BYTE;
    rsvd2 : BYTE;
    addr : array[0..4 - 1] of BYTE;
  end {TOCTRACK};
  PWTOCTRACK = ^WTOCTRACK;

  WCDTOC = record
    tocLen : Word;
    firstTrack : BYTE;
    lastTrack : BYTE;
    tracks : array[0..100 - 1] of WTOCTRACK;
  end {TOC};
  PWCDTOC = ^WCDTOC;
  LPWCDTOC = ^WCDTOC;

function sptiGetDriveInformation( i : byte; var CdRoms : TCdRoms ) : Boolean;
function sptiReadTOC( CdRoms : TCdRoms; driveNo : integer; t : PWCDTOC ) :
  integer;
function ioctlReadTOC( CdRoms : TCdRoms; driveNo : integer; t : PWCDTOC ) :
  integer;
function ntGetNumDrives( var CDRoms : TCDRoms ) : integer;
function getOsVersion : integer;
procedure ConvertTOC( tocIn : PWCDTOC; var TocOut : TCDToc );
implementation

uses CDROMIOCTL,
  SCSIDEFS;

function sptiReadTOC( CdRoms : TCdRoms; driveNo : integer; t : PWCDTOC ) :
  integer;
var
  hDrive : THandle;
  length : Cardinal;
  buf : array[0..31] of Char;
  retVal : integer;
  dwReturned : Cardinal;
  swb : SCSI_PASS_THROUGH_DIRECT_WITH_BUFFER;
  dwFlags : LongWord;
  text : PChar;
  DummyStr : array [0 .. 63] of char;
  dwError : Cardinal;
begin
  dwFlags := GENERIC_READ;
  retVal := 0;
  //Text := nil;
  Text := @DummyStr;

  if getOsVersion >= OS_WIN2K then
    dwFlags := dwFlags or GENERIC_WRITE;

  StrPCopy( @buf, Format( '\\.\%s:', [
    CdRoms.CdRom[DriveNo].DriveLetter
      ] ) );
  hDrive := CreateFile( buf, dwFlags, FILE_SHARE_READ, nil,
    OPEN_EXISTING, 0, 0 );
  if hDrive = INVALID_HANDLE_VALUE then
  begin
    // It seems that with no Administrator privileges
    // the handle value will be invalid
    Result := -1;
    Exit;
  end;

  dwReturned := 0;
  length := sizeof( SCSI_PASS_THROUGH_DIRECT_WITH_BUFFER );
  ZeroMemory( t, sizeof( WCDTOC ) );
  ZeroMemory( @swb, sizeof( swb ) );
  swb.spt.Length := sizeof( SCSI_PASS_THROUGH );
  swb.spt.CdbLength := 10;
  swb.spt.DataIn := SCSI_IOCTL_DATA_IN;
  swb.spt.DataTransferLength := sizeof( WCDTOC );
  swb.spt.TimeOutValue := 5;
  swb.spt.DataBuffer := t;
  swb.spt.SenseInfoOffset :=
    SizeOf( swb.spt ) + SizeOf( swb.Filler );
  swb.spt.Cdb[0] := $43; // read TOC
  swb.spt.Cdb[1] := $02; // MSF mode
  swb.spt.Cdb[7] := $03;
  swb.spt.Cdb[8] := $24;
  if not DeviceIoControl( hDrive,
    IOCTL_SCSI_PASS_THROUGH_DIRECT,
    @swb,
    length,
    @swb,
    length,
    dwReturned,
    nil ) then
  begin
    retVal := -1;
  end;

  if retVal < 0 then
  begin
    dwError := GetLastError( );
    if dwError = 5 then
    begin
      (*  ERROR_ACCESS_DENIED
          MessageBox( 0,
            'Error: you must have Administor privileges to use SPTI under Win2000/XP',
            'Error', 0 );
      *)
      raise ENotAdmin.Create(
        'You must have Administor privileges to use SPTI under Win2000/XP; falling back to IOCTL. This may cause erroneous results if a Mixed-Mode CD is in the drive.' );
      ZeroMemory( t, sizeof( WCDTOC ) );
      retVal := ioctlReadToc( CdRoms, driveNo, t );
    end
    else
      if dwError = 1117 then
      begin
        // catch the generic device IO error
        (*
        MessageBox( 0,
          'Error: ERROR_IO_DEVICE reported by the drive (no CD in drive?)',
          'Error', 0 );
        *)
        //RetVal = -2;
        ZeroMemory( t, sizeof( WCDTOC ) );
         { FVC }
     end
     else
       if dwError = 1450 then
       (* ERROR_NO_SYSTEM_RESOURCES *)
         { do nothing }
        { FVC }
      else
      begin
        StrPCopy( text, Format( 'IO Error: %d' + #10#13, [dwError] ) );
        MessageBox( 0, text, 'Error', 0 );
      end;
  end;

  CloseHandle( hDrive );
  Result := retVal;
end;

function ioctlReadTOC( CdRoms : TCdRoms; driveNo : integer; t : PWCDTOC ) :
  integer;
var
  hDrive : THandle;
  buf : array[0..31] of Char;
  retVal : integer;
  dwReturned : DWord;
begin

  retVal := 0;

  StrPCopy( @buf, Format( '\\.\%s:', [
    CdRoms.CdRom[DriveNo].DriveLetter
      ] ) );
  hDrive := CreateFile( buf, GENERIC_READ, FILE_SHARE_READ, nil,
    OPEN_EXISTING, 0, 0 );
  if ( hDrive = INVALID_HANDLE_VALUE ) then
  begin
    Result := -1;
    Exit;
  end;

  dwReturned := 0;
  ZeroMemory( t, sizeof( WCDTOC ) );
  if not DeviceIoControl( hDrive,
    IOCTL_CDROM_READ_TOC,
    nil,
    0,
    t,
    sizeof( t^ ),
    dwReturned,
    nil ) then
  begin
    retVal := -1;
  end;

  CloseHandle( hDrive );
  Result := retVal;
end;

(************************************************************************
 * NT/2000 layer (common to IOCTL_CDROM and SPTI interfaces
 ************************************************************************)

function ntGetNumDrives( var CDRoms : TCDRoms ) : integer;
var
  i : integer;
  szDrives : array[0..105] of Char;
  p : PChar;
  //  s : string;
begin

  //ZeroMemory( @CdRoms.CdRom, sizeof( CdRoms.CdRom ) );
  CdRoms.CdRomCount := 0;

  ZeroMemory( @szDrives, 106 );
  GetLogicalDriveStrings( 105, szDrives );

  p := szDrives;
  i := 0;

  while p^ <> '' do
  begin
    if GetDriveType( p ) = DRIVE_CDROM then
    begin
      CdRoms.CdRom[i].DriveLetter := p^; // + ':\';
      i := CdRoms.CdRomCount + 1;
      CdRoms.CdRomCount := CdRoms.CdRomCount + 1;
    end;
    p := p + lstrlen( p ) + 1;
  end;

  Result := CdRoms.CdRomCount;
end;

function getOsVersion : integer;
var
  os : OSVERSIONINFO;
begin
  ZeroMemory( @os, sizeof( os ) );
  os.dwOSVersionInfoSize := sizeof( os );
  GetVersionEx( os );

  if os.dwPlatformId = VER_PLATFORM_WIN32_NT then
  begin
    if ( os.dwMajorVersion = 3 ) and ( os.dwMinorVersion >= 51 ) then
    begin
      Result := OS_WINNT35;
      Exit;
    end
    else
      if os.dwMajorVersion = 4 then
      begin
        Result := OS_WINNT4;
        Exit;
      end
      else
        if ( os.dwMajorVersion = 5 ) and ( os.dwMinorVersion = 0 ) then
        begin
          Result := OS_WIN2K;
          Exit;
        end
        else
        begin
          Result := OS_WINXP;
          Exit;
        end;
  end
  else
    if os.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
    begin
      if os.dwMinorVersion = 0 then
      begin
        Result := OS_WIN95;
        Exit;
      end
      else
      begin
        Result := OS_WIN98;
        Exit;
      end;
    end;

  Result := OS_UNKNOWN;
end;

procedure ConvertTOC( tocIn : PWCDTOC; var TocOut : TCDToc );
var
  t1, t2 : PWTOCTRACK;
  i : integer;
  numTracks : integer;
begin

  if tocIn = nil then
    Exit;

  numTracks := tocIn^.lastTrack - tocIn^.firstTrack + 1;

  TocOut.TracksOnCD := numTracks;

  for i := 0 to numTracks - 1 do
  begin
    t1 := @( TocIn^.tracks[i] );

    //TocOut.Tracks[i].M := t1^.addr[1];
    TocOut.Tracks[i].S := t1^.addr[2]+(60*t1^.addr[1]);
    TocOut.Tracks[i].F := t1^.addr[3];
    TocOut.Tracks[i].AudioTrack :=
      ( ( t1^.ADR and $0D ) = 0 ) or
      ( ( t1^.ADR and $0D ) = 1 ) or
      ( ( t1^.ADR and $0D ) = 8 ) or
      ( ( t1^.ADR and $0D ) = 9 );
  end;

  t2 := @( TocIn^.tracks[numTracks] );

  //TocOut.LeadOut.M := t2^.addr[1];
 { TocOut.LeadOut.S := t2^.addr[2]+(60*t2^.addr[1]);
  TocOut.LeadOut.F := t2^.addr[3];
  TocOut.LeadOut.AudioTrack := False;}
  TocOut.tracks[numTracks].S := t2^.addr[2]+(60*t2^.addr[1]);
  TocOut.tracks[numTracks].F := t2^.addr[3];
  TocOut.tracks[numTracks].AudioTrack := False;

end;

function sptiGetDriveInformation( i : byte; var CdRoms : TCdRoms ) : Boolean;
var
  fh : THandle;
  buf : array[0..1023] of Char;
  buf2 : array[0..31] of Char;
  status : Bool;
  pswb : PSCSI_PASS_THROUGH_DIRECT_WITH_BUFFER;
  pscsiAddr : PSCSI_ADDRESS;
  length, returned : integer;
  inqData : array[0..99] of Char; // was array[0..99] of Byte;
  dwFlags : DWord;
  DriveString : PChar;
begin
  Result := True;
  dwFlags := GENERIC_READ;

  if getOsVersion >= OS_WIN2K then
    dwFlags := dwFlags or GENERIC_WRITE;

  StrPCopy( @buf2, Format( '\\.\%s:', [CdRoms.CdRom[i].DriveLetter] ) );

  fh := CreateFile( buf2, dwFlags, FILE_SHARE_READ, nil,
    OPEN_EXISTING, 0, 0 );
  if fh = INVALID_HANDLE_VALUE then
  begin
    // It seems that with no Administrator privileges
    // the handle value will be invalid
    Result := False;
    Exit;
  end;

  (*
   * Get the drive inquiry data
   *)
  ZeroMemory( @buf, 1024 );
  ZeroMemory( @inqData, 100 );
  pswb := PSCSI_PASS_THROUGH_DIRECT_WITH_BUFFER( @buf );
  pswb^.spt.Length := sizeof( SCSI_PASS_THROUGH );
  pswb^.spt.CdbLength := 6;
  pswb^.spt.SenseInfoLength := 24;
  pswb^.spt.DataIn := SCSI_IOCTL_DATA_IN;
  pswb^.spt.DataTransferLength := 100;
  pswb^.spt.TimeOutValue := 2;
  pswb^.spt.DataBuffer := @inqData;
  pswb^.spt.SenseInfoOffset := SizeOf( pswb^.spt ) + SizeOf( pswb^.Filler );
  pswb^.spt.Cdb[0] := $12;
  pswb^.spt.Cdb[4] := 100;

  length := sizeof( SCSI_PASS_THROUGH_DIRECT_WITH_BUFFER );
  status := DeviceIoControl( fh,
    IOCTL_SCSI_PASS_THROUGH_DIRECT,
    pswb,
    length,
    pswb,
    length,
    Cardinal( returned ),
    nil );

  if not status then
  begin
    CloseHandle( fh );
    Result := False;
    Exit;
  end;

  DriveString := @inqData;
  Inc( DriveString, 8 );

  CdRoms.CdRom[i].Vendor := Copy( DriveString, 1, 8 ); // Vendor
  CdRoms.CdRom[i].ProductId := Copy( DriveString, 8 + 1, 16 );
  // Product ID
  CdRoms.CdRom[i].Revision := Copy( DriveString, 24 + 1, 4 );
  // Revision
  CdRoms.CdRom[i].VendorSpec := Copy( DriveString, 28 + 1, 20 );
  // Vendor Spec.
  CdRoms.CdRom[i].Description := CdRoms.CdRom[i].Vendor +
    CdRoms.CdRom[i].ProductId + CdRoms.CdRom[i].Revision;

  (*
   * get the address (path/tgt/lun) of the drive via IOCTL_SCSI_GET_ADDRESS
   *)
  ZeroMemory( @buf, 1024 );
  pscsiAddr := PSCSI_ADDRESS( @buf );
  pscsiAddr^.Length := sizeof( SCSI_ADDRESS );
  if ( DeviceIoControl( fh, IOCTL_SCSI_GET_ADDRESS, nil, 0,
    pscsiAddr, sizeof( SCSI_ADDRESS ), Cardinal( returned ),
    nil ) ) then
  begin
    CDRoms.CdRom[i].HaId := pscsiAddr^.PortNumber;
    CDRoms.CdRom[i].Target := pscsiAddr^.TargetId;
    CDRoms.CdRom[i].Lun := pscsiAddr^.Lun;
  end
  else
  begin
    CloseHandle( fh );
    Result := False;
    Exit;
  end;

  CloseHandle( fh );
end;

end.

