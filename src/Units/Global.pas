unit Global;

interface

uses
	ID3v1, ID3v2, APEtag, MPEGplus, OptimFROG, Dialogs, FileCtrl, SysUtils,
  ComCtrls, StdCtrls, Windows, Masks;

type
  // volume info is saved here
  // in 2.91 increased from 6 to 7
  // because of the volume type info
	DataArray = array [1..7] of int64;

	TagArray = array [1..6] of string;
	PropertyArray = array [1..6] of array [1..3] of byte;
	MatchArray = array [1..6] of boolean;
	RowColArray = array [1..20] of boolean;
  RowColIndexArray = array [1..16] of integer;

var
	AuthorName: string = 'MAC Team';
	AppTitle: string = 'MPEG Audio Collection';
  AppTitleShort: string = 'MAC';
	////////////////////////////
	AVersion: string = '2.91 alpha8';
  ADate: string = 'August 2003';
	////////////////////////////
  AppCopyright: string = 'Freeware, copyright by Jurgen Faul && MAC Team';
	Homepage: string = 'http://sourceforge.net/projects/mac';
	EMail: string = 'macteam@users.sourceforge.net';
  MACHelpFile: string = 'mac.hlp';
	InfoFile: string = 'info.txt';
	HistoryFile: string = 'history.txt';
	LicenseFile: string = 'license.txt';
  FilterFile: string = 'mac.flt';
  CheatModeWarning: string = 'Cheat mode enabled. You can do more now!';

	DefaultExt: string = 'col';
	OldExt: string = 'mac';
	LanguageExt: string = 'lng';
  LanguageDir: string = 'Language';
	PlaylistExt1: string = 'm3u';
	PlaylistExt2: string = 'pls';
	TextExt: string = 'txt';
	DIFExt: string = 'dif';
  HTMLExt: string = 'html';
  HTMExt: string = 'htm';

	FileMask: string = '*.mpa;*.mp1;*.mp2;*.mp3';
  MPPFileMask: string = '*.mp+;*.mpc';
  VQFExt: string = 'vqf';
  WMAExt: string = 'wma';
  OGGExt: string = 'ogg';
  WAVExt: string = 'wav';
  WavPackExt: string = 'wv'; 
  FlacMask: string = '*.flac';
  FlacMaskObj: TMask;
  OfrMask: string = '*.ofr';
  OfrMaskObj: TMask;
  AacMask: string = '*.aac';
  AacMaskObj: TMask;
  MonkeyMask: string = '*.mac;*.ape';
	PlaylistFile: string = 'mac.m3u';
  CueFile: string = '.cue';
  PlaylistMask: string = '*.fpl;*.m3u8;*.m3u;*.pls';
  TextMask: string = '*.txt;*.nfo;*.log';
  ExeMask: string = '*.exe;*.com';
  ComprMask: string = '*.001;*.7z;*.ace;*.arj;*.bz;*.bz2;*.cab;*.cpio;*.deb;' +
  '*.gz;*.jar;*.lha;*.lzh;*.rar;*.rpm;*.tar;*.tbz;*.tbz2;*.tgz;*.uu;*.uue;*.xxe;*.zip';
  DllMask: string = '*.dll;*.sys;*.drv;*.ocx;*.cpl;*.vxd';
  IniMask: string = '*.inf;*.ini;*.cfg';
  BatMask: string = '*.bat';
  HtmlMask: string = '*.htm;*.html';
  ImageMask: string = '*.ani;*.b3d;*.bmp;*.dib;*.cam;*.clp;*.crw;*.cur;*.dcm;' +
  '*.acr;*.dcx;*.djvu;*.iw44;*.ecw;*.emf;*.eps;*.fpx;*.fsh;*.g3;*.gif;*.icl;' +
  '*.ico;*.ics;*.ids;*.iff;*.lbm;*.img;*.jp2;*.jpc;*.j2k;*.jpf;*.jpg;*.jpeg;' +
  '*.jpe;*.kdc;*.ldf;*.lwf;*.mng;*.jng;*.nlm;*.nol;*.ngg;*.gsm;*.pbm;*.pcd;' +
  '*.pcx;*.pgm;*.png;*.ppm;*.psd;*.psp;*.ras;*.sun;*.raw;*.rle;*.sff;*.sfw;' +
  '*.sgi;*.rgb;*.sid;*.swf;*.tga;*.tif;*.tiff;*.wbmp;*.wmf;*.xbm;*.xpm';

  SupportedExtension : String = '*.mpa;*.mp1;*.mp2;*.mp3;*.mp+;*.mpc;*.vqf;' +
  '*.wma;*.ogg;*.wav;*.mac;*.ape;*.flac;*.ofr;*.aac;*.wv';

	RootD: string;
  FirstDrive: integer;

	Tree: TTreeView;
	TempTree: TTreeView;
	TempList: TListBox;
	Lang: TListBox;
	DirList: TDirectoryListBox;
	FileList: TFileListBox;

	DataIsChanged: boolean = false;

	CurrentCollection: string = '';

	FindArea: integer = 0;

  LastNameText: array [1..6] of string = ('', '', '', '', '', '');
	NameArea: integer = 1;
	NameCase: boolean = false;

	Prop: PropertyArray =  ((1, 0, 0),
													(1, 0, 2),
													(1, 0, 0),
													(1, 2, 0),
													(1, 0, 2),
													(0, 0, 0));

	TagText: TagArray = ('', '', '', '', '', '');

  DuplicateArea: integer = 1;

	AutoOpen: boolean = true;
	UseWindowSettings: boolean = true;
	LangName: string = '';

	RowCol: RowColArray = (false, false, true, false, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, true);
	RowColIndex: RowColIndexArray = (1, 2, 3, 13, 14, 15, 16, 4, 5, 6, 7, 8, 9, 10, 11, 12);
	RFormat: integer = 1;
  RScanning: integer = 1;
	LastReportFile: string = '';
  RSorting: boolean = true;
	ItemNumeration: boolean = false;
	ReportSummary: boolean = false;

	LastOpenDir: string = '';
	LastSaveDir: string = '';

	CompareName: boolean = true;
	CompareProperty: boolean = false;
  CompareTag: boolean = false;

  LastCol: array [1..5] of string = ('', '', '', '', '');

  LastDrive: string = '';
  LastZoom: integer = 4;
  FontName: string = 'Arial';
  FontSize: integer = 36;
  FontColor: integer = 0;
  FontCharSet: integer = 0;
  FontStyle: array [1..4] of boolean = (false, false, false, false);
  IStretch: array [1..2] of integer = (100, 100);

  ColumnToSorting: integer = 1;

  TagField: array [1..6] of boolean = (true, true, true, true, true, true);

  AutoBackup: boolean = false;

  Numeration: boolean = false;
  AddDate: boolean = true;
  CustomLabel: boolean = false;
  LabelText: string = '';

  PlayListSaveDir: string = '';
  LastAddDir: string = '';
  LastEditDir: string = '';

  FoobarPath: string = '';

  AddSize: boolean = false;

  ValidFiles: boolean = false;

  InfoCol: array [0..12] of longint = (1000250, -3010080, -3020080, -3030100, -3040100, -1050100, -1060100, 1070100, 1080100, 1090100, 1100070, 1110070, 1120100);

  CheatMode: boolean = false;

  FullPath: boolean;
  FileExtensions: boolean;

  AppState: integer = 0;

  SearchTop : Integer;
  SearchLeft : Integer;
  SearchHeight : Integer;
  SearchWidth : Integer;

  LastMacro: string = '%04 - %02 - %01';

  UserVolumeLabel: string;

  GuessedEncoder: boolean = false;

  UseFoobar: boolean = false;

  AllFiles: boolean = false;

  PreferTag: integer = 1;

  ColumnAutoSize: boolean = false;

  EjectCD: Boolean = False;

const
  { Volume type IDs }
  VOLUME_TYPE_REMOVABLE = 1;                                         { Floppy }
  VOLUME_TYPE_FIXED = 2;                                                { HDD }
  VOLUME_TYPE_REMOTE = 3;                                           { Network }
  VOLUME_TYPE_CDROM = 4;                                        { CD-ROM disk }
  VOLUME_TYPE_RAM = 5;                                             { RAM disk }
  VOLUME_TYPE_AUDIO_CD = 6;                                        { Audio CD }

	MAX_DEFAULT_FILTER_ITEMS = 9;
  DEFAULT_FILTER: array [1..MAX_DEFAULT_FILTER_ITEMS, 1..2] of string = (
  	('\', ''),
    ('/', ''),
    (':', ''),
    ('*', ''),
    ('?', ''),
    ('"', ''),
    ('>', ''),
    ('<', ''),
    ('|', ''));

  MPEG_BIT_RATES : array[1..3] of array[1..3] of array[0..15] of word =
       { Version 1, Layer I     }
     (((0,32,64,96,128,160,192,224,256,288,320,352,384,416,448,0),
       { Version 1, Layer II    }
       (0,32,48,56, 64, 80, 96,112,128,160,192,224,256,320,384,0),
       { Version 1, Layer III   }
       (0,32,40,48, 56, 64, 80, 96,112,128,160,192,224,256,320,0)),
       { Version 2, Layer I     }
      ((0,32,48, 56, 64, 80, 96,112,128,144,160,176,192,224,256,0),
       { Version 2, Layer II    }
       (0, 8,16,24, 32, 40, 48, 56, 64, 80, 96, 112,128,144,160,0),
       { Version 2, Layer III   }
       (0, 8,16,24, 32, 40, 48, 56, 64, 80, 96, 112,128,144,160,0)),
       { Version 2.5, Layer I   }
      ((0,32,48, 56, 64, 80, 96,112,128,144,160,176,192,224,256,0),
       { Version 2.5, Layer II  }
       (0, 8,16,24, 32, 40, 48, 56, 64, 80, 96, 112,128,144,160,0),
       { Version 2.5, Layer III }
       (0, 8,16,24, 32, 40, 48, 56, 64, 80, 96, 112,128,144,160,0)));

  NO_DISC = 'NO DISC';

function GetText(Index: integer): string;
function DurationToStr(Duration: longint): string;
function DurationToShortStr(Duration: longint): string;
function ExtractName(Source: string): string;
function ExtractData(Source: string): DataArray;
function ExtractTag(Source: string): TagArray;
function PropertyOK(NItem: TTreeNode; NProp: PropertyArray; var Match: MatchArray): boolean;
function AlignedBitRate(FBitRate, FSampleRate, FMode, FVersion, FLayer: integer): integer;
function ExtractOldData(Info: string): DataArray;
function ShortFileNameOK(FileName: string; var SFName: string; var DName: string): boolean;
function TreeSorting(Node1, Node2: TTreeNode; Data: longint): integer; stdcall;
function GetChannelMode(Mode: longint): string;
function GetMPEGVersion(Version: longint): string;
function GetVolumePath(Source: string): string;
function TextFilter(Source: string; Limit: integer): string;
function GetMPEGType(Version, Layer: integer): string;
function GetNewFileName(const OldName: string; Tag: TagArray; Macro: string; Filter: TListView): string;
function GetFileTag(const FileName: string; LengthLimit: integer; Number: integer): TagArray;
function VolumeDataOK(Drive: Char; var VLabel: string; var VSerial: longint; var VType: Integer): boolean;
function GetVolumeLabel(Drive: Char): String;

// Gambit
function GetMPCVersion(VersionNumber: Integer): String;


implementation

// -----------------------------------------------------------------------------

function GetText(Index: integer): string;
var
	Line: string;
begin
	try
	begin
		Line := Lang.Items.Strings[Index];
		Result := Copy(Line, 4, Length(Line) - 3);
	end;
	except
		Result := '?';
	end;
end;

// -----------------------------------------------------------------------------

function DurationToStr(Duration: longint): string;
var
	Param: array[1..3] of integer;
begin
	Param[1] := Duration div 3600;
	if Param[1] > 9 then Result := IntToStr(Param[1]) + ':'
	else Result := '0' + IntToStr(Param[1]) + ':';

	Param[2] := Duration div 60 mod 60;
	if Param[2] > 9 then Result := Result + IntToStr(Param[2]) + ':'
	else Result := Result + '0' + IntToStr(Param[2]) + ':';

	Param[3] := Duration mod 60;
	if Param[3] > 9 then Result := Result + IntToStr(Param[3])
	else Result := Result + '0' + IntToStr(Param[3]);
end;

// -----------------------------------------------------------------------------

function DurationToShortStr(Duration: longint): string;
var
	Param: array[1..3] of integer;
begin
	Result := '';

	Param[1] := Duration div 3600;
  if Param[1] > 0 then
		if Param[1] > 9 then Result := IntToStr(Param[1]) + ':'
		else Result := '0' + IntToStr(Param[1]) + ':';

	Param[2] := Duration div 60 mod 60;
	if Param[2] > 9 then Result := Result + IntToStr(Param[2]) + ':'
	else Result := Result + '0' + IntToStr(Param[2]) + ':';

	Param[3] := Duration mod 60;
	if Param[3] > 9 then Result := Result + IntToStr(Param[3])
	else Result := Result + '0' + IntToStr(Param[3]);
end;

// -----------------------------------------------------------------------------

function ExtractName(Source: string): string;
begin
	Result := Copy(Source, 1, Pos(#1, Source) - 1);
end;

// -----------------------------------------------------------------------------

function ExtractData(Source: string): DataArray;
var
  // increased from 7 to 8 in 2.91
  // because of volume type info
	CharPos: array [1..8] of integer;
	Index, Value, ErrorCode: longint;
	Text: string;
begin
	for Index := 1 to 8 do CharPos[Index] := Pos(Chr(Index), Source);

	for Index := 1 to 7 do
	begin
		Text := Copy(Source, CharPos[Index] + 1, CharPos[Index + 1] - CharPos[Index] - 1);
		Val(Text, Value, ErrorCode);
		if ErrorCode = 0 then Result[Index] := Value;
	end;
end;

// -----------------------------------------------------------------------------

function ExtractTag(Source: string): TagArray;
var
	CharPos: array [1..7] of integer;
	Index: integer;
begin
	for Index := 1 to 7 do CharPos[Index] := Pos(Chr(Index + 20), Source);

	for Index := 1 to 6 do Result[Index] := Copy(Source, CharPos[Index] + 1, CharPos[Index + 1] - CharPos[Index] - 1);
end;

// -----------------------------------------------------------------------------

function AlignedBitRate(FBitRate, FSampleRate, FMode, FVersion, FLayer: integer): integer;
const
  TWIN_BIT_RATES: array[0..9] of byte = (0, 8, 10, 16, 20, 24, 32, 40, 48, 0);
  WMA_BIT_RATES: array[0..19] of word = (0, 8, 10, 12, 16, 20, 22, 32, 36, 40, 44, 48, 64, 80, 96, 128, 160, 192, 224, 256);
var
	Index, Min, Split, Rate: integer;
begin
  Result := FBitRate;
	if (FVersion = 0) or (FVersion = 30) or (FLayer = 0) then exit;

  if FVersion = 9 then
  begin
    Rate := FSampleRate * 10;
    if Rate = 11020 then Rate := 11025;
    if FMode = 1 then Result := Round(Rate * FLayer / 500)
    else Result := Round(Rate * FLayer / 1000);
    exit;
  end;

	Result := 0;
	Min := 1000;

  if FVersion = 10 then
  begin
  	for Index := 0 to 9 do
	  begin
      if FMode = 4 then Rate := FBitRate
      else Rate := Round(FBitRate / 2);
		  Split := Abs(Rate - TWIN_BIT_RATES[Index]);
  		if Split < Min then Min := Split
	  	else
		  begin
			  if FMode = 4 then Result := TWIN_BIT_RATES[Index - 1]
        else Result := TWIN_BIT_RATES[Index - 1] * 2;
  			exit;
	  	end;
  	end;
    exit;
  end;

  if FVersion = 25 then
  begin
  	for Index := 0 to 19 do
	  begin
		  Split := Abs(FBitRate - WMA_BIT_RATES[Index]);
  		if Split < Min then Min := Split
	  	else
		  begin
			  Result := WMA_BIT_RATES[Index - 1];
  			exit;
	  	end;
  	end;
    exit;
  end;

	for Index := 0 to 15 do
	begin
		Split := Abs(FBitRate - MPEG_BIT_RATES[FVersion, FLayer, Index]);
		if Split < Min then Min := Split
		else
		begin
			Result := MPEG_BIT_RATES[FVersion, FLayer, Index - 1];
			exit;
		end;
	end;
end;

// -----------------------------------------------------------------------------

function PropertyOK(NItem: TTreeNode; NProp: PropertyArray; var Match: MatchArray): boolean;
var
	DValue, Index: longint;
	NData: DataArray;
	NTag: TagArray;
begin
	Result := false;
	for Index := 1 to 6 do Match[Index] := false;

	NData := ExtractData(NItem.Text);

	if NProp[1, 1] = 1 then
	begin
		if NData[2] <> 0 then DValue := Trunc(NData[1] * 8 * 1.024 / Abs(NData[2]))
		else DValue := 0;
		if NData[2] > 0 then DValue := AlignedBitRate(DValue, NData[3], NData[4], NData[5], NData[6]);

		Index := NProp[1, 2] * 10 + NProp[1, 3];

		case Index of
			0: if DValue < 128 then Match[1] := true;
			1: if DValue < 160 then Match[1] := true;
			2: if DValue < 192 then Match[1] := true;
			10: if DValue = 128 then Match[1] := true;
			11: if DValue = 160 then Match[1] := true;
			12: if DValue = 192 then Match[1] := true;
			20: if DValue > 128 then Match[1] := true;
			21: if DValue > 160 then Match[1] := true;
			22: if DValue > 192 then Match[1] := true;
		end;
	end;

	if NProp[2, 1] = 1 then
	begin
		DValue := NData[3] * 10;

		Index := NProp[2, 2] * 10 + NProp[2, 3];

		case Index of
			0: if DValue < 22050 then Match[2] := true;
			1: if DValue < 32000 then Match[2] := true;
			2: if DValue < 44100 then Match[2] := true;
			10: if DValue = 22050 then Match[2] := true;
			11: if DValue = 32000 then Match[2] := true;
			12: if DValue = 44100 then Match[2] := true;
			20: if DValue > 22050 then Match[2] := true;
			21: if DValue > 32000 then Match[2] := true;
			22: if DValue > 44100 then Match[2] := true;
		end;
	end;

	if NProp[3, 1] = 1 then
		case NProp[3, 2] of
			0: if NData[4] in [0, 3, 4] then Match[3] := true;
			1: if NData[4] in [1, 2] then Match[3] := true;
		end;

	if NProp[4, 1] = 1 then
	begin
		Index := NProp[4, 2] * 10 + NProp[4, 3];

		case Index of
			0: if NData[5] < 1 then Match[4] := true;
			1: if NData[5] < 2 then Match[4] := true;
			2: if NData[5] < 3 then Match[4] := true;
			10: if NData[5] = 1 then Match[4] := true;
			11: if NData[5] = 2 then Match[4] := true;
			12: if NData[5] = 3 then Match[4] := true;
			20: if NData[5] > 1 then Match[4] := true;
			21: if NData[5] > 2 then Match[4] := true;
			22: if NData[5] > 3 then Match[4] := true;
		end;

    if NData[5] > 3 then Match[4] := false;
	end;

	if NProp[5, 1] = 1 then
	begin
		Index := NProp[5, 2] * 10 + NProp[5, 3];

		case Index of
			0: if NData[6] < 1 then Match[5] := true;
			1: if NData[6] < 2 then Match[5] := true;
			2: if NData[6] < 3 then Match[5] := true;
			10: if NData[6] = 1 then Match[5] := true;
			11: if NData[6] = 2 then Match[5] := true;
			12: if NData[6] = 3 then Match[5] := true;
			20: if NData[6] > 1 then Match[5] := true;
			21: if NData[6] > 2 then Match[5] := true;
			22: if NData[6] > 3 then Match[5] := true;
		end;

    if NData[5] > 3 then Match[5] := false;
	end;

	NTag := ExtractTag(NItem.Text);

	if NProp[6, 1] = 1 then
		case NProp[6, 2] of
			0:
			begin
				Match[6] := false;
					for Index := 1 to 6 do
						if (NTag[Index] <> '') then Match[6] := true;
			end;
			1:
			begin
				Match[6] := true;
					for Index := 1 to 6 do
						if (NTag[Index] <> '') then Match[6] := false;
			end;
		end;

	for Index := 1 to 6 do if Match[Index] then Result := true;
end;

// -----------------------------------------------------------------------------

function ExtractOldData(Info: string): DataArray;
var
	SubInfo: string;
	Index, Index2: longint;
begin
	for Index2 := 6 downto 1 do
	begin
		Index := LastDelimiter(';', Info);
		SubInfo := Copy(Info, Index + 1, Length(Info) - Index);
		Delete(Info, Index, Length(Info) - Index + 1);
		Result[Index2] := StrToInt(SubInfo);
	end;
end;

// -----------------------------------------------------------------------------

function ShortFileNameOK(FileName: string; var SFName: string; var DName: string): boolean;
var
	Index: longint;
	Temp: string;
begin
	Result := false;

	if FileName <> '' then
	begin
		DName := ExtractFileDir(FileName);

		Temp := ExtractFileName(FileName);
		Index := LastDelimiter('.', Temp);
		if Index > 0 then Delete(Temp, Index, Length(Temp) - Index + 1);
		SFName := Temp;

		Result := true;
	end;
end;

// -----------------------------------------------------------------------------

function TreeSorting(Node1, Node2: TTreeNode; Data: longint): integer; stdcall;
begin
	if Node1.HasChildren = Node2.HasChildren then
    Result := AnsiCompareText(ExtractName(Node1.Text), ExtractName(Node2.Text))
	else
		if Node1.HasChildren then Result := -1
		else Result := 1;
end;

// -----------------------------------------------------------------------------

function GetChannelMode(Mode: longint): string;
begin
	Result := '?';

	case Mode of
		1: Result := GetText(71);
		2: Result := GetText(72);
		3: Result := GetText(73);
		4: Result := GetText(74);
	end;
end;

// -----------------------------------------------------------------------------

function GetMPEGVersion(Version: longint): string;
begin
	Result := '?';

	case Version of
		1: Result := '1';
		2: Result := '2';
		3: Result := '2.5';
	end;
end;

// -----------------------------------------------------------------------------

function GetVolumePath(Source: string): string;
begin
	Result := '';
  if Pos('\', Source) > 0 then
  	Result := Copy(Source, Pos('\', Source) + 1, Length(Source) - Pos('\', Source));
end;

// -----------------------------------------------------------------------------

function TextFilter(Source: string; Limit: integer): string;
var
	Index: integer;
  Temp: string;
begin
	Result := '';
	Temp := Trim(Source);
  if (Limit > 0) and (Length(Temp) > Limit) then
  	Temp := Trim(Copy(Temp, 1, Limit));

  for Index := 1 to Length(Temp) do
  	if Ord(Temp[Index]) >= 32 then Result := Result + Temp[Index]
    else Result := Result + #32;

  Result := Trim(Result);
end;

// -----------------------------------------------------------------------------

function GetMPEGType(Version, Layer: integer): string;
begin
  case Version of
    1, 2, 3: Result := GetText(75) + ' ' + GetMPEGVersion(Version) + ' ' +
      GetText(76) + ' ' + IntToStr(Layer);
    4, 5, 6, 7, 71:
      begin
        Result := 'MPC SV ' + GetMPCVersion(Version);
        if Layer in [1..12] then Result := Result + #32 + MPP_PROFILE[Layer];
      end;
    9: Result := 'PCM (' + IntToStr(Layer) + '-bit)';
    10: Result := 'Twin VQ';
    20: Result := 'Ogg Vorbis';
    25: Result := 'WMA';
    30: Result := 'Monkey''s Audio (' + IntToStr(Layer) + '-bit)';
    35: Result := 'FLAC (' + IntToStr(Layer) + '-bit)';
    40: Result := 'OptimFROG (' + IntToStr(Layer and $FF) + '-bit ' +
      OFR_COMPRESSION[Layer shr 11] + ')';
    45: Result := 'AAC';
    50: Result := 'WavPack (' + IntToStr( Layer ) + '-bit)';
  else
    Result := '?';
  end;
{
	Result := '?';
  if Version = 0 then exit;

  if Version in [9, 10, 20, 25, 30, 35] then
  begin
    if Version = 9 then Result := 'PCM (' + IntToStr(Layer) + '-bit)';
    if Version = 10 then Result := 'Twin VQ';
    if Version = 20 then Result := 'Ogg Vorbis';
    if Version = 25 then Result := 'WMA';
    if Version = 30 then Result := 'Monkey''s Audio (' + IntToStr(Layer) + '-bit)';
    if Version = 35 then Result := 'FLAC (' + IntToStr(Layer) + '-bit)';
    exit;
  end;

  // Gambit - has to be changed if we add more formats
  //if Version in [4, 5, 6, 7, 71] then
  if Version > 3 then
  begin
  	Result := 'MPC SV ' + GetMPCVersion(Version);
    if Layer in [1..11] then Result := Result + #32 + MPP_PROFILE[Layer];
  end
  else
  begin
    if Layer = 0 then exit;
		Result := GetText(75) + ' ' + GetMPEGVersion(Version) + ' ';
		Result := Result + GetText(76) + ' ' + IntToStr(Layer);
  end;
}
end;

// -----------------------------------------------------------------------------

function GetNewFileName(const OldName: string; Tag: TagArray; Macro: string; Filter: TListView): string;
var
  FileName, Folder, Ext, NewName: string;
  Index, Code: integer;
  Item: TListItem;
begin
	Result := OldName;
  NewName := '';

  Folder := ExtractFileDir(OldName);
 	Ext := ExtractFileExt(OldName);
  FileName := Macro;

	Index := 1;
  while Length(FileName) >= Index do
  	if (FileName[Index] = '%') and (Length(FileName) > Index + 1) and
    	(FileName[Index + 1] = '0') and (FileName[Index + 2] in ['1'..'6']) then
    begin
    	Code := Ord(FileName[Index + 2]) - 48;

      case Code of
      	1: NewName := NewName + Tag[1];
        2: NewName := NewName + Tag[2];
        3: NewName := NewName + Tag[3];
        4: NewName := NewName + Tag[4];
        5: NewName := NewName + Tag[5];
        6: NewName := NewName + Tag[6];
      end;

      Inc(Index, 3);
    end
    else
    begin
    	NewName := NewName + FileName[Index];
      Inc(Index);
    end;

  for Index := Filter.Items.Count downto 1 do
  begin
  	Item := Filter.Items[Index - 1];
    NewName := StringReplace(NewName, Item.Caption, Item.SubItems.Strings[0], [rfReplaceAll]);
  end;

  if Length(Folder) = 3 then Result := Folder + Trim(NewName) + Ext
  else Result := Folder + '\' + Trim(NewName) + Ext;
end;

// -----------------------------------------------------------------------------

function GetFileTag(const FileName: string; LengthLimit: integer; Number: integer): TagArray;
var
	ID3v1: TID3v1;
  ID3v2: TID3v2;
  APEtag: TAPEtag;
  Track, Error, Index: integer;
  Tag, Tag2, Tag3: TagArray;
begin
  ID3v1 := TID3v1.Create;
  ID3v2 := TID3v2.Create;
  // Gambit - adds ape tag reading from mp3
  APEtag := TAPEtag.Create;

  for Index := 1 to 6 do
  begin
  	Tag[Index] := '';
    Tag2[Index] := '';
    Tag3[Index] := '';
  end;

	if FileExists(FileName) then
  begin
   	ID3v1.ReadFromFile(FileName);
    if ID3v1.Exists then
		begin
    	Tag[1] := TextFilter(ID3v1.Title, LengthLimit);
      Tag[2] := TextFilter(ID3v1.Artist, LengthLimit);
      Tag[3] := TextFilter(ID3v1.Album, LengthLimit);
      Tag[4] := IntToStr(ID3v1.Track);
      Tag[5] := TextFilter(ID3v1.Year, LengthLimit);
      Tag[6] := TextFilter(ID3v1.Comment, LengthLimit);
    end;

    APEtag.ReadFromFile(FileName);
    if APEtag.Exists then
		begin
    	Tag3[1] := TextFilter(APEtag.Title, LengthLimit);
      Tag3[2] := TextFilter(APEtag.Artist, LengthLimit);
      Tag3[3] := TextFilter(APEtag.Album, LengthLimit);
      Tag3[4] := IntToStr(APEtag.Track);
      Tag3[5] := TextFilter(APEtag.Year, LengthLimit);
      Tag3[6] := TextFilter(APEtag.Comment, LengthLimit);
    end;

    ID3v2.ReadFromFile(FileName);
		if ID3v2.Exists then
    begin
    	Tag2[1] := TextFilter(ID3v2.Title, LengthLimit);
      Tag2[2] := TextFilter(ID3v2.Artist, LengthLimit);
      Tag2[3] := TextFilter(ID3v2.Album, LengthLimit);
      Tag2[4] := IntToStr(ID3v2.Track);
      Tag2[5] := TextFilter(ID3v2.Year, LengthLimit);
      Tag2[6] := TextFilter(ID3v2.Comment, LengthLimit);
    end;

		for Index := 1 to 6 do
		begin
     	Tag2[Index] := TextFilter(Tag2[Index], LengthLimit);
      Tag3[Index] := TextFilter(Tag3[Index], LengthLimit);
{
      case PreferTag of
       	1: if Tag[Index] = '' then Tag[Index] := Tag2[Index];
        2: if Tag2[Index] <> '' then Tag[Index] := Tag2[Index];
      end;
}
      case PreferTag of
      // Gambit - ape tag is always preferred
       	1: if Tag3[Index] <> '' then Tag[Index] := Tag3[Index]
           else
             if Tag[Index] = '' then Tag[Index] := Tag2[Index];
       	2: if Tag3[Index] <> '' then Tag[Index] := Tag3[Index]
           else
             if Tag2[Index] <> '' then Tag[Index] := Tag2[Index];
      end;
    end;

    Val(Tag[4], Track, Error);
    if Error <> 0 then Track := 0;
    if not (Track in [1..99]) then Track := Number;
    Tag[4] := '';
    if Track in [1..9] then Tag[4] := '0' + IntToStr(Track);
    if Track in [10..99] then Tag[4] := IntToStr(Track);
	end;

  for Index := 1 to 6 do Result[Index] := Tag[Index];

  ID3v1.Free;
  ID3v2.Free;
  APEtag.Free;
end;

// -----------------------------------------------------------------------------

function VolumeDataOK(Drive: Char; var VLabel: string; var VSerial: longint; var VType: Integer): boolean;
var
	SearchString: string[7];
	Buffer: array[0..255] of char;
	a,b,c: DWORD;
begin
	SearchString := Drive + ':\' + #0;
	If GetVolumeInformation(@SearchString[1], buffer, sizeof(buffer), @a, b, c, nil, 0) then
	begin
		VLabel := buffer;
		VSerial := a;

    if (SearchString[1] <> '\') or (SearchString[2] <> '\') then
    begin
      case GetDriveType(@SearchString[1]) of
        DRIVE_REMOVABLE: VType := VOLUME_TYPE_REMOVABLE;
        DRIVE_FIXED: VType := VOLUME_TYPE_FIXED;
        DRIVE_REMOTE: VType := VOLUME_TYPE_REMOTE;
        DRIVE_CDROM: VType := VOLUME_TYPE_CDROM;
        DRIVE_RAMDISK: VType := VOLUME_TYPE_RAM;
      end;
      (*
      { If Audio CD }
      if (VType = VOLUME_TYPE_CDROM) and (FileTExt = '.cda') then
        VType := VOLUME_TYPE_AUDIO_CD;
      *)
    end
    else
      { Network drive }
      VType := VOLUME_TYPE_REMOTE;

		Result := true;
	end
	else Result := false;
end;

// -----------------------------------------------------------------------------

function GetVolumeLabel(Drive: Char): String;
var
	SearchString: String[7];
	{$IFDEF VER80}
	SR: TSearchRec;
	P: Byte;
	{$ELSE}
	Buffer : array[0..255] of char;
	a,b : DWORD;
	{$ENDIF}
begin
	{$IFDEF VER80}
	SearchString := Drive + ':\*.*';
	{ find vol label }
	if FindFirst(SearchString, faVolumeID, SR) = 0 then begin
		P := Pos('.', SR.Name);
		Result := SR.Name;
		{ if it has a dot... }
		if P > 0 then Delete (Result, P, 1);
	end else Result := NO_DISC;
	{$ELSE}
	SearchString := Drive + ':\' + #0;
	If GetVolumeInformation(@SearchString[1],buffer,sizeof(buffer),nil,a,b,nil,0) then
		Result := buffer
	else Result := NO_DISC;
	{$ENDIF}
end;

// -----------------------------------------------------------------------------

function GetMPCVersion(VersionNumber: Integer): String;
begin
	Result := IntToStr(VersionNumber);

	case VersionNumber of
		 4: Result := '4.0';
		 5: Result := '5.0';
		 6: Result := '6.0';
     7: Result := '7.0';
    71: Result := '7.1';
	end;
end;

// -----------------------------------------------------------------------------

begin
  FlacMaskObj := TMask.Create(FlacMask);
  OfrMaskObj := TMask.Create(OfrMask);
  AacMaskObj := TMask.Create(AacMask);
end.
