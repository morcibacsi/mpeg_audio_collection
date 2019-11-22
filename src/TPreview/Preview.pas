{------------------------------------------------------------------------------}
{                                                                              }
{  TPrintPreview v3.01 & TPaperPreview v1.0 for Delphi                         }
{                                                                              }
{  Author: Kambiz R. Khojasteh                                                 }
{  Last modified: April 26, 2001                                               }
{                                                                              }
{  email: khojasteh@mail.com                                                   }
{  http://www.crosswinds.net/~khojasteh/                                       }
{                                                                              }
{                                                                              }
{  Special thanks to:                                                          }
{                                                                              }
{     Rinaldo Andrea (Italy)  <laser@nuovacs.it>                               }
{     Jens Christian Fogtmann <jefo@post2.tele.dk>                             }
{     Damian Tarnawsky        <tarnawsky@ali.com.au>                           }
{     Bill Miller             <w2m@netheaven.com>                              }
{     Wen Shihong             <wenshihong@justep.com>                          }
{     Peter Hedlund           <peter@peterandlinda.com>                        }
{     Pavel Zidek (Czech)     <delphi@kopr.cz>              (ZoomPos)          }
{                                                                              }
{------------------------------------------------------------------------------}

unit Preview;

interface

uses
  {$IFDEF WIN32}Windows, WinSpool, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  Messages, Classes, Graphics, Controls, SysUtils, Forms, Dialogs, StdCtrls,
  ExtCtrls, Menus, Printers;

const
  crHand = 10;

type

  EInvalidPreviewFile = class(Exception);

  { TMetaFileList }

  TMetaFileList = class(TObject)
  private
    FStream: TStream;
    FRecords: TList;
    FMetaFile: TMetaFile;
    FUseTempFile: Boolean;
    FTempFile: string;
    function GetCount: Integer;
    function GetItems(Index: Integer): TMetaFile;
    procedure SetUseTempFile(Value: Boolean);
    function CreateMetaFileStream: TStream;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    function Add(AMetaFile: TMetaFile): Integer;
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TMetaFile read GetItems; default;
    property UseTempFile: Boolean read FUseTempFile write SetUseTempFile;
  end;

  { TPaperPreview }

  TPaperPaintEvent = procedure(Sender: TObject; Canvas: TCanvas; PageRect: TRect) of object;

  TPaperPreview = class(TCustomControl)
  private
    FPaperColor: TColor;
    FBorderColor: TColor;
    FBorderSize: TBorderWidth;
    FShadowColor: TColor;
    FShadowSize: TBorderWidth;
    FOnResize: TNotifyEvent;
    FOnPaint: TPaperPaintEvent;
    procedure SetPaperWidth(Value: Integer);
    function GetPaperWidth: Integer;
    procedure SetPaperHeight(Value: Integer);
    function GetPaperHeight: Integer;
    procedure SetPaperColor(Value: TColor);
    procedure SetBorderColor(Value: TColor);
    procedure SetBorderSize(Value: TBorderWidth);
    procedure SetShadowColor(Value: TColor);
    procedure SetShadowSize(Value: TBorderWidth);
  protected
    property Canvas;
    procedure Paint; override;
    function PageRect: TRect; dynamic;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
    property BorderColor: TColor read FBorderColor write SetBorderColor default clBlack;
    property BorderSize: TBorderWidth read FBorderSize write SetBorderSize default 1;
    property Color;
    property Cursor;
    property DragCursor;
    property DragMode;
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;
    property PaperColor: TColor read FPaperColor write SetPaperColor default clWhite;
    property PaperWidth: Integer read GetPaperWidth write SetPaperWidth;
    property PaperHeight: Integer read GetPaperHeight write SetPaperHeight;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clBtnShadow;
    property ShadowSize: TBorderWidth read FShadowSize write SetShadowSize default 3;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDRop;
    property OnDragOver;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
    property OnPaint: TPaperPaintEvent read FOnPaint write FOnPaint;
  end;

  { TPaperPreviewOptions }

  TPaperPreviewOptions = class(TPersistent)
  private
    FPaperColor: TColor;
    FBorderColor: TColor;
    FBorderWidth: TBorderWidth;
    FShadowColor: TColor;
    FShadowWidth: TBorderWidth;
    FCursor: TCursor;
    FDragCursor: TCursor;
    FPopupMenu: TPopupMenu;
    FOnChange: TNotifyEvent;
    procedure SetPaperColor(Value: TColor);
    procedure SetBorderColor(Value: TColor);
    procedure SetBorderWidth(Value: TBorderWidth);
    procedure SetShadowColor(Value: TColor);
    procedure SetShadowWidth(Value: TBorderWidth);
    procedure SetCursor(Value: TCursor);
    procedure SetDragCursor(Value: TCursor);
    procedure SetPopupMenu(Value: TPopupMenu);
  protected
    procedure DoChange;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property BorderColor: TColor read FBorderColor write SetBorderColor default clBlack;
    property BorderWidth: TBorderWidth read FBorderWidth write SetBorderWidth default 1;
    property Cursor: TCursor read FCursor write SetCursor default crDefault;
    property DragCursor: TCursor read FDragCursor write SetDragCursor default crHand;
    property PaperColor: TColor read FPaperColor write SetPaperColor default clWhite;
    property PopupMenu: TPopupMenu read FPopupMenu write SetPopupMenu;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clBtnShadow;
    property ShadowWidth: TBorderWidth read FShadowWidth write SetShadowWidth default 3;
  end;

  { TPrintPreview}

  TPreviewPrintProgress = procedure(Sender: TObject; PageNum, Progress: Integer;
    var AbortIt: Boolean) of object;

  TPreviewState = (psReady, psCreating, psPrinting);
  TZoomState = (zsZoomOther, zsZoomToWidth, zsZoomToHeight, zsZoomToFit);
  TUnits = (mmPixel, mmLoMetric, mmHiMetric, mmLoEnglish, mmHiEnglish, mmTWIPS);
  TPaperType = (pLetter, pLetterSmall, pTabloid, pLedger, pLegal, pStatement,
    pExecutive, pA3, pA4, pA4Small, pA5, pB4, pB5, pFolio, pQuatro, p10x14,
    p11x17, pNote, pEnv9, pEnv10, pEnv11, pEnv12, pEnv14, pCSheet, pDSheet,
    pESheet, pEnvDL, pEnvC5, pEnvC3, pEnvC4, pEnvC6, pEnvC65, pEnvB4, pEnvB5,
    pEnvB6, pEnvItaly, pEnvMonarch, pEnvPersonal, pFanfoldUSStd, pFanfoldGermanStd,
    pFanfoldGermanLegal, pB4ISO, pJapanesePostcard, p9x11, p10x11, p15x11,
    pEnvInvite, pLetterExtra, pLegalExtra, TabloidExtra, pA4Extra, pLetterTransverse,
    pA4Transverse, pLetterExtraTransverse, pAPlus, pBPlus, pLetterPlus, pA4Plus,
    pA5Transverse, pB5Transverse, pA3Extra, pA5Extra, pB5Extra, pA2, pA3Transverse,
    pA3ExtraTransverse, pCustom);

  TPrintPreview = class(TScrollBox)
  private
    FPaperView: TPaperPreview;
    FPaperViewOptions: TPaperPreviewOptions;
    FPrintJobTitle: string;
    FPages: TMetaFileList;
    FCanvas: TCanvas;
    FUnits: TUnits;
    FPrinterInstalled: Boolean;
    FPixelsPerInch: TPoint;
    FPixels: TPoint;
    FGutter: Integer;
    FAborted: Boolean;
    FMarginLeft: Integer;
    FMarginRight: Integer;
    FMarginTop: Integer;
    FMarginBottom: Integer;
    FOrientation: TPrinterOrientation;
    FCurrentPage: Integer;
    FPaperType: TPaperType;
    FPaperWidth: Integer;
    FPaperHeight: Integer;
    FState: TPreviewState;
    FZoom: Integer;
    FZoomState: TZoomState;
    FFastDraw: Boolean;
    FFastPrint: Boolean;
    FOnBeginDoc: TNotifyEvent;
    FOnEndDoc: TNotifyEvent;
    FOnNewPage: TNotifyEvent;
    FOnAbort: TNotifyEvent;
    FOnChange: TNotifyEvent;
    FOnPrintProgress: TPreviewPrintProgress;
    FOnBeforePrint: TNotifyEvent;
    FOnAfterPrint: TNotifyEvent;
    MetaFile: TMetafile;
    FOldMousePos: TPoint;
    FCanScrollHorz: Boolean;
    FCanScrollVert: Boolean;
    {$IFDEF WIN32}
    FZoomSavePos: Boolean;  {ZoomPos}
    {$ENDIF}
    procedure SetAbout(Value: string);
    function GetAbout: string;
    procedure SetPaperViewOptions(Value: TPaperPreviewOptions);
    procedure SetUnits(Value: TUnits);
    procedure SetMarginLeft(Value: Integer);
    procedure SetMarginRight(Value: Integer);
    procedure SetMarginTop(Value: Integer);
    procedure SetMarginBottom(Value: Integer);
    procedure SetPaperType(Value: TPaperType);
    procedure SetPaperWidth(Value: Integer);
    procedure SetPaperHeight(Value: Integer);
    procedure SetOrientation(Value: TPrinterOrientation);
    procedure SetZoomState(Value: TZoomState);
    procedure SetZoom(Value: Integer);
    procedure SetCurrentPage(Value: Integer);
    function GetUseTempFile: Boolean;
    procedure SetUseTempFile(Value: Boolean);
    function GetTotalPages: Integer;
    function GetPageWidth: Integer;
    function GetPageHeight: Integer;
    function GetPageRect: TRect;
    function GetPages(PageNo: Integer): TMetaFile;
    function GetCanvas: TCanvas;
    procedure CreateMetaFileCanvas;
    procedure CloseMetaFileCanvas;
    procedure GetPrinterParameters;
    procedure SetPrinterParameters;
    procedure AdjustCanvasView;
    function IsCustomSize: Boolean;
  protected
    procedure WMWinIniChange(var Message: TMessage); message WM_WININICHANGE;
    procedure CNKeyDown(var Message: TWMKey); message CN_KEYDOWN;
    procedure Loaded; override;
    procedure Resize; override;
    procedure PaintPage(Sender: TObject; Canvas: TCanvas; PageRect: TRect); dynamic;
    procedure PaperClick(Sender: TObject);
    procedure PaperDblClick(Sender: TObject);
    procedure PaperMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PaperMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PaperMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PaperViewOptionsChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ConvertUnit(Value: Integer; FromUnit, ToUnit: TUnits): Integer;
    function ToPrinterUnit(Value, Resolution: Integer): Integer;
    function Screen2PrinterUnit(Value: Integer): Integer;
    procedure PaintGraphic(X, Y: Integer; Graphic: TGraphic);
    procedure PaintWinControl(X, Y: Integer; WinControl: TWinControl);
    procedure Clear;
    procedure BeginDoc;
    procedure EndDoc;
    procedure NewPage;
    procedure Abort;
    procedure Print;
    procedure UpdateZoom;
    procedure PrintPages(StartPage, StopPage: Integer);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);
    property Aborted: Boolean read FAborted;
    property Canvas: TCanvas read GetCanvas;
    property TotalPages: Integer read GetTotalPages;
    property PageRect: TRect read GetPageRect;
    property State: TPreviewState read FState;
    property PageWidth: Integer read GetPageWidth;
    property PageHeight: Integer read GetPageHeight;
    property PixelsPerInch: TPoint read FPixelsPerInch;
    property PrinterInstalled: Boolean read FPrinterInstalled;
    property CurrentPage: Integer read FCurrentPage write SetCurrentPage;
    property Pages[PageNo: Integer]: TMetaFile read GetPages;
  published
    property About: string read GetAbout write SetAbout stored False;
    property Align default alClient;
    property FastDraw: Boolean read FFastDraw write FFastDraw default True;
    property FastPrint: Boolean read FFastPrint write FFastPrint default True;
    property TabStop default True;
    property PrintJobTitle: string read FPrintJobTitle write FPrintJobTitle;
    property Units: TUnits read FUnits write SetUnits default mmHiMetric;
    property Orientation: TPrinterOrientation read FOrientation write SetOrientation default poPortrait;
    property PaperType: TPaperType read FPaperType write SetPaperType default pA4;
    property PaperView: TPaperPreviewOptions read FPaperViewOptions write SetPaperViewOptions;
    property PaperWidth: Integer read FPaperWidth write SetPaperWidth stored IsCustomSize;
    property PaperHeight: Integer read FPaperHeight write SetPaperHeight stored IsCustomSize;
    property MarginLeft: Integer read FMarginLeft write SetMarginLeft default 700;
    property MarginRight: Integer read FMarginRight write SetMarginRight default 700;
    property MarginTop: Integer read FMarginTop write SetMarginTop default 700;
    property MarginBottom: Integer read FMarginBottom write SetMarginBottom default 700;
    property ZoomState: TZoomState read FZoomState write SetZoomState default zsZoomToFit;
    property Zoom: Integer read FZoom write SetZoom default 100;
    {$IFDEF WIN32}
    property ZoomSavePos: Boolean read FZoomSavePos write FZoomSavePos default True; {ZoomPos}
    {$ENDIF}
    property UseTempFile: Boolean read GetUseTempFile write SetUseTempFile default False;
    property OnBeginDoc: TNotifyEvent read FOnBeginDoc write FOnBeginDoc;
    property OnEndDoc: TNotifyEvent read FOnEndDoc write FOnEndDoc;
    property OnNewPage: TNotifyEvent read FOnNewPage write FOnNewPage;
    property OnAbort: TNotifyEvent read FOnAbort write FOnAbort;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnPrintProgress: TPreviewPrintProgress read FOnPrintProgress write FOnPrintProgress;
    property OnBeforePrint: TNotifyEvent read FOnBeforePrint write FOnBeforePrint;
    property OnAfterPrint: TNotifyEvent read FOnAfterPrint write FOnAfterPrint;
  end;

procedure Register;

implementation

{$IFDEF WIN32}
  {$R *.D32}
  {$R *.R32}
{$ELSE}
  {$R *.D16}
  {$R *.R16}
{$ENDIF}

uses
  FileCtrl;

procedure Register;
begin
  RegisterComponents('Kambiz', [TPrintPreview, TPaperPreview]);
end;

{ TMetaFileList }

const
  MagicNumber: LongInt = $50502D4B;
  SInvalidPreviewFile  = '%s'+#10#13#10#13+'File does not contain valid preview data.';

function GetTemporaryFileName: string;
var
  {$IFDEF WIN32}
  TempPath: array[0..255] of Char;
  {$ENDIF}
  TempFile: array[0..255] of Char;
begin
  {$IFDEF WIN32}
  GetTempPath(SizeOf(TempPath), TempPath);
  GetTempFileName(TempPath, 'TMP', 0, TempFile);
  {$ELSE}
  GetTempFileName(GetTempDrive('C'), 'TMP', 0, TempFile);
  {$ENDIF}
  Result := StrPas(TempFile);
end;

{ Based on posting to borland.public.delphi.winapi by Rodney E Geraghty, 8/8/97.}
{ Used to print an image on any Windows printer.                                }

procedure PrintGraphic(Canvas: TCanvas; DestRect: TRect; Graphic: TGraphic);
var
  BitmapHeader: PBitmapInfo;
  BitmapImage: Pointer;
  {$IFDEF WIN32}
  HeaderSize: DWORD;
  ImageSize: DWORD;
  {$ELSE}
  HeaderSize: Integer;
  ImageSize: LongInt;
  MemHandle: THandle;
  {$ENDIF}
  Bitmap: TBitmap;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.Width := Graphic.Width;
    Bitmap.Height := Graphic.Height;
    Bitmap.Canvas.Draw(0, 0, Graphic);
    GetDIBSizes(Bitmap.Handle, HeaderSize, ImageSize);
    GetMem(BitmapHeader, HeaderSize);
    {$IFDEF WIN32}
    GetMem(BitmapImage, ImageSize);
    {$ELSE}
    MemHandle := GlobalAlloc(GPTR, ImageSize);
    BitmapImage := GlobalLock(MemHandle);
    {$ENDIF}
    try
      GetDIB(Bitmap.Handle, Bitmap.Palette, BitmapHeader^, BitmapImage^);
      StretchDIBits(Canvas.Handle, DestRect.Left, DestRect.Top,
        DestRect.Right - DestRect.Left, DestRect.Bottom - DestRect.Top,
        0, 0, Bitmap.Width, Bitmap.Height, BitmapImage,
        TBitmapInfo(BitmapHeader^), DIB_RGB_COLORS, SRCCOPY);
    finally
      FreeMem(BitmapHeader, HeaderSize);
      {$IFDEF WIN32}
      FreeMem(BitmapImage, ImageSize)
      {$ELSE}
      GlobalUnlock(MemHandle);
      GlobalFree(MemHandle);
      {$ENDIF}
    end;
  finally
    Bitmap.Free;
  end;
end;

constructor TMetaFileList.Create;
begin
  inherited Create;
  FUseTempFile := False;
  FRecords := TList.Create;
  FTempFile := EmptyStr;
  FMetaFile := nil;
  FStream := nil;
end;

destructor TMetaFileList.Destroy;
begin
  Clear;
  FRecords.Free;
  inherited Destroy;
end;

procedure TMetaFileList.Clear;
begin
  FRecords.Clear;
  if Assigned(FStream) then
  begin
    FStream.Free;
    FStream := nil;
    if FUseTempFile and FileExists(FTempFile) then
      DeleteFile(FTempFile);
  end;
  if Assigned(FMetaFile) then
  begin
    FMetaFile.Free;
    FMetaFile := nil;
  end;
end;

function TMetaFileList.Add(AMetaFile: TMetaFile): Integer;
var
  Offset: LongInt;
begin
  if not Assigned(FStream) then
    FStream := CreateMetaFileStream;
  FStream.Seek(0, soFromEnd);
  Offset := FStream.Position;
  AMetaFile.SaveToStream(FStream);
  Result := FRecords.Add(Pointer(Offset));
end;

procedure TMetaFileList.LoadFromFile(const FileName: string);
var
  I: Integer;
  Data: LongInt;
  FileStream: TFileStream;
  Buffer: array[0..10240] of Byte;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    FileStream.Read(Data, SizeOf(Data));
    if MagicNumber <> Data then
      raise EInvalidPreviewFile.CreateFmt(SInvalidPreviewFile, [FileName]);
    FileStream.Read(Data, SizeOf(Data));
    for I := Data downto 1 do
    begin
      FileStream.Read(Data, SizeOf(Data));
      FRecords.Add(Pointer(Data));
    end;
    if Assigned(FStream) then FStream.Free;
    FStream := CreateMetaFileStream;
    Data := FileStream.Read(Buffer, SizeOf(Buffer));
    while Data > 0 do
    begin
      FStream.Write(Buffer, Data);
      Data := FileStream.Read(Buffer, SizeOf(Buffer));
    end;
  finally
    FileStream.Free;
  end;
end;

procedure TMetaFileList.SaveToFile(const FileName: string);
var
  I: Integer;
  Data: LongInt;
  FileStream: TFileStream;
  Buffer: array[0..10240] of Byte;
begin
  FileStream := TFileStream.Create(FileName, fmCreate or fmShareExclusive);
  try
    Data := MagicNumber;
    FileStream.Write(Data, SizeOf(Data));
    Data := FRecords.Count;
    FileStream.Write(Data, SizeOf(Data));
    for I := 0 to FRecords.Count - 1 do
    begin
      Data := LongInt(FRecords[I]);
      FileStream.Write(Data, SizeOf(Data));
    end;
    if Assigned(FStream) then
    begin
      FStream.Position := 0;
      Data := FStream.Read(Buffer, SizeOf(Buffer));
      while Data > 0 do
      begin
        FileStream.Write(Buffer, Data);
        Data := FStream.Read(Buffer, SizeOf(Buffer));
      end;
    end;
  finally
    FileStream.Free;
  end;
end;

function TMetaFileList.GetCount: Integer;
begin
  Result := FRecords.Count;
end;

function TMetaFileList.GetItems(Index: Integer): TMetaFile;
begin
  if not Assigned(FMetaFile) then
    FMetaFile := TMetaFile.Create;
  if (Index >= 0) and (Index < FRecords.Count) then
  begin
    FStream.Seek(LongInt(FRecords[Index]), soFromBeginning);
    FMetaFile.LoadFromStream(FStream);
  end
  else
  begin
    {$IFDEF WIN32}
    FMetaFile.Clear;
    {$ELSE}
    FMetaFile.Width := 0;
    {$ENDIF}
  end;
  Result := FMetaFile;
end;

procedure TMetaFileList.SetUseTempFile(Value: Boolean);
var
  NewStream: TStream;
begin
  if FUseTempFile <> Value then
  begin
    FUseTempFile := Value;
    if Assigned(FStream) then
    begin
      NewStream := CreateMetaFileStream;
      NewStream.CopyFrom(FStream, 0);
      FStream.Free;
      FStream := NewStream;
      if not FUseTempFile and FileExists(FTempFile) then
      begin
        DeleteFile(FTempFile);
        FTempFile := EmptyStr;
      end;
    end;
  end;
end;

function TMetaFileList.CreateMetaFileStream: TStream;
begin
  if FUseTempFile then
  begin
    FTempFile := GetTemporaryFileName;
    Result := TFileStream.Create(FTempFile, fmCreate or fmShareExclusive)
  end
  else
    Result := TMemoryStream.Create;
end;

{ TPaperPreview }

constructor TPaperPreview.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBorderColor := clBlack;
  FBorderSize := 1;
  FPaperColor := clWhite;
  FShadowColor := clBtnShadow;
  FShadowSize := 3;
  PaperWidth := 105;
  PaperHeight := 148;
end;

procedure TPaperPreview.Paint;
var
  R, PR: TRect;
  Region: THandle;
begin
  PR := PageRect;
  with Canvas do
  begin
    Pen.Mode := pmCopy;
    if BorderSize > 0 then
    begin
      Pen.Width := BorderSize;
      Pen.Style := psInsideFrame;
      Pen.Color := BorderColor;
      Brush.Style := bsClear;
      Rectangle(0, 0, Width - ShadowSize, Height - ShadowSize);
    end;
    if ShadowSize > 0 then
    begin
      Brush.Style := bsSolid;
      Brush.Color := ShadowColor;
      SetRect(R, Width - ShadowSize, ShadowSize, Width, Height);
      FillRect(R);
      SetRect(R, ShadowSize, Height - ShadowSize, Width, Height);
      FillRect(R);
      Brush.Color := Color;
      SetRect(R, Width - ShadowSize, 0, Width, ShadowSize);
      FillRect(R);
      SetRect(R, 0, Height - ShadowSize, ShadowSize, Height);
      FillRect(R);
    end;
    Brush.Style := bsSolid;
    Brush.Color := PaperColor;
    FillRect(PR);
  end;
  if Assigned(FOnPaint) then
  begin
    Region := CreateRectRgn(PR.Left, PR.Top, PR.Right, PR.Bottom);
    SelectClipRgn(Canvas.Handle, Region);
    try
      FOnPaint(Self, Canvas, PR);
    finally
      SelectClipRgn(Canvas.Handle, 0);
      DeleteObject(Region);
    end;
  end;
end;

function TPaperPreview.PageRect;
begin
  with Result do
  begin
    Left := BorderSize;
    Top := BorderSize;
    Right := Width - (ShadowSize + BorderSize);
    Bottom := Height - (ShadowSize + BorderSize);
  end;
end;

procedure TPaperPreview.SetPaperWidth(Value: Integer);
begin
  Width := Value + 2 * FBorderSize + FShadowSize;
end;

function TPaperPreview.GetPaperWidth: Integer;
begin
  Result := Width - 2 * FBorderSize - FShadowSize;
end;

procedure TPaperPreview.SetPaperHeight(Value: Integer);
begin
  Height := Value + 2 * FBorderSize + FShadowSize;
end;

function TPaperPreview.GetPaperHeight: Integer;
begin
  Result := Height - 2 * FBorderSize - FShadowSize;
end;

procedure TPaperPreview.SetPaperColor(Value: TColor);
begin
  if FPaperColor <> Value then
  begin
    FPaperColor := Value;
    Invalidate;
  end;
end;

procedure TPaperPreview.SetBorderColor(Value: TColor);
begin
  if FBorderColor <> Value then
  begin
    FBorderColor := Value;
    Invalidate;
  end;
end;

procedure TPaperPreview.SetBorderSize(Value: TBorderWidth);
begin
  if FBorderSize <> Value then
  begin
    FBorderSize := Value;
    Invalidate;
  end;
end;

procedure TPaperPreview.SetShadowColor(Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    Invalidate;
  end;
end;

procedure TPaperPreview.SetShadowSize(Value: TBorderWidth);
begin
  if FShadowSize <> Value then
  begin
    FShadowSize := Value;
    Invalidate;
  end;
end;

procedure TPaperPreview.WMSize(var Message: TWMSize);
begin
  inherited;
  if Assigned(FOnResize) then
    FOnResize(Self);
end;

procedure TPaperPreview.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

{ TPaperPreviewOptions }

constructor TPaperPreviewOptions.Create;
begin
  inherited Create;
  FBorderColor := clBlack;
  FBorderWidth := 1;
  FCursor := crDefault;
  FDragCursor := crHand;
  FPaperColor := clWhite;
  FShadowColor := clBtnShadow;
  FShadowWidth := 3;
end;

procedure TPaperPreviewOptions.Assign(Source: TPersistent);
begin
  if Source is TPaperPreviewOptions then
  begin
    BorderColor := TPaperPreviewOptions(Source).BorderColor;
    BorderWidth :=  TPaperPreviewOptions(Source).BorderWidth;
    Cursor := TPaperPreviewOptions(Source).Cursor;
    DragCursor := TPaperPreviewOptions(Source).DragCursor;
    PaperColor := TPaperPreviewOptions(Source).PaperColor;
    PopupMenu := TPaperPreviewOptions(Source).PopupMenu;
    ShadowColor := TPaperPreviewOptions(Source).ShadowColor;
    ShadowWidth := TPaperPreviewOptions(Source).ShadowWidth;
  end
  else
    inherited Assign(Source);
end;

procedure TPaperPreviewOptions.DoChange;
begin
  if Assigned(FOnChange) then FOnChange(self);
end;

procedure TPaperPreviewOptions.SetPaperColor(Value: TColor);
begin
  if FPaperColor <> Value then
  begin
    FPaperColor := Value;
    DoChange;
  end;
end;

procedure TPaperPreviewOptions.SetBorderColor(Value: TColor);
begin
  if FBorderColor <> Value then
  begin
    FBorderColor := Value;
    DoChange;
  end;
end;

procedure TPaperPreviewOptions.SetBorderWidth(Value: TBorderWidth);
begin
  if FBorderWidth <> Value then
  begin
    FBorderWidth := Value;
    DoChange;
  end;
end;

procedure TPaperPreviewOptions.SetShadowColor(Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    DoChange;
  end;
end;

procedure TPaperPreviewOptions.SetShadowWidth(Value: TBorderWidth);
begin
  if FShadowWidth <> Value then
  begin
    FShadowWidth := Value;
    DoChange;
  end;
end;

procedure TPaperPreviewOptions.SetCursor(Value: TCursor);
begin
  if FCursor <> Value then
  begin
    FCursor := Value;
    DoChange;
  end;
end;

procedure TPaperPreviewOptions.SetDragCursor(Value: TCursor);
begin
  if FDragCursor <> Value then
  begin
    FDragCursor := Value;
    DoChange;
  end;
end;

procedure TPaperPreviewOptions.SetPopupMenu(Value: TPopupMenu);
begin
  if FPopupMenu <> Value then
  begin
    FPopupMenu := Value;
    DoChange;
  end;
end;

{ TPrintPreview }

type
  TPaperSizeInfo = record
    ID: Byte;
    Width, Height: Integer;
  end;

const
  PaperSizes: array[TPaperType] of TPaperSizeInfo = (
    (ID: 1; Width: 2159; Height: 2794),
    (ID: 2; Width: 2159; Height: 2794),
    (ID: 3; Width: 2794; Height: 4318),
    (ID: 4; Width: 4318; Height: 2794),
    (ID: 5; Width: 2159; Height: 3556),
    (ID: 6; Width: 1397; Height: 2159),
    (ID: 7; Width: 1842; Height: 2667),
    (ID: 8; Width: 2970; Height: 4200),
    (ID: 9; Width: 2100; Height: 2970),
    (ID: 10; Width: 2100; Height: 2970),
    (ID: 11; Width: 1480; Height: 2100),
    (ID: 12; Width: 2500; Height: 3540),
    (ID: 13; Width: 1820; Height: 2570),
    (ID: 14; Width: 2159; Height: 3302),
    (ID: 15; Width: 2150; Height: 2750),
    (ID: 16; Width: 2540; Height: 3556),
    (ID: 17; Width: 2794; Height: 4318),
    (ID: 18; Width: 2159; Height: 2794),
    (ID: 19; Width: 984; Height: 2254),
    (ID: 20; Width: 1048; Height: 2413),
    (ID: 21; Width: 1143; Height: 2635),
    (ID: 22; Width: 1207; Height: 2794),
    (ID: 23; Width: 1270; Height: 2921),
    (ID: 24; Width: 4318; Height: 5588),
    (ID: 25; Width: 5588; Height: 8636),
    (ID: 26; Width: 8636; Height: 11176),
    (ID: 27; Width: 1100; Height: 2200),
    (ID: 28; Width: 1620; Height: 2290),
    (ID: 29; Width: 3240; Height: 4580),
    (ID: 30; Width: 2290; Height: 3240),
    (ID: 31; Width: 1140; Height: 1620),
    (ID: 32; Width: 1140; Height: 2290),
    (ID: 33; Width: 2500; Height: 3530),
    (ID: 34; Width: 1760; Height: 2500),
    (ID: 35; Width: 1760; Height: 1250),
    (ID: 36; Width: 1100; Height: 2300),
    (ID: 37; Width: 984; Height: 1905),
    (ID: 38; Width: 920; Height: 1651),
    (ID: 39; Width: 3778; Height: 2794),
    (ID: 40; Width: 2159; Height: 3048),
    (ID: 41; Width: 2159; Height: 3302),
    (ID: 42; Width: 2500; Height: 3530),
    (ID: 43; Width: 1000; Height: 1480),
    (ID: 44; Width: 2286; Height: 2794),
    (ID: 45; Width: 2540; Height: 2794),
    (ID: 46; Width: 3810; Height: 2794),
    (ID: 47; Width: 2200; Height: 2200),
    (ID: 50; Width: 2355; Height: 3048),
    (ID: 51; Width: 2355; Height: 3810),
    (ID: 52; Width: 2969; Height: 4572),
    (ID: 53; Width: 2354; Height: 3223),
    (ID: 54; Width: 2101; Height: 2794),
    (ID: 55; Width: 2100; Height: 2970),
    (ID: 56; Width: 2355; Height: 3048),
    (ID: 57; Width: 2270; Height: 3560),
    (ID: 58; Width: 3050; Height: 4870),
    (ID: 59; Width: 2159; Height: 3223),
    (ID: 60; Width: 2100; Height: 3300),
    (ID: 61; Width: 1480; Height: 2100),
    (ID: 62; Width: 1820; Height: 2570),
    (ID: 63; Width: 3220; Height: 4450),
    (ID: 64; Width: 1740; Height: 2350),
    (ID: 65; Width: 2010; Height: 2760),
    (ID: 66; Width: 4200; Height: 5940),
    (ID: 67; Width: 2970; Height: 4200),
    (ID: 68; Width: 3220; Height: 4450),
    (ID: 255; Width: 0; Height: 0));

const
  DefaultGutterHiMM = 600;

type
  EAbortPrint = class(EAbort);

procedure OutOfMemory;
begin
  raise EOutOfMemory.Create('Not enough memory to create a new page');
end;

procedure SwapValue(var A, B: Integer);
begin
  A := A xor B;
  B := A xor B;
  A := A xor B;
end;

{ Corrected by jcf }

function GetPrinterPhysicalPage: TRect;
var
  Ofs: TPoint;
  {$IFDEF WIN32}
  W, H: Integer;
  {$ENDIF}
begin
  Ofs := Point(0, 0);
  Escape(Printer.Handle, GETPRINTINGOFFSET, 0, nil, @Ofs);
  {$IFDEF WIN32}
  W := getDeviceCaps(Printer.Handle, PHYSICALWIDTH);
  H := getDeviceCaps(Printer.Handle, PHYSICALHEIGHT);
  SetRect(Result, -Ofs.X, -Ofs.Y, W - Ofs.X, H - Ofs.Y);
  {$ELSE}
  SetRect(Result, -Ofs.X, -Ofs.Y, Printer.PageWidth + Ofs.X, Printer.PageHeight + Ofs.Y);
  {$ENDIF}
end;

function ConvertUnits(Value, DPI: Integer; InUnits, OutUnits: TUnits): Integer;
begin
  Result := Value;
  case InUnits of
    mmLoMetric:
      case OutUnits of
        mmLoMetric: Result := Value;
        mmHiMetric: Result := Value * 10;
        mmLoEnglish: Result := MulDiv(Value, 10, 254);
        mmHiEnglish: Result := MulDiv(Value, 100, 254);
        mmTWIPS: Result := MulDiv(Value, 1440, 254);
        mmPixel: Result := MulDiv(Value, DPI, 254);
      end;
    mmHiMetric:
      case OutUnits of
        mmLoMetric: Result := Value div 10;
        mmHiMetric: Result := Value;
        mmLoEnglish: Result := Value div 254;
        mmHiEnglish: Result := MulDiv(Value, 10, 254);
        mmTWIPS: Result := MulDiv(Value, 1440, 2540);
        mmPixel: Result := MulDiv(Value, DPI, 2540);
      end;
    mmLoEnglish:
      case OutUnits of
        mmLoMetric: Result := MulDiv(Value, 254, 10);
        mmHiMetric: Result := Value * 254;
        mmLoEnglish: Result := Value;
        mmHiEnglish: Result := Value * 10;
        mmTWIPS: Result := MulDiv(Value, 1440, 10);
        mmPixel: Result := MulDiv(Value, DPI, 10);
      end;
    mmHiEnglish:
      case OutUnits of
        mmLoMetric: Result := MulDiv(Value, 254, 100);
        mmHiMetric: Result := MulDiv(Value, 254, 10);
        mmLoEnglish: Result := Value div 10;
        mmHiEnglish: Result := Value;
        mmTWIPS: Result := MulDiv(Value, 1440, 100);
        mmPixel: Result := MulDiv(Value, DPI, 100);
      end;
    mmTWIPS:
      case OutUnits of
        mmLoMetric: Result := MulDiv(Value, 254, 1440);
        mmHiMetric: Result := MulDiv(Value, 2540, 1440);
        mmLoEnglish: Result := MulDiv(Value, 10, 1440);
        mmHiEnglish: Result := MulDiv(Value, 100, 1440);
        mmTWIPS: Result := Value;
        mmPixel: Result := MulDiv(Value, DPI, 1440);
      end;
    mmPixel:
      case OutUnits of
        mmLoMetric: Result := MulDiv(Value, 254, DPI);
        mmHiMetric: Result := MulDiv(Value, 2540, DPI);
        mmLoEnglish: Result := MulDiv(Value, 10, DPI);
        mmHiEnglish: Result := MulDiv(Value, 100, DPI);
        mmTWIPS: Result := MulDiv(Value, 1440, DPI);
        mmPixel: Result := Value;
      end;
  end;
end;

constructor TPrintPreview.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Align := alClient;
  TabStop := True;
  Font.Name := 'Arial';
  Font.Size := 200;
  FAborted := False;
  FState := psReady;
  FUnits := mmHiMetric;
  FPaperType := pA4;
  FPaperWidth := 21000;
  FPaperHeight := 29700;
  FOrientation := poPortrait;
  FMarginLeft := 700;
  FMarginRight := 700;
  FMarginTop := 700;
  FMarginBottom := 700;
  FGutter := DefaultGutterHiMM;
  FZoom := 100;
  FZoomState := zsZoomToFit;
  {$IFDEF WIN32}
  FZoomSavePos := True; {ZoomPos}
  {$ENDIF}
  FFastDraw := True;
  FFastPrint := True;
  FPages := TMetaFileList.Create;
  FPaperViewOptions := TPaperPreviewOptions.Create;
  FPaperViewOptions.OnChange := PaperViewOptionsChanged;
  FPaperView := TPaperPreview.Create(Self);
  with FPaperView do
  begin
    Parent := Self;
    TabStop := False;
    Visible := False;
    OnPaint := PaintPage;
    OnClick := PaperClick;
    OnDblClick := PaperClick;
    OnMouseDown := PaperMouseDown;
    OnMouseMove := PaperMouseMove;
    OnMouseUp := PaperMouseUp;
  end;
  GetPrinterParameters;
end;

destructor TPrintPreview.Destroy;
begin
  Clear;
  FPages.Free;
  FPaperView.Free;
  inherited Destroy;
end;

procedure TPrintPreview.Loaded;
begin
  inherited Loaded;
  GetPrinterParameters;
  UpdateZoom;
end;

function TPrintPreview.ConvertUnit(Value: Integer; FromUnit, ToUnit: TUnits): Integer;
begin
  Result := ConvertUnits(Value, FPixelsPerInch.Y, FromUnit, ToUnit);
end;

function TPrintPreview.ToPrinterUnit(Value, Resolution: Integer): Integer;
begin
  Result := ConvertUnits(
    ConvertUnits(Value, Resolution, mmPixel, mmHiEnglish),
    FPixelsPerInch.Y, mmHiEnglish, FUnits);
end;

function TPrintPreview.Screen2PrinterUnit(Value: Integer): Integer;
begin
  Result := ToPrinterUnit(Value, Screen.PixelsPerInch);
end;

procedure TPrintPreview.PaintGraphic(X, Y: Integer; Graphic: TGraphic);
var
  Rect: TRect;
begin
  Rect.Left := X;
  Rect.Top := Y;
  Rect.Right := X + Screen2PrinterUnit(Graphic.Width);
  Rect.Bottom := Y + Screen2PrinterUnit(Graphic.Height);
  Canvas.StretchDraw(Rect, Graphic);
end;

procedure TPrintPreview.PaintWinControl(X, Y: Integer; WinControl: TWinControl);
var
  Bitmap: TBitmap;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.Width := WinControl.Width;
    Bitmap.Height := WinControl.Height;
    {$IFDEF WIN32}
    WinControl.PaintTo(Bitmap.Canvas.Handle, 0, 0);
    {$ENDIF}
    PaintGraphic(X, Y, Bitmap);
  finally
    Bitmap.Free;
  end;
end;

procedure TPrintPreview.WMWinIniChange(var Message: TMessage);
begin
  inherited;
  if StrIComp(PChar(Message.lParam), 'Windows') = 0 then begin
    GetPrinterParameters;
    UpdateZoom;
  end;
end;

procedure TPrintPreview.CNKeyDown(var Message: TWMKey);
var
  Key: Word;
  Shift: TShiftState;
begin
  with Message do
  begin
    Key := CharCode;
    Shift := KeyDataToShiftState(KeyData);
  end;
  if (Key = VK_HOME) and (Shift = []) then
    with HorzScrollbar do Position := 0
  else if (Key = VK_HOME) and (Shift = [ssCtrl]) then
    with VertScrollbar do Position := 0
  else if (Key = VK_END) and (Shift = []) then
    with HorzScrollbar do Position := Range
  else if (Key = VK_END) and (Shift = [ssCtrl]) then
    with VertScrollbar do Position := Range
  else if (Key = VK_LEFT) and (Shift = []) then
    with HorzScrollbar do Position := Position - Increment
  else if (Key = VK_LEFT) and (Shift = [ssCtrl]) then
    with HorzScrollbar do Position := Position - ClientWidth
  else if (Key = VK_RIGHT) and (Shift = []) then
    with HorzScrollbar do Position := Position + Increment
  else if (Key = VK_RIGHT) and (Shift = [ssCtrl]) then
    with HorzScrollbar do Position := Position + ClientWidth
  else if (Key = VK_UP) and (Shift = []) then
    with VertScrollbar do Position := Position - Increment
  else if (Key = VK_UP) and (Shift = [ssCtrl]) then
    with VertScrollbar do Position := Position - ClientHeight
  else if (Key = VK_DOWN) and (Shift = []) then
    with VertScrollbar do Position := Position + Increment
  else if (Key = VK_DOWN) and (Shift = [ssCtrl]) then
    with VertScrollbar do Position := Position + ClientHeight
  else if (Key = VK_NEXT) and (Shift = [ssCtrl]) then
    CurrentPage := TotalPages
  else if (Key = VK_PRIOR) and (Shift = [ssCtrl]) then
    CurrentPage := 1
  else if (Key = VK_NEXT) and (Shift = []) then
    CurrentPage := CurrentPage + 1
  else if (Key = VK_PRIOR) and (Shift = []) then
    CurrentPage := CurrentPage - 1
  else
    inherited;
end;

procedure TPrintPreview.PaperClick(Sender: TObject);
begin
  Click;
end;

procedure TPrintPreview.PaperDblClick(Sender: TObject);
begin
  DblClick;
end;

procedure TPrintPreview.PaperMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not Focused and Enabled then SetFocus;
  FOldMousePos := Point(X, Y);
  MouseDown(Button, Shift, X, Y);
end;

procedure TPrintPreview.PaperMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  Delta: TPoint;
begin
  MouseMove(Shift, X, Y);
  if ssLeft in Shift then
  begin
    if FCanScrollHorz then
    begin
      Delta.X := X - FOldMousePos.X;
      if not (AutoScroll and HorzScrollBar.Visible) then
      begin
        if FPaperView.Left + Delta.X < ClientWidth - HorzScrollBar.Margin - FPaperView.Width then
          Delta.X := ClientWidth - HorzScrollBar.Margin - FPaperView.Width - FPaperView.Left
        else if FPaperView.Left + Delta.X > HorzScrollBar.Margin then
          Delta.X := HorzScrollBar.Margin - FPaperView.Left;
        FPaperView.Left := FPaperView.Left + Delta.X;
      end
      else
        HorzScrollBar.Position := HorzScrollBar.Position - Delta.X;
    end;
    if FCanScrollVert then
    begin
      Delta.Y := Y - FOldMousePos.Y;
      if not (AutoScroll and VertScrollBar.Visible) then
      begin
        if FPaperView.Top + Delta.Y < ClientHeight - VertScrollBar.Margin - FPaperView.Height then
          Delta.Y := ClientHeight - VertScrollBar.Margin - FPaperView.Height - FPaperView.Top
        else if FPaperView.Top + Delta.Y > VertScrollBar.Margin then
          Delta.Y := VertScrollBar.Margin - FPaperView.Top;
        FPaperView.Top := FPaperView.Top + Delta.Y;
      end
      else 
        VertScrollBar.Position := VertScrollBar.Position - Delta.Y;
    end;
  end;
end;

procedure TPrintPreview.PaperMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseUp(Button, Shift, X, Y);
end;

procedure TPrintPreview.SetPrinterParameters;
const
  Orientations: array[TPrinterOrientation] of Integer =
    (DMORIENT_PORTRAIT, DMORIENT_LANDSCAPE);
var
  DevMode: PDevMode;
  DeviceMode: THandle;
  Device, Driver, Port: array[0..255] of Char;
  PaperSize: TPoint;
  {$IFDEF WIN32}
  DriverInfo2: PDriverInfo2;
  NeededSize: DWord;
  hPrinter: THandle;
  {$ENDIF}
begin
  if Printer.Printers.Count <= 0 then Exit;
  if not (Printer.PrinterIndex in [0..Printer.Printers.Count - 1]) then
    Printer.PrinterIndex := -1;
  Printer.GetPrinter(Device, Driver, Port, DeviceMode);
  {$IFDEF WIN32}
  hPrinter := Printer.Handle;
  OpenPrinter(Device, hPrinter, nil);
  GetMem(DriverInfo2, 255);
  GetPrinterDriver(hPrinter, nil, 2, DriverInfo2, 255, NeededSize);
  StrPCopy(Driver, ExtractFileName(StrPas(DriverInfo2^.PDriverPath)));
  FreeMem(DriverInfo2, 255);
  {$ENDIF}
  DevMode := PDevMode(GlobalLock(DeviceMode));
  with DevMode^ do
  begin
    dmFields := dmFields or DM_PAPERSIZE;
    if FPaperType = pCustom then
    begin
      PaperSize.X := ConvertUnits(FPaperWidth, FPixelsPerInch.X, FUnits, mmLoMetric);
      PaperSize.Y := ConvertUnits(FPaperHeight, FPixelsPerInch.Y, FUnits, mmLoMetric);
      if FOrientation = poLandscape then SwapValue(PaperSize.X, PaperSize.Y);
      dmPaperSize := DMPAPER_USER;
      dmFields := dmFields or DM_PAPERWIDTH;
      dmPaperWidth := PaperSize.X;
      dmFields := dmFields or DM_PAPERLENGTH;
      dmPaperLength := PaperSize.Y;
    end
    else
      dmPaperSize := PaperSizes[FPaperType].ID;
    dmFields := dmFields or DM_ORIENTATION;
    dmOrientation := Orientations[(FOrientation)];
  end;
  GlobalUnlock(DeviceMode);
  Printer.SetPrinter(Device, Driver, Port, DeviceMode);
end;

procedure TPrintPreview.GetPrinterParameters;
begin
  if Printer.Printers.Count > 0 then
  begin
    FPrinterInstalled := True;
    if not Printer.Printing then
    begin
      Printer.Orientation := FOrientation;
      FPixelsPerInch.X := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
      FPixelsPerInch.Y := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
    end
  end
  else
  begin
    FPrinterInstalled := False;
    FPixelsPerInch.X := Screen.PixelsPerInch;
    FPixelsPerInch.Y := Screen.PixelsPerInch;
  end;
  FPixels.X := ConvertUnits(FPaperWidth, FPixelsPerInch.X, FUnits, mmPixel);
  FPixels.Y := ConvertUnits(FPaperHeight, FPixelsPerInch.Y, FUnits, mmPixel);
end;

procedure TPrintPreview.Resize;
begin
  inherited Resize;
  UpdateZoom;
end;

{$IFDEF WIN32}
{$WARNINGS OFF}
{$ENDIF}
procedure TPrintPreview.UpdateZoom;
var
  Space: TPoint;
  PV: TPaperPreview;
  IsAutoScroll: Boolean;
  PercentX, PercentY: LongInt;  {ZoomPos}
begin
  if csLoading in ComponentState then Exit;

  Space.X := ClientWidth - 2 * HorzScrollBar.Margin;
  Space.Y := ClientHeight - 2 * VertScrollBar.Margin;

  {$IFDEF WIN32}
  if ZoomSavePos then {ZoomPos}
  try
    PercentX := HorzScrollbar.Position * 100 div (HorzScrollBar.Range - Space.X + 1);
    PercentY := VertScrollbar.Position * 100 div (VertScrollbar.Range - Space.Y - 1);
  except
    PercentX := 0;
    PercentY := 0;
  end;
  {$ENDIF}

  HorzScrollBar.Position := 0;
  VertScrollBar.Position := 0;
  IsAutoScroll := AutoScroll;
  PV := TPaperPreview.Create(nil);
  try
    PV.BorderSize := FPaperView.BorderSize;
    PV.ShadowSize := FPaperView.ShadowSize;

    case FZoomState of
      zsZoomOther:
      begin
        PV.PaperWidth := MulDiv(FPixels.X, FZoom * Screen.PixelsPerInch, FPixelsPerInch.X * 100);
        PV.PaperHeight := MulDiv(FPixels.Y, FZoom * Screen.PixelsPerInch, FPixelsPerInch.Y * 100);
      end;
      zsZoomToWidth:
      begin
        HorzScrollBar.Range := 0;
        PV.Width := Space.X;
        PV.PaperHeight := MulDiv(PV.PaperWidth, FPixels.Y, FPixels.X);
      end;
      zsZoomToHeight:
      begin
        VertScrollBar.Range := 0;
        PV.Height := Space.Y;
        PV.PaperWidth := MulDiv(PV.PaperHeight, FPixels.X, FPixels.Y);
      end;
      zsZoomToFit:
      begin
        HorzScrollBar.Range := 0;
        VertScrollBar.Range := 0;
        if (FPixels.Y / FPixels.X) < (Space.Y / Space.X) then
        begin
          PV.Width := Space.X;
          PV.PaperHeight := MulDiv(PV.PaperWidth, FPixels.Y, FPixels.X);
        end
        else
        begin
          PV.Height := Space.Y;
          PV.PaperWidth := MulDiv(PV.PaperHeight, FPixels.X, FPixels.Y);
        end;
      end;
    end;

    FCanScrollHorz := (PV.Width > Space.X);
    if not FCanScrollHorz then
      PV.Left := HorzScrollBar.Margin + (Space.X - PV.Width) div 2
    else
      PV.Left := HorzScrollBar.Margin;
    FCanScrollVert := (PV.Height > Space.Y);
    if not FCanScrollVert then
      PV.Top := VertScrollBar.Margin + (Space.Y - PV.Height) div 2
    else
      PV.Top := VertScrollBar.Margin;
    FPaperView.BoundsRect := PV.BoundsRect;

    {$IFDEF WIN32}
    if ZoomSavePos then {ZoomPos}
    begin
      HorzScrollbar.Position := PercentX * (HorzScrollBar.Range - Space.X) div 100;  {ZoomPos}
      VertScrollbar.Position := PercentY * (VertScrollbar.Range - Space.Y) div 100;  {ZoomPos}
    end;
   {$ENDIF}

  finally
    PV.Free;
    AutoScroll := IsAutoScroll;
  end;

  Update;

  if FCanScrollHorz or FCanScrollVert then
    FPaperView.Cursor := FPaperViewOptions.DragCursor
  else
    FPaperView.Cursor := FPaperViewOptions.Cursor;

end;
{$IFDEF WIN32}
{$WARNINGS ON}
{$ENDIF}

procedure TPrintPreview.PaintPage(Sender: TObject; Canvas: TCanvas; PageRect: TRect);
var
  W, H: Integer;
  Bitmap: TBitmap;
  MetaFile: TMetaFile;
begin
  if (FCurrentPage >= 1) and (FCurrentPage <= TotalPages) then
  begin
    MetaFile := TMetaFile(FPages[FCurrentPage-1]);
    if FFastDraw then
      Canvas.StretchDraw(PageRect, MetaFile)
    else
    begin
      W := PageRect.Right - PageRect.Left;
      H := PageRect.Bottom - PageRect.Top;
      Bitmap := TBitmap.Create;
      try
        Bitmap.Width := W;
        Bitmap.Height := H;
        Bitmap.Canvas.StretchDraw(Rect(0, 0, W, H), MetaFile);
        BitBlt(Canvas.Handle, PageRect.Left, PageRect.Top, W, H,
               Bitmap.Canvas.Handle, 0, 0, SRCCOPY);
      finally
        Bitmap.Free;
      end;
    end;
  end;
end;

procedure TPrintPreview.PaperViewOptionsChanged(Sender: TObject);
begin
  FPaperView.PaperColor := FPaperViewOptions.PaperColor;
  FPaperView.BorderColor := FPaperViewOptions.BorderColor;
  FPaperView.BorderSize := FPaperViewOptions.BorderWidth;
  FPaperView.ShadowColor := FPaperViewOptions.ShadowColor;
  FPaperView.ShadowSize := FPaperViewOptions.ShadowWidth;
  FPaperView.PopupMenu := FPaperViewOptions.PopupMenu;
  UpdateZoom;
end;

procedure TPrintPreview.SetPaperViewOptions(Value: TPaperPreviewOptions);
begin
  FPaperViewOptions.Assign(Value);
end;

procedure TPrintPreview.SetUnits(Value: TUnits);
begin
  if FUnits <> Value then
  begin
    FGutter := ConvertUnits(FGutter, FPixelsPerInch.Y, FUnits, Value);
    FMarginLeft := ConvertUnits(FMarginLeft, FPixelsPerInch.X, FUnits, Value);
    FMarginRight := ConvertUnits(FMarginRight, FPixelsPerInch.X, FUnits, Value);
    FMarginTop := ConvertUnits(FMarginTop, FPixelsPerInch.Y, FUnits, Value);
    FMarginBottom := ConvertUnits(FMarginBottom, FPixelsPerInch.Y, FUnits, Value);
    FPaperWidth := ConvertUnits(FPaperWidth, FPixelsPerInch.X, FUnits, Value);
    FPaperHeight := ConvertUnits(FPaperHeight, FPixelsPerInch.Y, FUnits, Value);
    Font.Size := ConvertUnits(Font.Size, FPixelsPerInch.Y, FUnits, Value);
    if Assigned(FCanvas) then
    begin
      AdjustCanvasView;
      FCanvas.Font.Size := ConvertUnits(FCanvas.Font.Size, FPixelsPerInch.Y, FUnits, Value);
      FCanvas.Pen.Width := ConvertUnits(FCanvas.Pen.Width, FPixelsPerInch.Y, FUnits, Value);
    end;
    FUnits := Value;
  end;
end;

procedure TPrintPreview.SetMarginLeft(Value: Integer);
begin
  FMarginLeft := Value;
  if FMarginLeft < FGutter then
    FMarginLeft := FGutter;
end;

procedure TPrintPreview.SetMarginRight(Value: Integer);
begin
  FMarginRight := Value;
  if FMarginRight < FGutter then
    FMarginRight := FGutter;
end;

procedure TPrintPreview.SetMarginTop(Value: Integer);
begin
  FMarginTop := Value;
  if FMarginTop < FGutter then
    FMarginTop := FGutter;
end;

procedure TPrintPreview.SetMarginBottom(Value: Integer);
begin
  FMarginBottom := Value;
  if FMarginBottom < FGutter then
    FMarginBottom := FGutter;
end;

procedure TPrintPreview.SetPaperType(Value: TPaperType);
begin
  if FPaperType <> Value then
  begin
    FPaperType := Value;
    if FPaperType <> pCustom then
    begin
      with PaperSizes[FPaperType] do
      begin
        FPaperWidth := ConvertUnits(Width, FPixelsPerInch.X, mmLoMetric, FUnits);
        FPaperHeight := ConvertUnits(Height, FPixelsPerInch.Y, mmLoMetric, FUnits);
      end;
      if FOrientation = poLandscape then
        SwapValue(FPaperWidth, FPaperHeight);
      GetPrinterParameters;
      UpdateZoom;
    end;
  end;
end;

procedure TPrintPreview.SetPaperWidth(Value: Integer);
begin
  if Value > High(SmallInt) then Value := High(SmallInt)
  else if Value < 1 then Value := 1;
  if FPaperWidth <> Value then
  begin
    FPaperType := pCustom;
    FPaperWidth := Value;
    GetPrinterParameters;
    UpdateZoom;
  end;
end;

procedure TPrintPreview.SetPaperHeight(Value: Integer);
begin
  if Value > High(SmallInt) then Value := High(SmallInt)
  else if Value < 1 then Value := 1;
  if FPaperHeight <> Value then
  begin
    FPaperType := pCustom;
    FPaperHeight := Value;
    GetPrinterParameters;
    UpdateZoom;
  end;
end;

function TPrintPreview.IsCustomSize: Boolean;
begin
  Result := (FPaperType = pCustom);
end;

procedure TPrintPreview.SetOrientation(Value: TPrinterOrientation);
begin
  if (FOrientation <> Value) and (FState <> psCreating) then
  begin
    FOrientation := Value;
    SwapValue(FPaperWidth, FPaperHeight);
    GetPrinterParameters;
    UpdateZoom;
  end;
end;

procedure TPrintPreview.SetZoom(Value: Integer);
begin
  if (FZoom <> Value) or (FZoomState <> zsZoomOther) then
  begin
    FZoom := Value;
    FZoomState := zsZoomOther;
    UpdateZoom;
  end;
end;

procedure TPrintPreview.SetZoomState(Value: TZoomState);
begin
  if FZoomState <> Value then
  begin
    FZoomState := Value;
    UpdateZoom;
  end;
end;

procedure TPrintPreview.SetCurrentPage(Value: Integer);
begin
  if TotalPages <> 0 then
  begin
    if Value < 1 then Value := 1;
    if Value > TotalPages then Value := TotalPages;
    if FCurrentPage <> Value then
    begin
      FCurrentPage := Value;
      FPaperView.Refresh;
      if Assigned(FOnChange) then
        FOnChange(Self);
    end;
  end;
end;

function TPrintPreview.GetUseTempFile: Boolean;
begin
  Result := FPages.UseTempFile;
end;

procedure TPrintPreview.SetUseTempFile(Value: Boolean);
begin
  FPages.UseTempFile := Value;
end;

function TPrintPreview.GetTotalPages: Integer;
begin
  Result := FPages.Count;
end;

function TPrintPreview.GetPageWidth: Integer;
begin
  Result := FPaperWidth - (FMarginLeft + FMarginRight);
end;

function TPrintPreview.GetPageHeight: Integer;
begin
  Result := FPaperHeight - (FMarginTop + FMarginBottom);
end;

function TPrintPreview.GetPages(PageNo: Integer): TMetaFile;
begin
  if (PageNo >= 1) and (PageNo <= TotalPages) then
    Result := TMetaFile(FPages[PageNo-1])
  else
    Result := nil;
end;

function TPrintPreview.GetPageRect: TRect;
begin
  with Result do
  begin
    Left := FMarginLeft;
    Right := FPaperWidth - FMarginRight;
    Top := FMarginTop;
    Bottom := FPaperHeight - FMarginBottom;
  end;
end;

function TPrintPreview.GetCanvas: TCanvas;
begin
  if (FState = psCreating) and Assigned(FCanvas) then
    Result := FCanvas
  else
    Result := Printer.Canvas;
end;

procedure TPrintPreview.AdjustCanvasView;
begin
  SetMapMode(FCanvas.Handle, MM_ANISOTROPIC);
  {$IFDEF WIN32}
  SetWindowExtEx(FCanvas.Handle, FPaperWidth, FPaperHeight, nil);
  SetViewPortExtEx(FCanvas.Handle, FPixels.X, FPixels.Y, nil);
  {$ELSE}
  WinProcs.SetWindowExt(FCanvas.Handle, FPaperWidth, FPaperHeight);
  {$ENDIF}
end;

procedure TPrintPreview.CreateMetaFileCanvas;
begin
  Metafile := TMetafile.Create;
  {$IFDEF WIN32}
  MetaFile.Width := FPixels.X;
  MetaFile.Height := FPixels.Y;
  FCanvas := TMetafileCanvas.Create(Metafile, 0);
  {$ELSE}
  FCanvas := TCanvas.Create;
  FCanvas.Handle := CreateMetaFile(nil);
  {$ENDIF}
  if FCanvas.Handle = 0 then
  begin
    MetaFile.Free;
    OutOfMemory;
  end;
  AdjustCanvasView;
  FCanvas.Font.Assign(Font);
end;

procedure TPrintPreview.CloseMetaFileCanvas;
{$IFNDEF WIN32}
var
  Temp: HDC;
{$ENDIF}
begin
  {$IFNDEF WIN32}
  Temp := FCanvas.Handle;
  FCanvas.Handle := 0;
  MetaFile.Handle := CloseMetaFile(Temp);
  MetaFile.Width := FPixels.X;
  MetaFile.Height := FPixels.Y;
  {$ENDIF}
  FCanvas.Free;
  FCanvas := nil;
  if MetaFile.Handle = 0 then
  begin
    MetaFile.Free;
    OutOfMemory;
  end;
end;

procedure TPrintPreview.Clear;
begin
  FPages.Clear;
  FState := psReady;
  FCurrentPage := 0;
  FAborted := False;
  FPaperView.Visible := False;
  if not (csDestroying in ComponentState) and Assigned(FOnChange) then
    OnChange(Self)
end;

procedure TPrintPreview.BeginDoc;
begin
  if FState <> psCreating then
  begin
    Clear;
    GetPrinterParameters;
    FState := psCreating;
    if Assigned(FOnBeginDoc) then
      FOnBeginDoc(Self);
    NewPage;
  end;
end;

procedure TPrintPreview.EndDoc;
begin
  if FState = psCreating then
  begin
    CloseMetaFileCanvas;
    try
      FPages.Add(MetaFile);
    finally
      MetaFile.Free;
    end;
    if FCurrentPage = 0 then
    begin
      FCurrentPage := 1;
      FPaperView.Visible := True;
      FPaperView.Update;
    end;
    if Assigned(FOnChange) then
      OnChange(Self);
    if Assigned(FOnEndDoc) then
      FOnEndDoc(Self);
    FState := psReady;
  end;
end;

procedure TPrintPreview.NewPage;
begin
  if FState = psCreating then
  begin
    if Assigned(FCanvas) then
    begin
      CloseMetaFileCanvas;
      try
        FPages.Add(MetaFile);
      finally
        MetaFile.Free;
      end;
      if FCurrentPage = 0 then
      begin
        FCurrentPage := 1;
        FPaperView.Visible := True;
        FPaperView.Update;
      end;
      if Assigned(FOnChange) then
        OnChange(Self)
    end;
    CreateMetaFileCanvas;
    if Assigned(FOnNewPage) then
      FOnNewPage(Self);
  end;
end;

procedure TPrintPreview.Abort;
begin
  FAborted := True;
  case State of
    psCreating: begin
      if Assigned(FOnAbort) then
        FOnAbort(Self);
      CloseMetaFileCanvas;
      if Assigned(MetaFile) then
        MetaFile.Free;
      Clear;
    end;
    psPrinting:
      if Printer.Printing and not Printer.Aborted then
        Printer.Abort;
  end;
end;

procedure TPrintPreview.LoadFromFile(const FileName: String);
begin
  Clear;
  FPages.LoadFromFile(FileName);
  if FPages.Count > 0 then
  begin
    FCurrentPage := 1;
    FPaperView.Visible := True;
    FPaperView.Update;
  end;
  if Assigned(FOnChange) then
    OnChange(Self)
end;

procedure TPrintPreview.SaveToFile(const FileName: String);
begin
  FPages.SaveToFile(FileName);
end;

procedure TPrintPreview.Print;
begin
  PrintPages(1, TotalPages);
end;

procedure TPrintPreview.PrintPages(StartPage, StopPage: Integer);
var
  SavedDC: HDC;
  PageRect: TRect;
  PageNo: Integer;
  AbortIt: Boolean;
  PrintedPages, TotalPrintPages: Integer;
begin
  if StartPage < 1 then StartPage := 1;
  if StartPage > TotalPages then StartPage := TotalPages;
  if StopPage < 1 then StartPage := 1;
  if StopPage > TotalPages then StopPage := TotalPages;
  if (FState = psReady) and (StopPage >= StartPage) and (Printer.Printers.Count > 0) then
  begin
    FState := psPrinting;
    FAborted := False;
    PrintedPages := 0;
    TotalPrintPages := StopPage - StartPage + 1;
    try try
      if Assigned(FOnBeforePrint) then
        FOnBeforePrint(Self);
      SetPrinterParameters;
      PageRect := GetPrinterPhysicalPage;
      Printer.Title := PrintJobTitle;
      AbortIt := False;
      Printer.BeginDoc;
      for PageNo := StartPage to StopPage do
      begin
        if Assigned(FOnPrintProgress) then
          FOnPrintProgress(Self, PageNo, MulDiv(100, PrintedPages, TotalPrintPages), AbortIt);
        if Printer.Aborted or AbortIt then raise EAbortPrint.Create(EmptyStr);
        SavedDC := SaveDC(Printer.Canvas.Handle);
        try
          SetMapMode(Printer.Canvas.Handle, MM_ANISOTROPIC);
          SetWindowExtEx(Printer.Canvas.Handle, FPixels.X,  FPixels.Y,  nil);
          SetViewportExtEx(Printer.Canvas.Handle, PageRect.Right - PageRect.Left, PageRect.Bottom - PageRect.Top, nil);
          if FFastPrint then
            Printer.Canvas.StretchDraw(PageRect, TMetaFile(FPages[PageNo-1]))
          else
            PrintGraphic(Printer.Canvas, PageRect, TMetaFile(FPages[PageNo-1]));
        finally
          RestoreDC(Printer.Canvas.Handle, SavedDC);
        end;
        Inc(PrintedPages);
        Application.ProcessMessages;
        if Assigned(FOnPrintProgress) then
          FOnPrintProgress(Self, PageNo, MulDiv(100, PrintedPages, TotalPrintPages), AbortIt);
        if AbortIt then
          raise EAbortPrint.Create(EmptyStr)
        else if not Printer.Aborted and (PageNo <> StopPage) then
        begin
          if FFastPrint then
            Printer.NewPage
          else
          begin
            Printer.EndDoc;
            Printer.BeginDoc;
          end;
        end;
      end;
    except
      on EAbortPrint do
        ;
      on E: Exception do
      begin
        AbortIt := True;
        Application.ShowException(E);
      end;
    end;
    finally
      if AbortIt then
      begin
        FAborted := True;
        if Printer.Printing then Printer.Abort;
        if Assigned(FOnAbort) then FOnAbort(Self);
      end;
      if Printer.Printing then Printer.EndDoc;
      if not AbortIt and Assigned(FOnAfterPrint) then
        FOnAfterPrint(Self);
      Printer.Title := EmptyStr;
      FState := psReady;
    end;
  end;
end;

procedure TPrintPreview.SetAbout(Value: String);
const
  AboutMsg = 'TPrintPreview v3.00'#10#13 +
             'by Kambiz R. Khojasteh'#10#13#10#13 +
             'email: khojasteh@mail.com'#13#10 +
             'web: http://www.crosswinds.net/~khojasteh/'#13#10#13#10 +
             'This component is freeware.'#10#13;
begin
  MessageDlg(AboutMsg, mtInformation, [mbOK], 0);
end;

function TPrintPreview.GetAbout: String;
begin
  Result := '(About)';
end;

begin
  Screen.Cursors[crHand] := LoadCursor(hInstance, 'CURSOR_HAND');
end.

