{ *************************************************************************** }
{                                                                             }
{ Audio Tools Library                                                         }
{ Class TFPLfile - reads foobar2000 playlist files (*.fpl)                    }
{                                                                             }
{ http://mac.sourceforge.net/atl/                                             }
{ e-mail: macteam@users.sourceforge.net                                       }
{                                                                             }
{ Copyright (c) 2004-2005 by Gambit                                           }
{                                                                             }
{ Version 1.3 (24 March 2005)                                                 }
{   - unicode support                                                         }
{                                                                             }
{ Version 1.2 (11 May 2004)                                                   }
{   - fixed reading of network files (thanks to phwip)                        }
{                                                                             }
{ Version 1.1 (07 May 2004)                                                   }
{   - updated to the new foobar 0.8 .fpl format                               }
{     (only change - the 12 bytes of something changed to 28 :))              }
{                                                                             }
{ Version 1.0 (15 January 2004)                                               }
{   - reads .fpl files                                                        }
{                                                                             }
{ This library is free software; you can redistribute it and/or               }
{ modify it under the terms of the GNU Lesser General Public                  }
{ License as published by the Free Software Foundation; either                }
{ version 2.1 of the License, or (at your option) any later version.          }
{                                                                             }
{ This library is distributed in the hope that it will be useful,             }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of              }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU           }
{ Lesser General Public License for more details.                             }
{                                                                             }
{ You should have received a copy of the GNU Lesser General Public            }
{ License along with this library; if not, write to the Free Software         }
{ Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   }
{                                                                             }
{ *************************************************************************** }

unit FPLfile;

interface

uses
  Classes, SysUtils, Dialogs, StrUtils, JclUnicode, TntClasses;

type
  TFPLHeader = record
    StreamMarker: array[1..20] of Byte;
    FileCount: Cardinal;
    Nothing: Cardinal;
  end;

  // first there are 20 bytes which are always the same
  // 4 bytes - number of items/files in the fpl
  // 4 bytes - seems to be the type of filepath: 01-absolute, 03-relative
  // 4 bytes - length of the next string
  // string - 'file://' + ...
  // 28 bytes - something, ends with '@'
  // 4 bytes - number of tag fields comming (e.g. 'artist', 'title')

  // 4 bytes - length of the next string
  // string - e.g. 'Artist'
  // 4 bytes - length of the next string
  // string - e.g. 'Jay-Z'

  // ... after the last tag field value
  // 4 bytes - number of tech fields comming (e.g. 'bitrate', 'samplerate')

  // 4 bytes - length of the next string
  // string - e.g. 'bitrate'
  // 4 bytes - length of the next string
  // string - e.g. '201'

  // ... after the last tech field value
  // 4 bytes - seems to be the type of filepath: 01-absolute, 03-relative
  // 4 bytes - length of the next string
  // string - 'file://' + ...

  { Class TFPLfile }
  TFPLfile = class(TObject)
    private
      { Private declarations }
      SourceFile: TTntFileStream;
      FNumberOfFiles: Cardinal;
      FPLFileName : WideString;
      procedure GetFiles();
    public
      { Public declarations }
      property NumberOfFiles: Cardinal read FNumberOfFiles;
      function ReadFromFile(const FileName: WideString): Boolean;
      function GetFilePath(const FileNumber: Cardinal): WideString;
      function GetTrack(const FileNumber: Cardinal): String;
      function GetArtist(const FileNumber: Cardinal): WideString;
      function GetTitle(const FileNumber: Cardinal): WideString;
      function GetAlbum(const FileNumber: Cardinal): WideString;
      function GetYear(const FileNumber: Cardinal): String;
      function GetGenre(const FileNumber: Cardinal): String;
      function GetComment(const FileNumber: Cardinal): WideString;
      function GetSamplerate(const FileNumber: Cardinal): String;
      function GetChannels(const FileNumber: Cardinal): String;
      function GetBitrate(const FileNumber: Cardinal): String;
      function GetCodec(const FileNumber: Cardinal): String;
  end;

  TFPLitem = class(TObject)
    private
      { Private declarations }
      FFileName : WideString;
      FTrack : String;
      FArtist : WideString;
      FTitle : WideString;
      FAlbum : WideString;
      FYear : String;
      FGenre  : String;
      FComment : WideString;
      FSamplerate : String;
      FChannels : String;
      FLength : String;
      FBitrate : String;
      FCodec : String;
    public
      { Public declarations }
      property FileName : WideString read FFileName write FFileName;
      property Track : String read FTrack write FTrack;
      property Artist : WideString read FArtist write FArtist;
      property Title : WideString read FTitle write FTitle;
      property Album : WideString read FAlbum write FAlbum;
      property Year : String read FYear write FYear;
      property Genre  : String read FGenre write FGenre;
      property Comment : WideString read FComment write FComment;
      property Samplerate : String read FSamplerate write FSamplerate;
      property Channels : String read FChannels write FChannels;
      property Length : String read FLength write FLength;
      property Bitrate : String read FBitrate write FBitrate;
      property Codec : String read FCodec write FCodec;
  end;

var
  FPLItems: array of TFPLitem;


implementation

uses Main;

(* -------------------------------------------------------------------------- *)

function TFPLfile.ReadFromFile(const FileName: WideString): Boolean;
var
  Hdr: TFPLHeader;
begin
  { Reset and load header data from file to array }
  Result := false;
  FillChar(Hdr, SizeOf(Hdr), 0);
  FPLFileName := '';
  try
    SourceFile := TTntFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
    { Read header data }
    SourceFile.Read(Hdr, SizeOf(Hdr));
    SourceFile.Free;

    { Process data if loaded and header valid }
    if Hdr.StreamMarker[1] + Hdr.StreamMarker[2] + Hdr.StreamMarker[3] + Hdr.StreamMarker[4] = 669 then
    begin
      Result := True;
      FNumberOfFiles := Hdr.FileCount;

      SetLength(FPLItems, Hdr.FileCount+1);

      FPLFileName := FileName;
      GetFiles;
    end;
  except
    { Error }
    Result := false;
  end;
end;

(* -------------------------------------------------------------------------- *)

procedure TFPLfile.GetFiles();
var
  NumberOfFileInFPL, FieldsComming, FieldsDone: Cardinal;
  PosInFPL, ValueLength: Integer;
  ValueChar: array[1..999] of Char;
  ResultFile: WideString;
  OurReadString, FieldName : WideString;
begin
  { Reset and load header data from file to array }
  FillChar(ValueLength, SizeOf(ValueLength), 0);
  try
    SourceFile := TTntFileStream.Create(FPLFileName, fmOpenRead or fmShareDenyWrite);

    // we start at 28, the position of the first 4 byte string length
    PosInFPL := 28;
    NumberOfFileInFPL := 0;
    FieldsDone := 0;
    FieldsComming := 0;
    repeat
      // the tag fields are over now come the tech fields
      if (FieldsComming = FieldsDone) and (FieldsComming <> 0) then
      begin
        // now we need to again read the number of fields comming up (tech)
        SourceFile.Seek(PosInFPL, soFromBeginning);
        SourceFile.Read(ValueLength, SizeOf(ValueLength));

        FieldsComming := ValueLength * 2;
        //ShowMessage(LeftStr(ValueChar, ValueLength));
        PosInFPL := PosInFPL + 4;
        FieldsDone := 0;
      end;

      // length
      SourceFile.Seek(PosInFPL, soFromBeginning);
      SourceFile.Read(ValueLength, SizeOf(ValueLength));
      PosInFPL := PosInFPL + 4;
      // string
      SourceFile.Seek(PosInFPL, soFromBeginning);
      SourceFile.Read(ValueChar, ValueLength);
      PosInFPL := PosInFPL + ValueLength;

      OurReadString := LeftStr(ValueChar, ValueLength);

      if (LeftStr(ValueChar, 7) = 'file://') then
      begin
        ResultFile := OurReadString;
        // remove 'file://'
        Delete(ResultFile, 1, 7);
        // absolute or relative path
        if (ResultFile[2] = ':') or (Copy(ResultFile, 1, 2) = '\\') then
          ResultFile := UTF8ToWideString(ResultFile)
        else
          ResultFile := UTF8ToWideString(ExtractFilePath(FPLFileName) + ResultFile);
        // we have read the first file so let's remember it
        Inc(NumberOfFileInFPL);
        FPLItems[NumberOfFileInFPL] := TFPLitem.Create;
        FPLItems[NumberOfFileInFPL].FileName := ResultFile;

        // now we need to read the number of fields comming up (tag)
        PosInFPL := PosInFPL + 28;
        SourceFile.Seek(PosInFPL, soFromBeginning);
        SourceFile.Read(ValueLength, SizeOf(ValueLength));

        // * 2 because we read the field and it's value
        FieldsComming := ValueLength * 2;
        // if there are no tag fields we need to go to the tech fields
        if FieldsComming = 0 then
        begin
          PosInFPL := PosInFPL + 4;
          SourceFile.Seek(PosInFPL, soFromBeginning);
          SourceFile.Read(ValueLength, SizeOf(ValueLength));
          // * 2 because we read the field and it's value
          FieldsComming := ValueLength * 2;
        end;
        PosInFPL := PosInFPL + 4;
      end
      else
      begin
        // we are here because we have read something like 'Artist' or 'bitrate'
        if (FieldName = 'tracknumber') then
          FPLItems[NumberOfFileInFPL].Track := OurReadString
        else if (FieldName = 'Artist') then
          FPLItems[NumberOfFileInFPL].Artist := UTF8ToWideString(OurReadString)
        else if (FieldName = 'Title') then
          FPLItems[NumberOfFileInFPL].Title := UTF8ToWideString(OurReadString)
        else if (FieldName = 'Album') then
          FPLItems[NumberOfFileInFPL].Album := UTF8ToWideString(OurReadString)
        else if (FieldName = 'date') then
          FPLItems[NumberOfFileInFPL].Year := OurReadString
        else if (FieldName = 'Genre') then
          FPLItems[NumberOfFileInFPL].Genre := OurReadString
        else if (FieldName = 'Comment') then
          FPLItems[NumberOfFileInFPL].Comment := UTF8ToWideString(OurReadString)
        else if (FieldName = 'samplerate') then
          FPLItems[NumberOfFileInFPL].Samplerate := OurReadString
        else if (FieldName = 'channels') then
          FPLItems[NumberOfFileInFPL].Channels := OurReadString
        else if (FieldName = 'bitrate') then
          FPLItems[NumberOfFileInFPL].Bitrate := OurReadString
        else if (FieldName = 'codec') then
          FPLItems[NumberOfFileInFPL].Codec := OurReadString;
        
        if (OurReadString = 'tracknumber') or
           (OurReadString = 'Artist') or
           (OurReadString = 'Title') or
           (OurReadString = 'Album') or
           (OurReadString = 'date') or
           (OurReadString = 'Genre') or
           (OurReadString = 'Comment') or
           (OurReadString = 'samplerate') or
           (OurReadString = 'channels') or
           (OurReadString = 'bitrate') or
           (OurReadString = 'codec') then
          FieldName := OurReadString
        else
          FieldName := '';


        Inc(FieldsDone);
      end;
    until SourceFile.Size < (PosInFPL + 1);

    SourceFile.Free;
  except
    { Error }
    ResultFile := '';
  end;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetFilePath(const FileNumber: Cardinal): WideString;
begin
  Result := FPLItems[FileNumber].FileName;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetTrack(const FileNumber: Cardinal): String;
begin
  Result := FPLItems[FileNumber].Track;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetArtist(const FileNumber: Cardinal): WideString;
begin
  Result := FPLItems[FileNumber].Artist;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetTitle(const FileNumber: Cardinal): WideString;
begin
  Result := FPLItems[FileNumber].Title;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetAlbum(const FileNumber: Cardinal): WideString;
begin
  Result := FPLItems[FileNumber].Album;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetYear(const FileNumber: Cardinal): String;
begin
  Result := FPLItems[FileNumber].Year;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetGenre(const FileNumber: Cardinal): String;
begin
  Result := FPLItems[FileNumber].Genre;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetComment(const FileNumber: Cardinal): WideString;
begin
  Result := FPLItems[FileNumber].Comment;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetSamplerate(const FileNumber: Cardinal): String;
begin
  Result := FPLItems[FileNumber].Samplerate;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetChannels(const FileNumber: Cardinal): String;
begin
  Result := FPLItems[FileNumber].Channels;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetBitrate(const FileNumber: Cardinal): String;
begin
  Result := FPLItems[FileNumber].Bitrate;
end;

(* -------------------------------------------------------------------------- *)

function TFPLfile.GetCodec(const FileNumber: Cardinal): String;
begin
  Result := FPLItems[FileNumber].Codec;
end;

(* -------------------------------------------------------------------------- *)

end.
