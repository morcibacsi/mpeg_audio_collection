{ *************************************************************************** }
{                                                                             }
{ Audio Tools Library (Freeware)                                              }
{ Class TFLACfile - for manipulating with FLAC file information               }
{                                                                             }
{ Uses:                                                                       }
{   - Class TID3v1                                                            }
{   - Class TID3v2                                                            }
{                                                                             }
{ Copyright (c) 2001,2002 by Jurgen Faul                                      }
{ E-mail: jfaul@gmx.de                                                        }
{ http://jfaul.de/atl                                                         }
{                                                                             }
{ Version 1.1 (6 July 2003)                                                   }
{   - (Erik) Class: Vorbis comments (native comment to FLAC files) added      }
{ Version 1.0 (13 August 2002)                                                }
{   - Info: channels, sample rate, bits/sample, file size, duration, ratio    }
{   - Class TID3v1: reading & writing support for ID3v1 tags                  }
{   - Class TID3v2: reading & writing support for ID3v2 tags                  }
{                                                                             }
{ *************************************************************************** }

unit FLACfile;

interface

uses
  Classes, SysUtils, ID3v1, ID3v2, VorbisComment;

type
  TFlacHeader = record
    StreamMarker: array[1..4] of Char; //should always be 'fLaC'
    MetaDataBlockHeader: array[1..4] of Byte;
    Info: array[1..18] of Byte;
    MD5Sum: array[1..16] of Byte;
  end;

  { Class TFLACfile }
  TFLACfile = class(TObject)
  private
    { Private declarations }
    FChannels: Byte;
    FSampleRate: Integer;
    FBitsPerSample: Byte;
    FFileLength: Int64;
    FSamples: Int64;
    FID3v1: TID3v1;
    FID3v2: TID3v2;
    FVorbisComment: TVorbisComment;
    procedure FResetData;
    function FIsValid: Boolean;
    function FGetDuration: Double;
    function FGetRatio: Double;
  public
    { Public declarations }
    constructor Create; { Create object }
    destructor Destroy; override; { Destroy object }
    function ReadFromFile(const FileName: WideString): Boolean; { Load header }
    property Channels: Byte read FChannels; { Number of channels }
    property SampleRate: Integer read FSampleRate; { Sample rate (hz) }
    property BitsPerSample: Byte read FBitsPerSample; { Bits per sample }
    property FileLength: Int64 read FFileLength; { File length (bytes) }
    property Samples: Int64 read FSamples; { Number of samples }
    property ID3v1: TID3v1 read FID3v1; { ID3v1 tag data }
    property ID3v2: TID3v2 read FID3v2; { ID3v2 tag data }
    property VorbisComment: TVorbisComment read FVorbisComment; { tag data }
    property Valid: Boolean read FIsValid; { True if header valid }
    property Duration: Double read FGetDuration; { Duration (seconds) }
    property Ratio: Double read FGetRatio; { Compression ratio (%) }
  end;

implementation

uses
  WideStrings;

{ ********************** Private functions & procedures ********************* }

procedure TFLACfile.FResetData;
begin
  { Reset data }
  FChannels := 0;
  FSampleRate := 0;
  FBitsPerSample := 0;
  FFileLength := 0;
  FSamples := 0;
  FID3v1.ResetData;
  FID3v2.ResetData;
  FVorbisComment.Clear;
end;

{ --------------------------------------------------------------------------- }

function TFLACfile.FIsValid: Boolean;
begin
  { Check for right FLAC file data }
  Result :=
    (FChannels > 0) and
    (FSampleRate > 0) and
    (FBitsPerSample > 0) and
    (FSamples > 0);
end;

{ --------------------------------------------------------------------------- }

function TFLACfile.FGetDuration: Double;
begin
  { Get song duration }
  if FIsValid then
    Result := FSamples / FSampleRate
  else
    Result := 0;
end;

{ --------------------------------------------------------------------------- }

function TFLACfile.FGetRatio: Double;
begin
  { Get compression ratio }
  if FIsValid then
    Result := FFileLength / (FSamples * FChannels * FBitsPerSample / 8) * 100
  else
    Result := 0;
end;

{ ********************** Public functions & procedures ********************** }

constructor TFLACfile.Create;
begin
  { Create object }
  inherited;
  FID3v1 := TID3v1.Create;
  FID3v2 := TID3v2.Create;
  FVorbisComment := TVorbisComment.Create;
  FResetData;
end;

{ --------------------------------------------------------------------------- }

destructor TFLACfile.Destroy;
begin
  { Destroy object }
  FID3v1.Free;
  FID3v2.Free;
  FVorbisComment.Free;
  inherited;
end;

{ --------------------------------------------------------------------------- }

function TFLACfile.ReadFromFile(const FileName: WideString): Boolean;
var
  Source: TFileStreamW;
  Header: TFlacHeader;
  MetaDataBlockHeader: array[1..4] of Byte;
  BlockLength: Integer;
begin
  { Reset and load header data from file to array }
  FResetData;
  FillChar(Header, SizeOf(Header), 0);
  Result := false;
  try
    { Set read-access and open file }
    Source := TFileStreamW.Create(FileName, fmOpenRead);
    { Read header data }
    Source.Read(Header, SizeOf(Header));
    FFileLength := Source.Size;
    { Process data if loaded and header valid }
    if Header.StreamMarker = 'fLaC' then
      with Header do
      begin
        FChannels := Info[13] shr 1 and $7 + 1;
        FSampleRate := Info[11] shl 12 or Info[12] shl 4 or Info[13] shr 4;
        FBitsPerSample := Info[13] and 1 shl 4 or Info[14] shr 4 + 1;
        FSamples := Info[15] shl 24 or Info[16] shl 16 or Info[17] shl 8 or
          Info[18];
        Result := true;
      end;
    MetaDataBlockHeader[1] := Header.MetaDataBlockHeader[1];
    while MetaDataBlockHeader[1] and $80 = 0 do //more metadata blocks available
    begin
      Source.Read(MetaDataBlockHeader, 4);
      BlockLength := MetaDataBlockHeader[2] shl 16 or
        MetaDataBlockHeader[3] shl 8 or MetaDataBlockHeader[4];
      if MetaDataBlockHeader[1] and $7F = 4 then //found a vorbis comment block
      begin
        FVorbisComment.Clear;
        FVorbisComment.LoadFromStream(Source);
        break;
      end
      else
        Source.Seek(Blocklength, soCurrent); //skip unknown metadata blocks
    end;
    Source.Free;
  except
    { Error }
    Result := false;
  end;
end;

end.

