{ *************************************************************************** }
{                                                                             }
{ Audio Tools Library (Freeware)                                              }
{ Class TMPEGplus - for manipulating with MPEGplus file information           }
{                                                                             }
{ Uses:                                                                       }
{   - Class TID3v1                                                            }
{   - Class TID3v2                                                            }
{   - Class TAPEtag                                                           }
{                                                                             }
{ Copyright (c) 2001,2002 by Jurgen Faul                                      }
{ E-mail: jfaul@gmx.de                                                        }
{ http://jfaul.de/atl                                                         }
{                                                                             }
{ Version 1.7 (7 June 2003) by Gambit                                         }
{   - --quality 0 to 10 detection (all profiles)                              }
{   - Stream Version 7.1 detected and supported                               }
{                                                                             }
{ Version 1.6 (8 February 2002)                                               }
{   - Fixed bug with property Corrupted                                       }
{                                                                             }
{ Version 1.2 (2 August 2001)                                                 }
{   - Some class properties added/changed                                     }
{                                                                             }
{ Version 1.1 (26 July 2001)                                                  }
{   - Fixed reading problem with "read only" files                            }
{                                                                             }
{ Version 1.0 (23 May 2001)                                                   }
{   - Support for MPEGplus files (stream versions 4-7)                        }
{   - Class TID3v1: reading & writing support for ID3v1 tags                  }
{   - Class TID3v2: reading & writing support for ID3v2 tags                  }
{   - Class TAPEtag: reading & writing support for APE tags                   }
{                                                                             }
{ *************************************************************************** }

unit MPEGplus;

interface

uses
  Classes, SysUtils, ID3v1, ID3v2, APEtag, WideStrings;

const
  { Used with ChannelModeID property }
  MPP_CM_STEREO = 1;                                  { Index for stereo mode }
  MPP_CM_JOINT_STEREO = 2;                      { Index for joint-stereo mode }

  { Channel mode names }
  MPP_MODE: array [0..2] of string = ('Unknown', 'Stereo', 'Joint Stereo');

  { Used with ProfileID property }
  MPP_PROFILE_QUALITY0 = 9;                           { '--quality 0' profile }
  MPP_PROFILE_QUALITY1 = 10;                           { '--quality 1' profile }
  MPP_PROFILE_TELEPHONE = 11;                            { 'Telephone' profile }
  MPP_PROFILE_THUMB = 1;                             { 'Thumb' (poor) quality }
  MPP_PROFILE_RADIO = 2;                           { 'Radio' (normal) quality }
  MPP_PROFILE_STANDARD = 3;                       { 'Standard' (good) quality }
  MPP_PROFILE_XTREME = 4;                      { 'Xtreme' (very good) quality }
  MPP_PROFILE_INSANE = 5;                      { 'Insane' (excellent) quality }
  MPP_PROFILE_BRAINDEAD = 6;                { 'BrainDead' (excellent) quality }
  MPP_PROFILE_QUALITY9 = 7;               { '--quality 9' (excellent) quality }
  MPP_PROFILE_QUALITY10 = 8;             { '--quality 10' (excellent) quality }
  MPP_PROFILE_UNKNOWN = 0;                                  { Unknown profile }

  { Profile names }
  MPP_PROFILE: array [0..11] of string =
    ('Unknown', 'Thumb', 'Radio', 'Standard', 'Xtreme', 'Insane', 'BrainDead',
     'Above Braindead', 'Above Braindead', 'Below Telephone', 'Below Telephone',
     'Telephone');

type
  { Class TMPEGplus }
  TMPEGplus = class(TObject)
    private
      { Private declarations }
      FValid: Boolean;
      FChannelModeID: Byte;
      FFileSize: Integer;
      FFrameCount: Integer;
      FBitRate: Word;
      FStreamVersion: Byte;
      FProfileID: Byte;
      FID3v1: TID3v1;
      FID3v2: TID3v2;
      FAPEtag: TAPEtag;
      procedure FResetData;
      function FGetChannelMode: string;
      function FGetBitRate: Word;
      function FGetProfile: string;
      function FGetDuration: Double;
      function FIsCorrupted: Boolean;
    public
      { Public declarations }
      constructor Create;                                     { Create object }
      destructor Destroy; override;                          { Destroy object }
      function ReadFromFile(const FileName: WideString): Boolean;{Load header }
      property Valid: Boolean read FValid;             { True if header valid }
      property ChannelModeID: Byte read FChannelModeID;   { Channel mode code }
      property ChannelMode: string read FGetChannelMode;  { Channel mode name }
      property FileSize: Integer read FFileSize;          { File size (bytes) }
      property FrameCount: Integer read FFrameCount;       { Number of frames }
      property BitRate: Word read FGetBitRate;                     { Bit rate }
      property StreamVersion: Byte read FStreamVersion;      { Stream version }
      property ProfileID: Byte read FProfileID;                { Profile code }
      property Profile: string read FGetProfile;               { Profile name }
      property ID3v1: TID3v1 read FID3v1;                    { ID3v1 tag data }
      property ID3v2: TID3v2 read FID3v2;                    { ID3v2 tag data }
      property APEtag: TAPEtag read FAPEtag;                   { APE tag data }
      property Duration: Double read FGetDuration;       { Duration (seconds) }
      property Corrupted: Boolean read FIsCorrupted; { True if file corrupted }
  end;

implementation

const
  { ID code for stream version 7 and 7.1 }
  STREAM_VERSION_7_ID = 120279117;                   { 120279117 = 'MP+' + #7 }
  STREAM_VERSION_71_ID = 388714573;                 { 388714573 = 'MP+' + #23 }

type
  { File header data - for internal use }
  HeaderRecord = record
    ByteArray: array [1..12] of Byte;                    { Data as byte array }
    IntegerArray: array [1..3] of Integer;            { Data as integer array }
    FileSize: Integer;                                            { File size }
    ID3v2Size: Integer;                              { ID3v2 tag size (bytes) }
  end;

{ ********************* Auxiliary functions & procedures ******************** }

function ReadHeader(const FileName: WideString; var Header: HeaderRecord): Boolean;
var
  Source: TFileStreamW;
  Transferred: Integer;
begin
  try
    Result := false;
    { Set read-access and open file }
    Source := TFileStreamW.Create(FileName, fmOpenRead);
    Source.Seek(Header.ID3v2Size, soFromBeginning);
    { Read header and get file size }
    Transferred := Source.Read(Header, 12);
    Header.FileSize := Source.Size;
    { if transfer is not complete }
    if Transferred >= 12 then 
    begin
      Move(Header.ByteArray, Header.IntegerArray, SizeOf(Header.ByteArray));
      Result := true;
    end;
  finally
    Source.Free;
  end;
end;

{ --------------------------------------------------------------------------- }

function GetStreamVersion(const Header: HeaderRecord): Byte;
begin
  { Get MPEGplus stream version }
  if Header.IntegerArray[1] = STREAM_VERSION_7_ID then
    Result := 7
  else if Header.IntegerArray[1] = STREAM_VERSION_71_ID then
  Result := 71
  else
    case (Header.ByteArray[2] mod 32) div 2 of
      3: Result := 4;
      7: Result := 5;
      11: Result := 6
      else Result := 0;
    end;
end;

{ --------------------------------------------------------------------------- }

function GetChannelModeID(const Header: HeaderRecord): Byte;
begin
  if (GetStreamVersion(Header) = 7) or (GetStreamVersion(Header) = 71) then
    { Get channel mode for stream version 7 }
    if (Header.ByteArray[12] mod 128) < 64 then Result := MPP_CM_STEREO
    else Result := MPP_CM_JOINT_STEREO
  else
    { Get channel mode for stream version 4-6 }
    if (Header.ByteArray[3] mod 128) = 0 then Result := MPP_CM_STEREO
    else Result := MPP_CM_JOINT_STEREO;
end;

{ --------------------------------------------------------------------------- }

function GetFrameCount(const Header: HeaderRecord): Integer;
begin
  { Get frame count }
  case GetStreamVersion(Header) of
    4: Result := Header.IntegerArray[2] shr 16;
    5..71: Result := Header.IntegerArray[2];
    else Result := 0;
  end;
end;

{ --------------------------------------------------------------------------- }

function GetBitRate(const Header: HeaderRecord): Word;
begin
  { Try to get bit rate }
  case GetStreamVersion(Header) of
    4, 5: Result := Header.IntegerArray[1] shr 23;
    else Result := 0;
  end;
end;

{ --------------------------------------------------------------------------- }

function GetProfileID(const Header: HeaderRecord): Byte;
begin
  Result := MPP_PROFILE_UNKNOWN;
  { Get MPEGplus profile (exists for stream version 7 only) }
  if (GetStreamVersion(Header) = 7) or (GetStreamVersion(Header) = 71) then
    case Header.ByteArray[11] of
       80: Result := MPP_PROFILE_QUALITY0;
       96: Result := MPP_PROFILE_QUALITY1;
      112: Result := MPP_PROFILE_TELEPHONE;
      128: Result := MPP_PROFILE_THUMB;
      144: Result := MPP_PROFILE_RADIO;
      160: Result := MPP_PROFILE_STANDARD;
      176: Result := MPP_PROFILE_XTREME;
      192: Result := MPP_PROFILE_INSANE;
      208: Result := MPP_PROFILE_BRAINDEAD;
      224: Result := MPP_PROFILE_QUALITY9;
      240: Result := MPP_PROFILE_QUALITY10;
    end;
end;

{ ********************** Private functions & procedures ********************* }

procedure TMPEGplus.FResetData;
begin
  FValid := false;
  FChannelModeID := 0;
  FFileSize := 0;
  FFrameCount := 0;
  FBitRate := 0;
  FStreamVersion := 0;
  FProfileID := MPP_PROFILE_UNKNOWN;
  FID3v1.ResetData;
  FID3v2.ResetData;
  FAPEtag.ResetData;
end;

{ --------------------------------------------------------------------------- }

function TMPEGplus.FGetChannelMode: string;
begin
  Result := MPP_MODE[FChannelModeID];
end;

{ --------------------------------------------------------------------------- }

function TMPEGplus.FGetBitRate: Word;
var
  CompressedSize: Integer;
begin
  Result := FBitRate;
  { Calculate bit rate if not given }
  CompressedSize := FFileSize - FID3v2.Size - FAPEtag.Size;
  if FID3v1.Exists then Dec(FFileSize, 128);
  if (Result = 0) and (FFrameCount > 0) then
    Result := Round(CompressedSize * 8 * 44.1 / FFRameCount / 1152);
end;

{ --------------------------------------------------------------------------- }

function TMPEGplus.FGetProfile: string;
begin
  Result := MPP_PROFILE[FProfileID];
end;

{ --------------------------------------------------------------------------- }

function TMPEGplus.FGetDuration: Double;
begin
  { Calculate duration time }
  Result := FFRameCount * 1152 / 44100;
end;

{ --------------------------------------------------------------------------- }

function TMPEGplus.FIsCorrupted: Boolean;
begin
  { Check for file corruption }
  Result := (FValid) and ((FGetBitRate < 16) or (FGetBitRate > 480));
end;

{ ********************** Public functions & procedures ********************** }

constructor TMPEGplus.Create;
begin
  inherited;
  FID3v1 := TID3v1.Create;
  FID3v2 := TID3v2.Create;
  FAPEtag := TAPEtag.Create;
  FResetData;
end;

{ --------------------------------------------------------------------------- }

destructor TMPEGplus.Destroy;
begin
  FID3v1.Free;
  FID3v2.Free;
  FAPEtag.Free;
  inherited;
end;

{ --------------------------------------------------------------------------- }

function TMPEGplus.ReadFromFile(const FileName: WideString): Boolean;
var
  Header: HeaderRecord;
begin
  { Reset data and load header from file to variable }
  FResetData;
  FillChar(Header, SizeOf(Header), 0);
  { At first try to load ID3v2 tag data, then header }
  if FID3v2.ReadFromFile(FileName) then Header.ID3v2Size := FID3v2.Size;
  Result := ReadHeader(FileName, Header);
  { Process data if loaded and file valid }
  if (Result) and (Header.FileSize > 0) and (GetStreamVersion(Header) > 0) then
  begin
    FValid := true;
    { Fill properties with header data }
    FChannelModeID := GetChannelModeID(Header);
    FFileSize := Header.FileSize;
    FFrameCount := GetFrameCount(Header);
    FBitRate := GetBitRate(Header);
    FStreamVersion := GetStreamVersion(Header);
    FProfileID := GetProfileID(Header);
    FID3v1.ReadFromFile(FileName);
    FAPEtag.ReadFromFile(FileName);
  end;
end;

end.
