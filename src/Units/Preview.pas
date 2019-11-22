{

 TPrintPreview v1.4 & TPaperPreview v1.0 for Delphi

 Author: Kambiz R. Khojasteh
 Last modified: October 3, 2000

 mail: khojasteh@mail.com
 web: http://www.crosswinds.net/~khojasteh/

}

unit Preview;

interface

uses
  {$IFDEF WIN32} Windows, WinSpool, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  Messages, Classes, Graphics, Controls, SysUtils, Forms, Dialogs, StdCtrls,
  ExtCtrls, Menus, Printers;

const
  crHand: TCursor = {$IFDEF WIN32} crHandPoint {$ELSE} crDefault {$ENDIF};

type

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
    procedure WMEraseBkGnd(var Message: TWMEraseBkGnd); message WM_ERASEBKGND;
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

  { TPrintPreview}

  TPreviewPrintProgress = procedure(Sender: TObject; PageNum, Progress: Integer; var AbortIt: Boolean) of object;

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

  TPrintPreview = class(TCustomPanel)
  private
    FClient: TPanel;
    FHorzScrollBar: TScrollBar;
    FVertScrollBar: TScrollBar;
    FPaperView: TPaperPreview;
    FPrintJobTitle: String;
    FPages: TList;
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
    FOnBeginDoc: TNotifyEvent;
    FOnEndDoc: TNotifyEvent;
    FOnNewPage: TNotifyEvent;
    FOnAbort: TNotifyEvent;
    FOnChange: TNotifyEvent;
    FOnPrintProgress: TPreviewPrintProgress;
    FOnBeforePrint: TNotifyEvent;
    FOnAfterPrint: TNotifyEvent;
    MetaFile: TMetafile;
    OldMousePos: TPoint;
    procedure SetAbout(Value: String);
    function GetAbout: String;
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
    procedure SetHorzScrollBar(Value: TScrollBar);
    procedure SetVertScrollBar(Value: TScrollBar);
    function GetTotalPages: Integer;
    function GetPageWidth: Integer;
    function GetPageHeight: Integer;
    function GetPageRect: TRect;
    function GetPages(PageNo: Integer): TMetaFile;
    function GetCanvas: TCanvas;
    procedure CreateMetaFileCanvas;
    procedure DestroyMetaFileCanvas;
    procedure GetPrinterParameters;
    procedure SetPrinterParameters;
    procedure VScroll(Sender: TObject);
    procedure HScroll(Sender: TObject);
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
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Screen2PrinterUnit(Value: Integer): Integer;
    function ConvertUnit(Value: Integer; FromUnit, ToUnit: TUnits): Integer;
    procedure Clear;
    procedure BeginDoc;
    procedure EndDoc;
    procedure NewPage;
    procedure Abort;
    procedure Print;
    procedure UpdateZoom;
    procedure PrintPages(StartPage, StopPage: Integer);
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
    property Paper: TPaperPreview read FPaperView;
    property HorzScrollBar: TScrollBar read FHorzScrollBar write SetHorzScrollBar;
    property VertScrollBar: TScrollBar read FVertScrollBar write SetVertScrollBar;
  published
    property About: String read GetAbout write SetAbout stored False;
    property Align default alClient;
    property BorderStyle;
    property BevelInner;
    property BevelOuter;
    property BorderWidth;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property Color;
    property Ctl3D;
    property ParentColor;
    property ParentCtl3D;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property PrintJobTitle: String read FPrintJobTitle write FPrintJobTitle;
    property Units: TUnits read FUnits write SetUnits default mmHiMetric;
    property PaperType: TPaperType read FPaperType write SetPaperType default pA4;
    property PaperWidth: Integer read FPaperWidth write SetPaperWidth stored IsCustomSize;
    property PaperHeight: Integer read FPaperHeight write SetPaperHeight stored IsCustomSize;
    property Orientation: TPrinterOrientation read FOrientation write SetOrientation default poPortrait;
    property MarginLeft: Integer read FMarginLeft write SetMarginLeft default 700;
    property MarginRight: Integer read FMarginRight write SetMarginRight default 700;
    property MarginTop: Integer read FMarginTop write SetMarginTop default 700;
    property MarginBottom: Integer read FMarginBottom write SetMarginBottom default 700;
    property ZoomState: TZoomState read FZoomState write SetZoomState default zsZoomToFit;
    property Zoom: Integer read FZoom write SetZoom default 100;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
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
{$ELSE}
  {$R *.D16}
{$ENDIF}

procedure Register;
begin
  RegisterComponents('Samples', [TPrintPreview, TPaperPreview]);
end;

procedure OutOfMemory;
begin
 raise EOutOfMemory.Create('Not enough memory to create a new page');
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
    DeleteObject(Region);
    try
      FOnPaint(Self, Canvas, PR);
    finally
      SelectClipRgn(Canvas.Handle, 0);
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
    InvalidateRect(Handle, nil, False);
  end;
end;

procedure TPaperPreview.SetBorderColor(Value: TColor);
begin
  if FBorderColor <> Value then
  begin
    FBorderColor := Value;
    InvalidateRect(Handle, nil, False);
  end;
end;

procedure TPaperPreview.SetBorderSize(Value: TBorderWidth);
begin
  if FBorderSize <> Value then
  begin
    FBorderSize := Value;
    InvalidateRect(Handle, nil, False);
  end;
end;

procedure TPaperPreview.SetShadowColor(Value: TColor);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    InvalidateRect(Handle, nil, False);
  end;
end;

procedure TPaperPreview.SetShadowSize(Value: TBorderWidth);
begin
  if FShadowSize <> Value then
  begin
    FShadowSize := Value;
    InvalidateRect(Handle, nil, False);
  end;
end;

procedure TPaperPreview.WMSize(var Message: TWMSize);
begin
  inherited;
  if Assigned(FOnResize) then
    FOnResize(Self);
end;

procedure TPaperPreview.WMEraseBkGnd(var Message: TWMEraseBkGnd);
begin
  Message.Result := 1;
end;

{ TPrintPreview }

type
  TPaperSizeInfo = record
    ID: Byte;
    Width, Height: Integer;
  end;

const
  PaperSizes: array[TPaperType] of TPaperSizeInfo = (
    (ID:1; Width:2159; Height:2794),
    (ID:2; Width:2159; Height:2794),
    (ID:3; Width:2794; Height:4318),
    (ID:4; Width:4318; Height:2794),
    (ID:5; Width:2159; Height:3556),
    (ID:6; Width:1397; Height:2159),
    (ID:7; Width:1842; Height:2667),
    (ID:8; Width:2970; Height:4200),
    (ID:9; Width:2100; Height:2970),
    (ID:10; Width:2100; Height:2970),
    (ID:11; Width:1480; Height:2100),
    (ID:12; Width:2500; Height:3540),
    (ID:13; Width:1820; Height:2570),
    (ID:14; Width:2159; Height:3302),
    (ID:15; Width:2150; Height:2750),
    (ID:16; Width:2540; Height:3556),
    (ID:17; Width:2794; Height:4318),
    (ID:18; Width:2159; Height:2794),
    (ID:19; Width:984;  Height:2254),
    (ID:20; Width:1048; Height:2413),
    (ID:21; Width:1143; Height:2635),
    (ID:22; Width:1207; Height:2794),
    (ID:23; Width:1270; Height:2921),
    (ID:24; Width:4318; Height:5588),
    (ID:25; Width:5588; Height:8636),
    (ID:26; Width:8636; Height:11176),
    (ID:27; Width:1100; Height:2200),
    (ID:28; Width:1620; Height:2290),
    (ID:29; Width:3240; Height:4580),
    (ID:30; Width:2290; Height:3240),
    (ID:31; Width:1140; Height:1620),
    (ID:32; Width:1140; Height:2290),
    (ID:33; Width:2500; Height:3530),
    (ID:34; Width:1760; Height:2500),
    (ID:35; Width:1760; Height:1250),
    (ID:36; Width:1100; Height:2300),
    (ID:37; Width:984;  Height:1905),
    (ID:38; Width:920;  Height:1651),
    (ID:39; Width:3778; Height:2794),
    (ID:40; Width:2159; Height:3048),
    (ID:41; Width:2159; Height:3302),
    (ID:42; Width:2500; Height:3530),
    (ID:43; Width:1000; Height:1480),
    (ID:44; Width:2286; Height:2794),
    (ID:45; Width:2540; Height:2794),
    (ID:46; Width:3810; Height:2794),
    (ID:47; Width:2200; Height:2200),
    (ID:50; Width:2355; Height:3048),
    (ID:51; Width:2355; Height:3810),
    (ID:52; Width:2969; Height:4572),
    (ID:53; Width:2354; Height:3223),
    (ID:54; Width:2101; Height:2794),
    (ID:55; Width:2100; Height:2970),
    (ID:56; Width:2355; Height:3048),
    (ID:57; Width:2270; Height:3560),
    (ID:58; Width:3050; Height:4870),
    (ID:59; Width:2159; Height:3223),
    (ID:60; Width:2100; Height:3300),
    (ID:61; Width:1480; Height:2100),
    (ID:62; Width:1820; Height:2570),
    (ID:63; Width:3220; Height:4450),
    (ID:64; Width:1740; Height:2350),
    (ID:65; Width:2010; Height:2760),
    (ID:66; Width:4200; Height:5940),
    (ID:67; Width:2970; Height:4200),
    (ID:68; Width:3220; Height:4450),
    (ID:255; Width:0; Height:0));

const
  DefaultGutterHiMM = 600;
  Margin = 6;

type EAbortPrint = class(Exception);

procedure SwapValue(var A, B: Integer);
begin
  A := A xor B;
  B := A xor B;
  A := A xor B;
end;

function GetPrinterPhysicalPage: TRect;
var
  Ofs: TPoint;
begin
  Ofs := Point(0, 0);
  Escape(Printer.Handle, GETPRINTINGOFFSET, 0, nil, @Ofs);
  Result := Rect(-Ofs.X, -Ofs.Y, Printer.PageWidth + Ofs.X, Printer.PageHeight + Ofs.Y);
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

(*
function ConvertUnits(Value, DPI: Integer; InUnits, OutUnits: TUnits): Integer;
var
  Pixels: Integer;
begin
  if InUnits = OutUnits then
    Result := Value
  else
  begin
    case InUnits of
      mmLoMetric: Pixels := MulDiv(Value, DPI, 254);
      mmHiMetric: Pixels := MulDiv(Value, DPI, 2540);
      mmLoEnglish: Pixels := MulDiv(Value, DPI, 10);
      mmHiEnglish: Pixels := MulDiv(Value, DPI, 100);
      mmTWIPS: Pixels := MulDiv(Value, DPI, 1440);
    else { mmPixel }
      Pixels := Value;
    end;
    case OutUnits of
      mmLoMetric: Result := MulDiv(Pixels, 254, DPI);
      mmHiMetric: Result := MulDiv(Pixels, 2540, DPI);
      mmLoEnglish: Result := MulDiv(Pixels, 10, DPI);
      mmHiEnglish: Result := MulDiv(Pixels, 100, DPI);
      mmTWIPS: Result := MulDiv(Pixels, 1440, DPI);
    else { mmPixel }
      Result := Pixels;
    end;
  end;
end;
*)

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
  FPages := TList.Create;
  FVertScrollBar := TScrollBar.Create(Self);
  FVertScrollBar.Parent := Self;
  with FVertScrollBar do
  begin
    Kind := sbVertical;
    TabStop := False;
    SmallChange := 8;
    Max := 0;
    Align := alRight;
    TabStop := False;
    OnChange := VScroll;
  end;
  FHorzScrollBar := TScrollBar.Create(Self);
  FHorzScrollBar.Parent := Self;
  with FHorzScrollBar do
  begin
    Kind := sbHorizontal;
    TabStop := False;
    SmallChange := 8;
    Max := 0;
    Align := alBottom;
    TabStop := False;
    OnChange := HScroll;
  end;
  FClient := TPanel.Create(Self);
  FClient.Parent := Self;
  with FClient do
  begin
    BevelInner := bvNone;
    BevelOuter := bvNone;
    BorderStyle := bsNone;
    ParentColor := True;
    TabStop := False;
    Align := alClient;
  end;
  FPaperView := TPaperPreview.Create(FClient);
  with FPaperView do
  begin
    Parent := FClient;
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
  inherited Destroy;
end;

procedure TPrintPreview.Loaded;
begin
  inherited Loaded;
  GetPrinterParameters;
  UpdateZoom;
end;

function TPrintPreview.Screen2PrinterUnit(Value: Integer): Integer;
begin
  Result := ConvertUnits(
    ConvertUnits(Value, Screen.PixelsPerInch, mmPixel, mmHiEnglish),
    FPixelsPerInch.Y, mmHiEnglish, FUnits);
end;

function TPrintPreview.ConvertUnit(Value: Integer; FromUnit, ToUnit: TUnits): Integer;
begin
  Result := ConvertUnits(Value, FPixelsPerInch.Y, FromUnit, ToUnit);
end;

procedure TPrintPreview.WMWinIniChange(var Message: TMessage);
begin
  inherited;
  if StrIComp(PChar(Message.lParam), 'Windows') = 0 then
  begin
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
    with FHorzScrollbar do Position := Min
  else if (Key = VK_HOME) and (Shift = [ssCtrl]) then
    with FVertScrollbar do Position := Min
  else if (Key = VK_END) and (Shift = []) then
    with FHorzScrollbar do Position := Max
  else if (Key = VK_END) and (Shift = [ssCtrl]) then
    with FVertScrollbar do Position := Max
  else if (Key = VK_LEFT) and (Shift = []) then
    with FHorzScrollbar do Position := Position - SmallChange
  else if (Key = VK_LEFT) and (Shift = [ssCtrl]) then
    with FHorzScrollbar do Position := Position - LargeChange
  else if (Key = VK_RIGHT) and (Shift = []) then
    with FHorzScrollbar do Position := Position + SmallChange
  else if (Key = VK_RIGHT) and (Shift = [ssCtrl]) then
    with FHorzScrollbar do Position := Position + LargeChange
  else if (Key = VK_UP) and (Shift = []) then
    with FVertScrollbar do Position := Position - SmallChange
  else if (Key = VK_UP) and (Shift = [ssCtrl]) then
    with FVertScrollbar do Position := Position - LargeChange
  else if (Key = VK_DOWN) and (Shift = []) then
    with FVertScrollbar do Position := Position + SmallChange
  else if (Key = VK_DOWN) and (Shift = [ssCtrl]) then
    with FVertScrollbar do Position := Position + LargeChange
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
  OldMousePos := Point(X, Y);
  MouseDown(Button, Shift, X, Y);
end;

procedure TPrintPreview.PaperMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  Delta: TPoint;
begin
  MouseMove(Shift, X, Y);
  if (ssLeft in Shift) and not (ssDouble in Shift) then
  begin
    Delta.X := OldMousePos.X - X;
    Delta.Y := OldMousePos.Y - Y;
    with FHorzScrollBar do
      if Visible then Position := Position + Delta.X;
    with FVertScrollBar do
      if Visible then Position := Position + Delta.Y;
  end;
end;

procedure TPrintPreview.PaperMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseUp(Button, Shift, X, Y);
end;

procedure TPrintPreview.SetPrinterParameters;
const
  Orientations: array [TPrinterOrientation] of Integer =
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
  if not (Printer.PrinterIndex in [0..Printer.Printers.Count-1]) then
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
    FPrinterInstalled := True;
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
  FHorzScrollBar.LargeChange := FClient.Width;
  FVertScrollBar.LargeChange := FClient.Height;
end;

procedure TPrintPreview.HScroll(Sender: TObject);
var
  Delta: Integer;
begin
  Delta := (Margin - FHorzScrollBar.Position) - FPaperView.Left;
  FClient.ScrollBy(Delta, 0);
end;

procedure TPrintPreview.VScroll(Sender: TObject);
var
  Delta: Integer;
begin
  Delta := (Margin - FVertScrollBar.Position) - FPaperView.Top;
  FClient.ScrollBy(0, Delta);
end;

procedure TPrintPreview.UpdateZoom;
begin
  FHorzScrollBar.SetParams(0, 0, 0);
  FVertScrollBar.SetParams(0, 0, 0);
  case FZoomState of
    zsZoomOther:
    begin
      FHorzScrollBar.Visible := True;
      FVertScrollBar.Visible := True;
      FPaperView.PaperWidth := MulDiv(FPixels.X, FZoom * Screen.PixelsPerInch, FPixelsPerInch.X * 100);
      FPaperView.PaperHeight := MulDiv(FPixels.Y, FZoom * Screen.PixelsPerInch, FPixelsPerInch.Y * 100);
    end;
    zsZoomToWidth:
    begin
      FHorzScrollBar.Visible := False;
      FVertScrollBar.Visible := True;
      FPaperView.Width := FClient.Width - 2 * Margin;
      FPaperView.PaperHeight := MulDiv(FPaperView.PaperWidth, FPixels.Y, FPixels.X);
    end;
    zsZoomToHeight:
    begin
      FHorzScrollBar.Visible := True;
      FVertScrollBar.Visible := False;
      FPaperView.Height := FClient.Height - 2 * Margin;
      FPaperView.PaperWidth := MulDiv(FPaperView.PaperHeight, FPixels.X, FPixels.Y);
    end;
    zsZoomToFit:
    begin
      FHorzScrollBar.Visible := False;
      FVertScrollBar.Visible := False;
      if (FPixels.Y / FPixels.X) < (FClient.Height / FClient.Width) then
      begin
        FPaperView.Width := FClient.Width - 2 * Margin;
        FPaperView.PaperHeight := MulDiv(FPaperView.PaperWidth, FPixels.Y, FPixels.X);
      end
      else
        FPaperView.Height := FClient.Height - 2 * Margin;
        FPaperView.PaperWidth := MulDiv(FPaperView.PaperHeight, FPixels.X, FPixels.Y);
    end;
  end;
  if FPaperView.Width < (FClient.Width - 2 * Margin) then
    FPaperView.Left := (FClient.Width - FPaperView.Width) div 2
  else
  begin
    FPaperView.Left := Margin;
    FHorzScrollBar.Max := FPaperView.Width - FClient.Width + 2 * Margin;
  end;
  if FPaperView.Height < (FClient.Height - 2 * Margin) then
    FPaperView.Top := (FClient.Height - FPaperView.Height) div 2
  else
  begin
    FPaperView.Top := Margin;
    FVertScrollBar.Max := FPaperView.Height - FClient.Height + 2 * Margin;
  end;
  FPaperView.Refresh;
  FVertScrollBar.Visible := FVertScrollBar.Max <> 0;
  FHorzScrollBar.Visible := FHorzScrollBar.Max <> 0;
  if FVertScrollBar.Visible or FHorzScrollBar.Visible then
    FPaperView.Cursor := crHand
  else
    FPaperView.Cursor := crDefault;
end;

procedure TPrintPreview.PaintPage(Sender: TObject; Canvas: TCanvas; PageRect: TRect);
begin
  if (FCurrentPage >= 1) and (FCurrentPage <= TotalPages) then
    Canvas.StretchDraw(PageRect, TMetaFile(FPages[FCurrentPage-1]));
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
    if Font.Size = 0 then Font.Size := 1;
    if Assigned(FCanvas) then
    begin
      AdjustCanvasView;
      FCanvas.Font.Size := ConvertUnits(FCanvas.Font.Size, FPixelsPerInch.Y, FUnits, Value);
      if FCanvas.Font.Size = 0 then FCanvas.Font.Size := 1;
      FCanvas.Pen.Width := ConvertUnits(FCanvas.Pen.Width, FPixelsPerInch.Y, FUnits, Value);
      if FCanvas.Pen.Width = 0 then FCanvas.Pen.Width := 1;
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

procedure TPrintPreview.SetHorzScrollBar(Value: TScrollBar);
begin
  FHorzScrollBar.Assign(Value);
  UpdateZoom;
end;

procedure TPrintPreview.SetVertScrollBar(Value: TScrollBar);
begin
  VertScrollBar.Assign(Value);
  UpdateZoom;
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
  if FCanvas.Handle = 0 then OutOfMemory;
  AdjustCanvasView;
  FCanvas.Font.Assign(Font);
end;

procedure TPrintPreview.DestroyMetaFileCanvas;
{$IFNDEF WIN32}
var
  Temp: HDC;
{$ENDIF}
begin
  {$IFNDEF WIN32}
  Temp := FCanvas.Handle;
  FCanvas.Handle := 0;
  MetaFile.Handle := CloseMetaFile(Temp);
  {$ENDIF}
  FCanvas.Free;
  FCanvas := nil;
end;

procedure TPrintPreview.Clear;
var
  I: Integer;
begin
  for I := 0 to FPages.Count-1 do
    TMetaFile(FPages[I]).Free;
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
    DestroyMetaFileCanvas;
    if not Assigned(MetaFile) then
      OutOfMemory;
    FPages.Add(MetaFile);
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
      DestroyMetaFileCanvas;
      if not Assigned(MetaFile) then
        OutOfMemory;
      FPages.Add(MetaFile);
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
      DestroyMetaFileCanvas;
      if Assigned(MetaFile) then
        MetaFile.Free;
      Clear;
    end;
    psPrinting:
      if Printer.Printing and not Printer.Aborted then
        Printer.Abort;
  end;
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
    FAborted := False;
    PrintedPages := 0;
    TotalPrintPages := StopPage - StartPage + 1;
    FState := psPrinting;
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
          SetMapMode (Printer.Canvas.Handle, MM_ANISOTROPIC);
          SetWindowExtEx (Printer.Canvas.Handle, FPixels.X,  FPixels.Y,  nil);
          SetViewportExtEx(Printer.Canvas.Handle, PageRect.Right - PageRect.Left, PageRect.Bottom - PageRect.Top, nil);
          Printer.Canvas.Draw(PageRect.Left, PageRect.Top, TMetaFile(FPages[PageNo-1]));
        finally
          RestoreDC(Printer.Canvas.Handle, SavedDC);
        end;
        Inc(PrintedPages);
        Application.ProcessMessages;
        if Assigned(FOnPrintProgress) then
          FOnPrintProgress(Self, PageNo, MulDiv(100, PrintedPages, TotalPrintPages), AbortIt);
        if Printer.Aborted or AbortIt then raise EAbortPrint.Create(EmptyStr);
        if PageNo <> StopPage then Printer.NewPage;
      end;
    except
      AbortIt := True;
    end;
    finally
      if AbortIt then
      begin
        FAborted := True;
        Printer.Abort;
        if Assigned(FOnAbort) then FOnAbort(Self);
      end
      else if Assigned(FOnAfterPrint) then
        FOnAfterPrint(Self);
      Printer.EndDoc;
      Printer.Title := EmptyStr;
      FState := psReady;
    end;
  end;
end;

procedure TPrintPreview.SetAbout(Value: String);
const
  AboutMsg = 'TPrintPreview v1.4'#10#13 +
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

end.
