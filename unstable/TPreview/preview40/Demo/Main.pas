unit Main;

interface

uses
  WinProcs, WinTypes, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, Tabs, Preview, Dialogs, jpeg;

type
  TMainForm = class(TForm)
    Toolbar: TPanel;
    ZoomComboBox: TComboBox;
    PrintButton: TButton;
    Label1: TLabel;
    Image1: TImage;
    PrintPreview: TPrintPreview;
    UnitComboBox: TComboBox;
    Label2: TLabel;
    FastPrintCheckBox: TCheckBox;
    Image2: TImage;
    AutoScrollCheckBox: TCheckBox;
    PageNavigator: TTabSet;
    PrinterSetupDialog: TPrinterSetupDialog;
    SaveButton: TButton;
    LoadButton: TButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ZoomComboBoxChange(Sender: TObject);
    procedure UnitComboBoxChange(Sender: TObject);
    procedure AutoScrollCheckBoxClick(Sender: TObject);
    procedure FastPrintCheckBoxClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure PageNavigatorChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure PrintPreviewChange(Sender: TObject);
    procedure PrintPreviewBeforePrint(Sender: TObject);
    procedure PrintPreviewPrintProgress(Sender: TObject; PageNum,
      Progress: Integer; var AbortIt: Boolean);
    procedure PrintPreviewAfterPrint(Sender: TObject);
    procedure PrintPreviewNewPage(Sender: TObject);
  private
    FirstActivation: Boolean;
    procedure CreateImageTextPage;
    procedure CreateImageOnlyPage;
    procedure CreatePages;
  end;

var
  MainForm: TMainForm;

implementation

uses Windows;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Randomize;
  PrintPreview.ZoomState := zsZoomToFit;
  ZoomComboBox.ItemIndex := 6; // Zoom to Fit (Whole Page)
  UnitComboBox.ItemIndex := Ord(PrintPreview.Units);
  FastPrintCheckBox.Checked := PrintPreview.FastPrint;
  AutoScrollCheckBox.Checked := PrintPreview.AutoScroll;
  FirstActivation := True;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  if FirstActivation then
  begin
    FirstActivation := False;
    Update;
    CreatePages;
  end;
end;

procedure TMainForm.ZoomComboBoxChange(Sender: TObject);
begin
  case ZoomComboBox.ItemIndex of
    0: PrintPreview.Zoom := 50;
    1: PrintPreview.Zoom := 100;
    2: PrintPreview.Zoom := 150;
    3: PrintPreview.Zoom := 200;
    4: PrintPreview.ZoomState := zsZoomToWidth;
    5: PrintPreview.ZoomState := zsZoomToHeight;
    6: PrintPreview.ZoomState := zsZoomToFit;
  end;
end;

procedure TMainForm.UnitComboBoxChange(Sender: TObject);
begin
  CreatePages;
end;

procedure TMainForm.AutoScrollCheckBoxClick(Sender: TObject);
begin
  PrintPreview.AutoScroll := AutoScrollCheckBox.Checked;
end;

procedure TMainForm.FastPrintCheckBoxClick(Sender: TObject);
begin
  PrintPreview.FastPrint := FastPrintCheckBox.Checked;
end;

procedure TMainForm.PrintButtonClick(Sender: TObject);
begin
  if (PrintPreview.State = psReady) and PrinterSetupDialog.Execute then
    PrintPreview.Print;
end;

procedure TMainForm.SaveButtonClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    PrintPreview.SaveToFile(SaveDialog.FileName);
end;

procedure TMainForm.LoadButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    PrintPreview.LoadFromFile(OpenDialog.FileName);
end;

procedure TMainForm.PageNavigatorChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  PrintPreview.CurrentPage := NewTab + 1;
end;

procedure TMainForm.PrintPreviewChange(Sender: TObject);
begin
  while PageNavigator.Tabs.Count < PrintPreview.TotalPages do
    PageNavigator.Tabs.Add(IntToStr(PageNavigator.Tabs.Count + 1));
  while PageNavigator.Tabs.Count > PrintPreview.TotalPages do
    PageNavigator.Tabs.Delete(PageNavigator.Tabs.Count - 1);

  PageNavigator.TabIndex := PrintPreview.CurrentPage - 1;

  PrintButton.Enabled := PrintPreview.PrinterInstalled and (PrintPreview.TotalPages > 0);
  SaveButton.Enabled := (PrintPreview.TotalPages > 0);
end;

procedure TMainForm.PrintPreviewBeforePrint(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  Caption := Application.Title + ' - Preparing to print...';
end;

procedure TMainForm.PrintPreviewPrintProgress(Sender: TObject; PageNum,
  Progress: Integer; var AbortIt: Boolean);
begin
  Caption := Format('%s - Printing page %d of %d (%%%d done)...',
    [Application.Title, PageNum, PrintPreview.TotalPages, Progress]);
  Update;
end;

procedure TMainForm.PrintPreviewAfterPrint(Sender: TObject);
begin
  Caption := Application.Title;
  Screen.Cursor := crDefault;
end;

// In this example, the code is independent of the Units property of
// PrintPreview. If you use only one measuremnt unit for PrintPreview, you can
// easily use constant values instead of passing them to ConvertUnit method.
// In addition, precision of mmLoEnglish unit is not enough for choosing small
// font size (the smallest font can be 1/10"), so in this example I have used
// different code for mmLoEnglish.

procedure TMainForm.PrintPreviewNewPage(Sender: TObject);
var
  R: TRect;
begin
  with PrintPreview do
  begin
    // The following line ensures one pixel pen width in any mapping mode.
    Canvas.Pen.Width := 0;
    Canvas.Brush.Style := bsCLear;
    // We are going to draw a rectangular frame on the page with 1cm distance
    // from edges of the paper.
    SetRect(R, 0, 0, PaperWidth, PaperHeight);
    InflateRect(R, -ConvertUnit(1000, mmHiMetric, Units),
                   -ConvertUnit(1000, mmHiMetric, Units));
    Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
    // Here we write the page number on bottom left corner of the page
    if Units <> mmLoEnglish then
      Canvas.Font.Height := -ConvertUnit(500, mmHiMetric, Units)
    else
      Canvas.Font.Height := -2;
    SetTextAlign(Canvas.Handle, TA_RIGHT or TA_TOP);
    Canvas.TextOut(R.Right, R.Bottom, Format('Page %d', [TotalPages+1]));
    // Restores text alignment to the default state
    SetTextAlign(Canvas.Handle, TA_LEFT or TA_TOP);
  end;
end;

procedure TMainForm.CreateImageTextPage;
var
  R: TRect;
begin
  with PrintPreview do
  begin
    // To draw the image, first we should calculate the image's bound rectangle.
    // For this purpose we have to convert the image's dimensions from screen's
    // pixels/resolution to printer's unit/resolution. In this example, the image
    // is scaled two times smaller than its actual size.
    SetRect(R, 0, 0, Screen2PrinterUnit(Image1.Width) div 2,
                     Screen2PrinterUnit(Image1.Height) div 2);
    // We place the image rectangle horizontally in center of the paper and
    // vertically 2cm far from top of the paper.
    OffsetRect(R, (PaperWidth - R.Right) div 2,
                  ConvertUnit(2000, mmHiMetric, Units));
    // We draw the image here.
    Canvas.StretchDraw(R, Image1.Picture.Graphic);
    // We are going to draw a frame and write some sample text inside it.
    // For the frame's side and bottom margins we consider 2cm and for edges of
    // the paper, and for top position, 1cm under the image.
    SetRect(R, ConvertUnit(2000, mmHiMetric, Units),
               R.Bottom + ConvertUnit(1000, mmHiMetric, Units),
               PaperWidth - ConvertUnit(2000, mmHiMetric, Units),
               PaperHeight - ConvertUnit(2000, mmHiMetric, Units));
    // Here, we draw the frame.
    Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
    // To write the frame's dimensions under the frame, we use a font with 5mm
    // height. When unit is mmLoEnglish we set the font height to 0.2".
    if Units <> mmLoEnglish then
      Canvas.Font.Height := -ConvertUnit(500, mmHiMetric, Units)
    else
      Canvas.Font.Height := -2;
    Canvas.TextOut(R.Left, R.Bottom, Format('%d (%s) x %d (%s)',
      [R.Right - R.Left, UnitComboBox.Items[UnitComboBox.ItemIndex],
       R.Bottom - R.Top, UnitComboBox.Items[UnitComboBox.ItemIndex]]));
    // For the first line of the sample text, we set the font height to 0.8mm.
    // Of course, when the unit is mmLoEnglish, the smallest font height cannot
    // be smaller than 0.2".
    if Units <> mmLoEnglish then
      Canvas.Font.Height := -ConvertUnit(80, mmHiMetric, Units)
    else
      Canvas.Font.Height := -2;
    // While we have not reached to the frame's bottom...
    while R.Top - Canvas.Font.Height < R.Bottom do
    begin
      // Randomly we select a font color
      Canvas.Font.Color := RGB(Random(256), Random(256), Random(256));
      // draw the text,
      Canvas.TextRect(R, R.Left, R.Top, 'Powered by Borland Delphi.');
      // move the frame's top to the next line,
      Inc(R.Top, -Canvas.Font.Height);
      // and we increase the font height by 0.5mm. if unit is mmLoEnglish, we
      // increase it by 0.1".
      if Units <> mmLoEnglish then
        Canvas.Font.Height := Canvas.Font.Height - ConvertUnit(50, mmHiMetric, Units)
      else
        Canvas.Font.Height := Canvas.Font.Height - 1;
    end;
  end;
end;

procedure TMainForm.CreateImageOnlyPage;
var
  R: TRect;
begin
  with PrintPreview do
  begin
    // To draw the image, first we should calculate the image's bound rectangle.
    // For this purpose we have to convert the image's dimensions from screen's
    // pixels/resolution to printer's unit/resolution. In this example, the image
    // is scaled two times larger than its actual size.
    SetRect(R, 0, 0, Screen2PrinterUnit(Image2.Width) * 2,
                     Screen2PrinterUnit(Image2.Height) * 2);
    // We place the rectangle in center of the paper
    OffsetRect(R, (PaperWidth - R.Right) div 2,
                  (PaperHeight - R.Bottom) div 2);
    // We draw the image here.
    Canvas.StretchDraw(R, Image2.Picture.Graphic);
  end;
end;

procedure TMainForm.CreatePages;
var
  I: Integer;
begin
  Caption := Application.Title + ' - Creating pages...';
  with PrintPreview do
  begin
    Units := TUnits(UnitComboBox.ItemIndex);
    BeginDoc;
    for I := 1 to Random(10)+2 do // At least 2 and at most 11 pages
    begin
      if I > 1 then NewPage;
      if Odd(I) then
        CreateImageTextPage
      else
        CreateImageOnlyPage;
      Application.ProcessMessages;
    end;
    EndDoc;
  end;
  Caption := Application.Title;
end;

end.

