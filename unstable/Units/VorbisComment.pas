unit VorbisComment;

interface

uses
  SysUtils, Classes, WideStrings;

type

  TVorbisComment = class
  protected
    FComments: array of string;
    FCommentLengths: array of Integer;
    FCommentCount: Integer;
    FVendor: string;
    FVendorLength: Integer;
    FUpperCaseKeys: Boolean;
    FUTF8Values: Boolean;
    function GetSize: Integer;
    function GetKey(Index: Integer): WideString;
    procedure SetKey(Index: Integer; Value: WideString);
    function GetValue(Index: WideString): WideString;
    procedure SetValue(Index: WideString; Value: WideString);
    function GetValueI(Index: Integer): WideString;
    procedure SetValueI(Index: Integer; Value: WideString);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure LoadFromStream(const Stream: TStream);
    procedure SaveToStream(const Stream: TStream);
    function Valid: Boolean;
    function GetIndexOf(Index: WideString): Integer;
    procedure DeleteI(Index: Integer);
    procedure Delete(Index: WideString);
    property Key[Index: Integer]: WideString read GetKey write SetKey;
    property Value[Index: WideString]: WideString read GetValue write SetValue;
    property ValueI[Index: Integer]: WideString read GetValueI write SetValueI;
    property Count: Integer read FCommentCount;
    property Size: Integer read GetSize;
  end;

implementation

function TVorbisComment.GetSize: Integer;
var
  I: Integer;
begin
  Result := 4 + Length(FVendor) + 4 + FCommentCount * 4;
  for I := 0 to FCommentCount - 1 do
    Inc(Result, Length(FComments[I]));
end;

function TVorbisComment.GetKey(Index: Integer): WideString;
begin
  if FUpperCaseKeys then
    Result := UpperCaseW(Copy(FComments[Index], 1,
      Pos('=', FComments[Index]) - 1))
  else
    Result := Copy(FComments[Index], 1, Pos('=', FComments[Index]) - 1);
end;

procedure TVorbisComment.SetKey(Index: Integer; Value: WideString);
begin
  if Value <> '' then
    if FUpperCaseKeys then
      FComments[Index] := UpperCase(Value) +
        Copy(FComments[Index], Pos('=', FComments[Index]), MaxInt)
    else
      FComments[Index] := Value +
        Copy(FComments[Index], Pos('=', FComments[Index]), MaxInt)
  else
    DeleteI(Index);
end;

function TVorbisComment.GetValue(Index: WideString): WideString;
var
  n: Integer;
begin
  n := GetIndexOf(Index);
  if n <> -1 then
    Result := GetValueI(n)
  else
    Result := '';
end;

procedure TVorbisComment.SetValue(Index: WideString; Value: WideString);
var
  n: Integer;
begin
  if Index <> '' then
  begin
    n := GetIndexOf(Index);
    if n <> -1 then
      SetValueI(n, Value)
    else if Value <> '' then
    begin
      FCommentCount := FCommentCount + 1;
      FComments[FCommentCount - 1] := UpperCase(Index) + '=' +
        WideStringToUTF8(Value);
    end;
  end;
end;

function TVorbisComment.GetValueI(Index: Integer): WideString;
begin
  if FUTF8Values then
    Result := UTF8ToWideString(Copy(FComments[Index], 1 + Pos('=',
      FComments[Index]), MaxInt))
  else
    Result := Copy(FComments[Index], 1 + Pos('=', FComments[Index]), MaxInt);
end;

procedure TVorbisComment.SetValueI(Index: Integer; Value: WideString);
begin
  if Value <> '' then
    if FUTF8Values then
      FComments[Index] := Copy(FComments[Index], 1,
        Pos('=', FComments[Index])) + WideStringToUTF8(Value)
    else
      FComments[Index] := Copy(FComments[Index], 1,
        Pos('=', FComments[Index])) + Value
  else
    DeleteI(Index);
end;

constructor TVorbisComment.Create;
begin
  inherited Create;
  FUpperCaseKeys := True;
  FUTF8Values := True;
  Clear;
end;

destructor TVorbisComment.Destroy;
begin
  Clear;
  inherited;
end;

procedure TVorbisComment.Clear;
begin
  FVendor := '';
  FVendorLength := 0;
  SetLength(FComments, 0);
  SetLength(FCommentLengths, 0);
  FCommentCount := 0;
end;

procedure TVorbisComment.LoadFromStream(const Stream: TStream);
var
  I: Integer;
begin
  Stream.Read(FVendorLength, SizeOf(FVendorLength));
  SetLength(FVendor, FVendorLength);
  Stream.Read(FVendor[1], FVendorLength);
  Stream.Read(FCommentCount, SizeOf(FCommentCount));
  SetLength(FComments, FCommentCount);
  SetLength(FCommentLengths, FCommentCount);
  for I := 0 to FCommentCount - 1 do
  begin
    Stream.Read(FCommentLengths[I], SizeOf(FCommentLengths[I]));
    SetLength(FComments[I], FCommentLengths[I]);
    Stream.Read(FComments[I, 1], FCommentLengths[I]);
  end;
end;

procedure TVorbisComment.SaveToStream(const Stream: TStream);
var
  N, I: Integer;
begin
  N := Length(FVendor);
  Stream.Write(N, 4);
  Stream.Write(FVendor[1], N);
  Stream.Write(FCommentCount, 4);
  for I := 0 to FCommentCount - 1 do
  begin
    N := Length(FComments[I]);
    Stream.Write(N, 4);
    Stream.Write(FComments[I, 1], N);
  end;
end;

function TVorbisComment.Valid: Boolean;
begin
  Result := (FVendorLength in [10..50]);
end;

function TVorbisComment.GetIndexOf(Index: WideString): Integer;
var
  S: string;
begin
  S := UpperCase(Index);
  for Result := 0 to Count - 1 do
    if UpperCase(Key[Result]) = S then
      Exit;
  Result := -1;
end;

procedure TVorbisComment.DeleteI(Index: Integer);
begin
  if (Index >= 0) and (Index < Count) then
  begin
    FComments[Index] := FComments[Count - 1];
    FCommentCount := FCommentCount - 1;
  end;
end;

procedure TVorbisComment.Delete(Index: WideString);
begin
  DeleteI(GetIndexOf(Index));
end;

end.

