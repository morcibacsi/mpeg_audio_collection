unit WideStrings;

interface

uses
  Classes;

function UTF8ToWideString(const S: string): WideString;
function WideStringToUTF8(const S: WideString): string;
function UpCaseW(const C: WideChar): WideChar;
function LowCaseW(const C: WideChar): WideChar;
function UpperCaseW(const S: WideString): WideString;
function LowerCaseW(const S: WideString): WideString;
function GetCurDir: WideString;
procedure SetCurDir(const Dir: WideString);
function FileCreateW(const FileName: WideString): Integer;
function FileOpenW(const FileName: WideString; Mode: LongWord): Integer;

type
  TFileStreamW = class(THandleStream)
  public
    constructor Create(const FileName: WideString; Mode: Word); overload;
    destructor Destroy; override;
  end;

implementation

uses
  SysUtils, Windows, RTLConsts;

function UTF8ToWideString(const S: String): WideString;
var
  Len: Integer;
begin
  Len := MultiByteToWideChar(CP_UTF8, 0, PChar(S), Length(S), nil, 0);
  SetLength(Result, Len);
  MultiByteToWideChar(CP_UTF8, 0, PChar(S), Length(S), PWideChar(Result), Len);
end;

function WideStringToUTF8(const S: WideString): String;
var
  Len: Integer;
begin
  Len := WideCharToMultiByte(CP_UTF8, 0, PWideChar(S), Length(S), nil, 0, nil, nil);
  SetLength(Result, Len);
  WideCharToMultiByte(CP_UTF8, 0, PWideChar(S), Length(S), PChar(Result), Len, nil, nil);
end;


function UpCaseW(const C: WideChar): WideChar;
begin
  Result := C;
  CharUpperW(PWideChar(Result));
end;

function LowCaseW(const C: WideChar): WideChar;
begin
  Result := C;
  CharLowerW(PWideChar(Result));
end;

function UpperCaseW(const S: WideString): WideString;
var
  Len: Integer;
begin
  Len := Length(S);
  Result := S;
  if Len > 0 then
    CharUpperBuffW(Pointer(Result), Len);
end;

function LowerCaseW(const S: WideString): WideString;
var
  Len: Integer;
begin
  Len := Length(S);
  Result := S;
  if Len > 0 then
    CharLowerBuffW(Pointer(Result), Len);
end;

function GetCurDir: WideString;
var
  Len: Integer;
begin
  SetLength(Result, 512);
  Len := GetCurrentDirectoryW(512, PWideChar(Result));
  if Len <> 0 then
  begin
    SetLength(Result, Len);
    GetCurrentDirectoryW(Len, PWideChar(Result));
  end;
end;

procedure SetCurDir(const Dir: WideString);
begin
  if SetCurrentDirectoryW(PWideChar(Dir)) then
  begin
    FormatMessageW(FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM,
      nil, GetLastError, 0, PWideChar(Error), 0, nil);
    raise EInOutError.CreateFmt('Cannot change to directory "%s". %s',
      [ExpandFilename(Dir), SysErrorMessage(GetLastError)]);
  end;
end;

function FileCreateW(const FileName: WideString): Integer;
begin
  Result := Integer(CreateFileW(PWideChar(FileName), GENERIC_READ or
    GENERIC_WRITE,
    0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0));
end;

function FileOpenW(const FileName: WideString; Mode: LongWord): Integer;
const
  AccessMode: array[0..2] of LongWord = (
    GENERIC_READ,
    GENERIC_WRITE,
    GENERIC_READ or GENERIC_WRITE);
  ShareMode: array[0..4] of LongWord = (
    0,
    0,
    FILE_SHARE_READ,
    FILE_SHARE_WRITE,
    FILE_SHARE_READ or FILE_SHARE_WRITE);
begin
  Result := -1;
  if ((Mode and 3) <= fmOpenReadWrite) and
    ((Mode and $F0) <= fmShareDenyNone) then
    Result := Integer(CreateFileW(PWideChar(FileName), AccessMode[Mode and 3],
      ShareMode[(Mode and $F0) shr 4], nil, OPEN_EXISTING,
      FILE_ATTRIBUTE_NORMAL, 0));
end;

{ TFileStreamW }

constructor TFileStreamW.Create(const FileName: WideString; Mode: Word);
begin
  if Mode = fmCreate then
  begin
    inherited Create(FileCreateW(FileName));
    if FHandle < 0 then
      raise EFCreateError.CreateResFmt(@SFCreateErrorEx,
        [ExpandFileName(FileName), SysErrorMessage(GetLastError)]);
  end
  else
  begin
    inherited Create(FileOpenW(FileName, Mode));
    if FHandle < 0 then
      raise EFOpenError.CreateResFmt(@SFOpenErrorEx, [ExpandFileName(FileName),
        SysErrorMessage(GetLastError)]);
  end;
end;

destructor TFileStreamW.Destroy;
begin
  if FHandle >= 0 then
    FileClose(FHandle);
  inherited Destroy;
end;

end.

