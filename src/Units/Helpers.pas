unit Helpers;

interface

uses CommDlg,Windows,SysUtils,TNTSystem,StrUtils,ShellAPI, ShlObj, ActiveX;

function Hex( Decimal: Integer ): String;
function HexToInt( HexNumber: String ): Int64;
function Size2Str( a: Int64 ): String;
function Str2Size( s: String ): Int64;
function TimeFunct(Time1,Time2,Operation:String):String;
function SecondsToTime (timesec : LongInt) : TDateTime;
function OpenDialog(Filter:String):String;
function SaveDialog(Filter:String):String;

function BrowseDirectory(phWnd: HWND):String;

function SymbolInString(Symbol,InputString:String):Integer;
function TrimMultipleSpaces(const S:String):String;
function ReadDesc(DescDIR,FileName: String): String;
function SetCapital(InputString:WideString;CapitalType:Byte;Delimiters:WideString):WideString;
function ReplaceString(InPutStr,Str2Replace,Replace4This,IfNotFound: String;CaseSensitive:Boolean):String;
function LoCase(ch:Char):Char;
function VolumeID(DriveChar: Char): string;
function FindSystemDir: string;
function Sto_GetFmtFileVersion(const FileName: String; const Fmt: String = '%d.%d.%d.%d%s'): String;

implementation
{ --------------------------------------------------------------------------- }
function Hex( Decimal: Integer ): String;
const hTbl = ('0123456789ABCDEF');
var h : string;
    s, m : integer;
    db : byte;
begin
//  h[ 0 ] := chr( 6 );
  db := 6;
  s := decimal div 16;
  m := decimal mod 16;
  h[ db ] := hTbl[ m + 1 ];
  dec( db );
  while decimal > 16 do begin
    decimal := s;
    s := decimal div 16;
    m := decimal mod 16;
    h[ db ] := hTbl[ m + 1 ];
    dec( db );
  end;
  while db > 0 do begin
    h[ db ] := '0';
    dec( db );
  end;
{  Hex := h; }
  Hex := copy( h, 5, 2 ) + copy( h, 1, 4 );
end;
{ --------------------------------------------------------------------------- }
function HexToInt( HexNumber: String ): Int64;
var s: String;
    i: Byte;
begin
  s := '';
  for i := 1 to length( HexNumber ) do begin
    if ( HexNumber[i] in ['0'..'9'] ) then
      s := s + HexNumber[i]
    else begin
      case HexNumber[i] of
        'A': s := s + IntToStr(10);
        'B': s := s + IntToStr(11);
        'C': s := s + IntToStr(12);
        'D': s := s + IntToStr(13);
        'E': s := s + IntToStr(14);
        'F': s := s + IntToStr(15);
      end;
    end;
  end;
  HexToInt := StrToInt64(s);
end;
{ --------------------------------------------------------------------------- }
function Size2Str( a: Int64 ): String;
var s: String;
begin
  s := IntToStr( a );
  if Length( s ) > 3 then
    if Copy( s, Length( s ) - 3, 1 ) <> ',' then
      Insert( ',', s, Length( s ) - 2 );
  if Copy( s, Length( s ) - 7, 1 ) <> ',' then
    if ( Length( s ) > 7 ) then
      Insert( ',', s, Length( s ) - 6 );
  if ( Length( s ) > 11 ) and ( Copy( s, Length( s ) - 11, 1 ) <> ',' ) then
    Insert( ',', s, Length( s ) - 10 );
  Size2Str := s;
end;
{ --------------------------------------------------------------------------- }
function Str2Size( s: String ): Int64;
var j: Int64;
    i: Integer;
begin
  i := 1;
  repeat
    if not ( s[i] in ['0'..'9'] ) then
      Delete( s, i, 1 )
    else
  inc(i);
  until i = Length( s )+1;
  j := StrToInt64( s );
  Str2Size := j;
end;
{ --------------------------------------------------------------------------- }
function TimeFunct(Time1,Time2,Operation:String):String;
var Time1Sec,Time2Sec,FirstSep,ResultTimeSec,Minutes,Seconds: Integer;
    TimeStr,Min,Sec: String;
begin
  TimeStr := Time1;
  FirstSep := PosEx(':',TimeStr,1);
  Min := Copy(TimeStr,1,FirstSep-1);
  Sec := Copy(TimeStr,FirstSep+1,2);
  if (TryStrToInt(Min,Minutes)) and (TryStrToInt(Sec,Seconds) = True) then
    Time1Sec := (StrToInt(Min)*60) + StrToInt(Sec);

  TimeStr := Time2;
  FirstSep := PosEx(':',TimeStr,1);
  Min := Copy(TimeStr,1,FirstSep-1);
  Sec := Copy(TimeStr,FirstSep+1,2);
  if (TryStrToInt(Min,Minutes)) and (TryStrToInt(Sec,Seconds) = True) then
    Time2Sec := (StrToInt(Min)*60) + StrToInt(Sec);

  if (TryStrToInt(Min,Minutes)) and (TryStrToInt(Sec,Seconds) = False) then
    Time2Sec := 0;

  if Operation = '+' then
    ResultTimeSec := Time1Sec + Time2Sec;
  if Operation = '-' then
    ResultTimeSec := Time1Sec - Time2Sec;

  if (ResultTimeSec div 60) < 10 then
    Min := '0' + IntToStr(ResultTimeSec div 60);
  if (ResultTimeSec div 60) > 9 then
    Min := IntToStr(ResultTimeSec div 60);
  if (ResultTimeSec mod 60) < 10 then
    Sec := '0' + IntToStr(ResultTimeSec mod 60);
  if (ResultTimeSec mod 60) > 9 then
    Sec := IntToStr(ResultTimeSec mod 60);

  if Operation = '-' then
    if Min < IntToStr(1000) then
      Result := Min + ':' + Sec
    else
      Result := '??' + ':' + '??';
//  if Min > IntToStr(1000) then
//    Result := '00:00';

end;
{ --------------------------------------------------------------------------- }
function SecondsToTime (timesec : LongInt) : TDateTime;
 { convert LongInt number of seconds to TDateTime }
var tmpHour : word;
    tmpMin : word;
    tmpSec : word;
begin
  tmpHour := timesec DIV (60*60);
  tmpMin := (timesec - (tmpHour * 60 * 60)) DIV 60;
  tmpSec := timesec - (tmpHour * 60 * 60) - (tmpMin * 60);
  SecondsToTime := EncodeTime (tmpHour, tmpMin, tmpSec,0);
end;
{ --------------------------------------------------------------------------- }
function OpenDialog(Filter:String):String;
var ofn: TOpenFileName;
    szFile: array[0..MAX_PATH] of Char;

begin
  Result := '';
  FillChar(ofn, SizeOf(TOpenFileName), 0);
  with ofn do begin
    szFile := '';
    lStructSize := SizeOf(TOpenFileName);
    hwndOwner := hWndOwner;
    lpstrFile := szFile;
    nMaxFile := SizeOf(szFile);
//    lpstrInitialDir := PChar(copy(LastDir,1,Length(LastDir)-1));
      lpstrInitialDir := nil;
    lpstrFilter := PChar(Filter);
    Flags := 4100;
  end;

  if GetOpenFileName(ofn) then
    Result := StrPas(szFile);
end;
{ --------------------------------------------------------------------------- }
function SaveDialog(Filter:String):String;
var ofn: TOpenFileName;
    szFile: array[0..MAX_PATH] of Char;
//    Result: string;
begin
    FillChar(ofn, SizeOf(TOpenFileName), 0);
    with ofn do begin
      lStructSize := SizeOf(TOpenFileName);
      hwndOwner := hWndOwner;
      lpstrFile := szFile;
      nMaxFile := SizeOf(szFile);
      lpstrInitialDir := nil;
  //    lpstrFilter := PChar('Cue Files (*.cue)'#0'*.cue'#0'All Files (*.*)'#0'*.*'#0);
      lpstrFilter := PChar(Filter);
      Flags := 0;
    end;
    if GetSaveFileName(ofn) then
      Result := StrPas(ofn.lpstrFile);
end;
{ --------------------------------------------------------------------------- }
function BrowseDirectory(phWnd: HWND):String;
var lpbi: TBrowseInfo;
    pidlStart: PItemIDList;
    Malloc: IMalloc;
    sSelected: string;
    pidlSelected: PItemIDList;
begin
  SHGetSpecialFolderLocation(phwnd, $11, pidlStart);
  SHGetMalloc(Malloc);
  with lpbi do begin
    hwndOwner := phwnd;
    pidlRoot := pidlStart;
    GetMem(pszDisplayName, MAX_PATH);
    lpszTitle := PChar('Select folder');
    ulFlags := $00000011;
    lpfn := nil;
  end;
  pidlSelected := SHBrowseForFolder(lpbi);
  if pidlSelected <> nil then begin
    if SHGetPathFromIDList(pidlSelected, lpbi.pszDisplayName) then
    sSelected := StrPas(lpbi.pszDisplayName);
    Result := sSelected;

    Malloc.Free(pidlSelected);
  end;
  FreeMem(lpbi.pszDisplayName);
  Malloc.Free(pidlStart);
end;
{ --------------------------------------------------------------------------- }
function SymbolInString(Symbol,InputString:String):Integer;
var i:Integer;
begin
  Result := 0;
  for i := 1 to Length(InputString) do
    if InputString[i] = Symbol then
      Inc(Result);
end;
{ --------------------------------------------------------------------------- }
function TrimMultipleSpaces(const S:String):String;
begin
  Result := S;
  while Pos('  ',Result)<>0 do
    Delete(Result,Pos('  ',Result),1);
end;
{ --------------------------------------------------------------------------- }
function ReadDesc(DescDIR,FileName: String): String;
var Desc: TextFile;
    Line: String;
    FoundDesc: Boolean;
begin
  Result := '';
  FoundDesc := False;
  if DescDIR[Length(DescDIR)] <> '\' then
    DescDIR := DescDIR + '\';
  AssignFile(Desc,DescDIR+'DESCRIPT.ION');
  Reset(Desc);

  while (not EoF(Desc)) and (Result = '') do begin
    ReadLn(Desc,Line);
    if Pos(' ',FileName) <> 0 then begin
      if Pos(WideUpperCase('"' + FileName + '"'),WideUpperCase(Line)) <> 0 then begin
        TrimMultipleSpaces(Line);

        Result := Copy(Line,PosEx('"',Line,2)+2,Length(Line)-PosEx('"',Line,2)+1);
      end //else
    end
    else if Pos(WideUpperCase(FileName),WideUpperCase(Line)) <> 0 then begin
        TrimMultipleSpaces(Line);
        Result := Copy(Line,Pos(' ',Line),Length(Line)-Pos(' ',Line)+1);
      end;
  end;
  CloseFile(Desc);
end;
{ --------------------------------------------------------------------------- }
function SetCapital(InputString:WideString;CapitalType:Byte;Delimiters:WideString):WideString;
var a,b:Byte;
    TempStr:WideString;
    WideChr:WideChar;

begin
  Result := '';
  if Delimiters = '' then
    Delimiters := ' _!+-.,[(&@#=';
  case CapitalType of
    0:Result := WideLowerCase(InputString); {lowercase}
    1:Result := WideUpperCase(InputString); {uppercase}
    2:begin                                 {every word's first letter in uppercase}
        if InputString = '' then begin
          Result := InputString;
          Exit;
        end;
        InputString := WideLowerCase(InputString);
        WideChr := WideChar(InputString[1]);
        Result := Result + WideUpperCase(WideChr);
        for b:=2 to Length(InputString) do begin
          WideChr := WideChar(InputString[b]);
          for a := 0 to Length(Delimiters) do
            if WideChar(InputString[b-1])=WideChar(Delimiters[a]) then begin
              WideChr := WideChar(InputString[b]);
              WideChr := WideUpperCase(WideChr)[1];
            end;
              Result := Result + WideChr;
        end;
      end;

    3:begin {first letter in uppercase}
        if InputString = '' then begin
          Result := InputString;
          Exit;
        end;
        InputString := WideLowerCase(InputString);
        WideChr := WideChar(InputString[1]);
        Result := WideUpperCase(WideChr) + Copy(InputString,2,Length(InputString)-1);
      end;
    4:begin {invert case}
        if InputString = '' then begin
          Result := InputString;
          Exit;
        end;
        Result := '';
        TempStr := InputString;
        for b:=1 to Length(InputString) do begin
          WideChr := WideChar(TempStr[b]);
          if WideUpperCase(WideChr) = WideChar((InputString[b])) then
            Result := Result + WideLowerCase(WideChr)
          else
            Result := Result + WideUpperCase(WideChr)
      end;
      end;
    5:begin {random case}
        if InputString = '' then begin
          Result := InputString;
          Exit;
        end;
      Result := '';
        Randomize;
        for b:=1 to Length(InputString) do begin
          WideChr := WideChar(InputString[b]);
          case Random(2) of
           0:Result := Result + WideUpperCase(WideChr);
           1:Result := Result + WideLowerCase(WideChr);
          end;
        end;
      end;
    6:Result := InPutString; {unchanged}
  end;
end;

{ --------------------------------------------------------------------------- }
function ReplaceString(InPutStr,Str2Replace,Replace4This,IfNotFound: String;CaseSensitive:Boolean):String;
var p:Word;
    Temp:String;
begin
  Temp := InPutStr;
  if not CaseSensitive then
    p := PosEx(WideUpperCase(Str2Replace),WideUpperCase(Temp),0)
  else
    p := PosEx(Str2Replace,Temp,0);
  while  p<>0 do begin
    Delete(InPutStr,p,Length(Str2Replace));
    if Replace4This <> '' then
      Insert(Replace4This,InPutStr,p)
    else
      Insert(IfNotFound,InPutStr,p);
  if not CaseSensitive then
    p := PosEx(WideUpperCase(Str2Replace),WideUpperCase(Temp),p+1)
  else
    p := PosEx(Str2Replace,Temp,p+1);

//    p := Pos(Str2Replace,InPutStr);
  end;
  Result := InPutStr;
end;
{ --------------------------------------------------------------------------- }
function LoCase(ch:Char):Char;
{$IFDEF PUREPASCAL}
begin
  Result := ch;
  case Result of
    'A'..'Z':  Dec(Result, Ord('A') - Ord('a'));
  end;
end;
{$ELSE}
asm
{ ->    AL      Character       }
{ <-    AL      Result          }

        CMP     AL,'A'
        JB      @@exit
        CMP     AL,'Z'
        JA      @@exit
        SUB     AL,'A' - 'a'
@@exit:
end;
{$ENDIF}
{ --------------------------------------------------------------------------- }
function VolumeID(DriveChar: Char): string;
var
  OldErrorMode: Integer;
  NotUsed, VolFlags: DWORD;
  Buf: array [0..MAX_PATH] of Char;
begin
  OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    Buf[0] := #$00;
    if GetVolumeInformation(PChar(DriveChar + ':\'), Buf, DWORD(sizeof(Buf)),
      nil, NotUsed, VolFlags, nil, 0) then
      SetString(Result, Buf, StrLen(Buf))
    else Result := '';
    if DriveChar < 'a' then
      Result := AnsiUpperCaseFileName(Result)
    else
      Result := AnsiLowerCaseFileName(Result);
//    Result := Format('[%s]',[Result]);
    Result := Format('%s',[Result]);
  finally
    SetErrorMode(OldErrorMode);
  end;
end;
{ --------------------------------------------------------------------------- }
function FindSystemDir: string;
var
  pSystemDir: array [0..255] of Char;
  sSystemDir: string;
begin
  GetSystemDirectory(pSystemDir, 255);
  sSystemDir := StrPas(pSystemDir);
  Result := sSystemDir;
end;
{ --------------------------------------------------------------------------- }
function Sto_GetFmtFileVersion(const FileName: String; const Fmt: String = '%d.%d.%d.%d%s'): String;
var
  iBufferSize: DWORD;
  iDummy: DWORD;
  pBuffer: Pointer;
  pFileInfo: Pointer;
  iVer: Array[1..4] of Word;
  sCompileTime: string;
  pcCompileTime: PChar;
begin
  // set default value
  Result := '';
  // get size of version info (0 if no version info exists)
  iBufferSize := GetFileVersionInfoSize(PChar(FileName), iDummy);
  if (iBufferSize > 0) then begin
    GetMem(pBuffer, iBufferSize);
    try
    // get fixed file info
    GetFileVersionInfo(PChar(FileName), 0, iBufferSize, pBuffer);
    VerQueryValue(pBuffer, '\', pFileInfo, iDummy);
    // read version blocks
    iVer[1] := HiWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionMS);
    iVer[2] := LoWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionMS);
    iVer[3] := HiWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionLS);
    iVer[4] := LoWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionLS);

    If VerQueryValue(pBuffer,PChar('StringFileInfo\040904E4\LastCompiledTime'),pFileInfo,iDummy) Then begin
        pcCompileTime := PChar(pFileInfo);
        sCompileTime := ' - ' + string(pcCompileTime);
    end else
      sCompileTime := '';
    finally
      FreeMem(pBuffer);
    end;
    // format result string
    Result := Format(Fmt, [iVer[1], iVer[2], iVer[3], iVer[4], sCompileTime] );
  end;
end;
{ --------------------------------------------------------------------------- }
end.
