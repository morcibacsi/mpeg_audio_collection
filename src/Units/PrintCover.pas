unit PrintCover;

interface

uses
	Global, WaitWindow, Stretch, ComCtrls, MessageDialog,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Preview, FileCtrl;

type
  TfrmPrintCover = class(TForm)
    Button1: TButton;
		Button2: TButton;
    Panel1: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Image3: TImage;
    Label2: TLabel;
    ComboBox1: TComboBox;
    DriveComboBox1: TDriveComboBox;
    Image1: TImage;
    Button3: TButton;
    FontDialog1: TFontDialog;
    Button4: TButton;
    PrintPreview1: TPrintPreview;
		procedure FormCreate(Sender: TObject);
		procedure Button1Click(Sender: TObject);
		procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FontDialog1Apply(Sender: TObject; Wnd: HWND);
    procedure Button4Click(Sender: TObject);
	private
		function GetUserVolumeLabel(DriveChar: char): string;
		procedure DrawPage;
		procedure OnChangeZoom;
    procedure SetSize;
	end;

const
  FCW = 1205;
  FCH = 1205;
  BCW = 1515;
  BCH = 1175;
  BCS = 70;
  MHR = 50;
  MVR = 50;

var
	FCWidth, FCHeight: integer;
	BCWidth, BCHeight: integer;
  BCSite: integer;
	HRMargin, VRMargin: integer;

procedure ShowPrintCover;

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

procedure ShowPrintCover;
begin
	with TfrmPrintCover.Create(Application) do
		try ShowModal;
		finally Release;
	end;
end;

{ --------------------------------------------------------------------------- }

function TfrmPrintCover.GetUserVolumeLabel(DriveChar: char): string;
var
	Node: TTreeNode;
  DLabel, VLabel: string;
  DSerial, VSerial: longint;
  DType, VType: Integer;
  NodeData: DataArray;
begin
	Result := '';
  Node := Tree.Items[0];

  if VolumeDataOK(DriveChar, DLabel, DSerial, DType) then
  begin
  	Result := DLabel;
  	if not Node.HasChildren then exit;

  	Node := Node.GetFirstChild;

		while Node <> nil do
		begin
			NodeData := ExtractData(Node.Text);
      VLabel := ExtractName(Node.Text);
      VSerial := NodeData[6];

      if (VSerial = DSerial) and (Pos('\', VLabel) = 0) then Result := VLabel;

			Node := Node.GetNextSibling;
		end;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.DrawPage;
var
	R: TRect;
	Index, LineSpace: longint;
  LSFront, LSBack: longint;
	CurDir, VolLabel, Info, Number: string;
  lf : TLogFont;
  OldFont : hFont;
  NewFont : hFont;
begin
	PrintPreview1.Clear;
	PrintPreview1.BeginDoc;

	LineSpace := Abs(PrintPreview1.Canvas.Font.Height) div 4;

        R := PrintPreview1.PageBounds;
	LSFront := (R.Right - R.Left - FCWidth) div 2;
  LSBack := (R.Right - R.Left - BCWidth) div 2;

	PrintPreview1.Canvas.Rectangle(R.Left + LSFront, R.Top, R.Left + LSFront + FCWidth, R.Top + FCHeight + 1);
	PrintPreview1.Canvas.Rectangle(R.Left + LSBack, R.Top + FCHeight, R.Left + LSBack + BCWidth, R.Top + FCHeight + BCHeight);
	PrintPreview1.Canvas.MoveTo(R.Left + LSBack + BCSite, R.Top + FCHeight);
	PrintPreview1.Canvas.LineTo(R.Left + LSBack + BCSite, R.Top + FCHeight + BCHeight);
	PrintPreview1.Canvas.MoveTo(R.Left + LSBack + BCWidth - BCSite, R.Top + FCHeight);
	PrintPreview1.Canvas.LineTo(R.Left + LSBack + BCWidth - BCSite, R.Top + FCHeight + BCHeight);

	try
		CurDir := DriveComboBox1.Items.Strings[DriveComboBox1.ItemIndex][1] + ':\';
		DirList.Directory := CurDir;
		DirList.Update;

		R.Right := R.Left + LSFront + FCWidth - HRMargin;
		R.Left := R.Left + LSFront + HRMargin;
		R.Top := R.Top + VRMargin;

		for Index := DirList.ItemIndex + 1 to DirList.Items.Count - 1 do
		begin
			R.Bottom := R.Top - PrintPreview1.Canvas.Font.Height + LineSpace;
                        if R.Bottom > PrintPreview1.PageBounds.Top + FCHeight - (VRMargin div 4) then break;

			if not Numeration then Number := ''
      else
      begin
      	Number := IntToStr(Index) + '. ';
      	if (DirList.Items.Count - 1 > 9) and (Index < 10) then
        	Number := '0' + Number;
      end;

			PrintPreview1.Canvas.TextRect(R, R.Left, R.Top, Number + DirList.Items.Strings[Index]);
			R.Top := R.Bottom;
		end;

    R := PrintPreview1.PageBounds;

		R.Right := R.Left + LSBack + BCWidth - BCSite - HRMargin;
		R.Left := R.Left + LSBACK + BCSite + HRMargin;
		R.Top := R.Top + FCHeight + VRMargin;

		for Index := DirList.ItemIndex + 1 to DirList.Items.Count - 1 do
		begin
			R.Bottom := R.Top - PrintPreview1.Canvas.Font.Height + LineSpace;
                        if R.Bottom > PrintPreview1.PageBounds.Top + FCHeight + BCHeight - (VRMargin div 4) then break;

			if not Numeration then Number := ''
      else
      begin
      	Number := IntToStr(Index) + '. ';
      	if (DirList.Items.Count - 1 > 9) and (Index < 10) then
        	Number := '0' + Number;
      end;

			PrintPreview1.Canvas.TextRect(R, R.Left, R.Top, Number + DirList.Items.Strings[Index]);
			R.Top := R.Bottom;
		end;

    if (AddDate) or (AddSize) then
    begin
      Info := '';
  	  if AddDate then Info := FormatDateTime('dd/mm/yyyy', Date);
      if AddSize then
      	if not AddDate then Info := FloatToStr(Round((DiskSize(Ord(DirList.Directory[1]) - 64) - DiskFree(Ord(DirList.Directory[1]) - 64)) / 1024 / 1024 * 100) / 100) + ' ' + GetText(62)
        else Info := Info + ',   ' + FloatToStr(Round((DiskSize(Ord(DirList.Directory[1]) - 64) - DiskFree(Ord(DirList.Directory[1]) - 64)) / 1024 / 1024 * 100) / 100) + ' ' + GetText(62);

	    PrintPreview1.Canvas.Font.Size := 18;
        R.Left := PrintPreview1.PageBounds.Left + LSBack + (BCWidth - PrintPreview1.Canvas.TextWidth(Info)) div 2;
	    R.Right := R.Left + PrintPreview1.Canvas.TextWidth(Info);
          R.Top := PrintPreview1.PageBounds.Top + FCHeight + BCHeight - ((VRMargin + PrintPreview1.Canvas.TextHeight(Info)) div 2);
        R.Bottom := PrintPreview1.PageBounds.Top + FCHeight + BCHeight - 1;
			PrintPreview1.Canvas.TextRect(R, R.Left, R.Top, Info);
    end;

    if CustomLabel then VolLabel := LabelText
    else VolLabel := GetUserVolumeLabel(DriveComboBox1.Drive);

  	PrintPreview1.Canvas.Font.Size := 28;
    if BCSite <= PrintPreview1.Canvas.TextHeight(VolLabel) then
    	PrintPreview1.Canvas.Font.Size := 26;
	  PrintPreview1.Canvas.Font.PixelsPerInch := GetDeviceCaps(PrintPreview1.Canvas.Handle, LOGPIXELSY);

    while PrintPreview1.Canvas.TextWidth(VolLabel) > (BCHeight - 2 * HRMargin) do
			Delete(VolLabel, Length(VolLabel), 1);

	  GetObject(PrintPreview1.Canvas.Font.Handle, sizeof(lf), @lf);
  	lf.lfEscapement := 900;
	  lf.lfOrientation := 900;
  	NewFont := CreateFontIndirect(lf);
	  OldFont := SelectObject(PrintPreview1.Canvas.Handle, NewFont);

	  Windows.TextOut(PrintPreview1.Canvas.Handle,
      PrintPreview1.PageBounds.Left + LSBack + (BCSite - PrintPreview1.Canvas.TextHeight(VolLabel)) div 2,
        PrintPreview1.PageBounds.Top + FCHeight + BCHeight - HRMargin, PChar(VolLabel), Length(VolLabel));
	  SelectObject(PrintPreview1.Canvas.Handle, OldFont);
  	DeleteObject(NewFont);

	  GetObject(PrintPreview1.Canvas.Font.Handle, sizeof(lf), @lf);
  	lf.lfEscapement := 2700;
	  lf.lfOrientation := 2700;
  	NewFont := CreateFontIndirect(lf);
	  OldFont := SelectObject(PrintPreview1.Canvas.Handle, NewFont);
	  Windows.TextOut(PrintPreview1.Canvas.Handle,
      PrintPreview1.PageBounds.Left + LSBack + BCWidth - (BCSite - PrintPreview1.Canvas.TextHeight(VolLabel)) div 2,
        PrintPreview1.PageBounds.Top + FCHeight + HRMargin, PChar(VolLabel), Length(VolLabel));
	  SelectObject(PrintPreview1.Canvas.Handle, OldFont);
  	DeleteObject(NewFont);
	except
	end;

	PrintPreview1.NewPage;
	PrintPreview1.EndDoc;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.OnChangeZoom;
begin
	case ComboBox1.ItemIndex of
		0: PrintPreview1.Zoom := 25;
		1: PrintPreview1.Zoom := 50;
		2: PrintPreview1.Zoom := 100;
		3: PrintPreview1.Zoom := 200;
		4: PrintPreview1.ZoomState := zsZoomToFit;
		5: PrintPreview1.ZoomState := zsZoomToHeight;
		6: PrintPreview1.ZoomState := zsZoomToWidth;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.SetSize;
var
	KoeffX, KoeffY: real;
begin
	KoeffX := IStretch[1] / 100;
  KoeffY := IStretch[2] / 100;

	FCWidth := Round(FCW * KoeffX);
	FCHeight := Round(FCH * KoeffY);
	BCWidth := Round(BCW * KoeffX);
	BCHeight := Round(BCH * KoeffY);
  BCSite := Round(BCS * KoeffX);

	HRMargin := Round(MHR * KoeffX);
	VRMargin := Round(MVR * KoeffY);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.FormCreate(Sender: TObject);
var
	Index: integer;
  DriveChar: char;
begin
	Caption := GetText(30);
	Button1.Caption := GetText(187);
	Button2.Caption := GetText(93);
  Button3.Caption := GetText(22);
  Button4.Caption := GetText(126);
	Label1.Caption := GetText(188);
	Label2.Caption := GetText(189);

	ComboBox1.Items.Add('25 %');
	ComboBox1.Items.Add('50 %');
	ComboBox1.Items.Add('100 %');
	ComboBox1.Items.Add('200 %');
	ComboBox1.Items.Add(GetText(190));
	ComboBox1.Items.Add(GetText(191));
	ComboBox1.Items.Add(GetText(192));
	ComboBox1.ItemIndex := LastZoom;

  DriveChar := #0;
  if LastDrive <> '' then
  	DriveChar := LastDrive[1]
  else
		for Index := FirstDrive to DriveComboBox1.Items.Count do
			if GetDriveType(PChar(DriveComboBox1.Items.Strings[Index - 1][1] + ':\')) = DRIVE_CDROM then
			begin
				DriveChar := DriveComboBox1.Items.Strings[Index - 1][1];
				break;
			end;

  if DirectoryExists(DriveChar + ':\') then DriveComboBox1.Drive := DriveChar
  else DriveComboBox1.Drive := RootD[1];

  if (FontName <> '') and (FontSize > 0) then
  begin
	  PrintPreview1.Font.Name := FontName;
  	PrintPreview1.Font.Size := FontSize;
	  PrintPreview1.Font.Color := FontColor;
  	PrintPreview1.Font.CharSet := FontCharSet;
    PrintPreview1.Font.Style := [];
    if FontStyle[1] then PrintPreview1.Font.Style := PrintPreview1.Font.Style + [fsBold];
    if FontStyle[2] then PrintPreview1.Font.Style := PrintPreview1.Font.Style + [fsItalic];
    if FontStyle[3] then PrintPreview1.Font.Style := PrintPreview1.Font.Style + [fsUnderline];
    if FontStyle[4] then PrintPreview1.Font.Style := PrintPreview1.Font.Style + [fsStrikeOut];
  end;
  PrintPreview1.PrintJobTitle := GetText(30);

  SetSize;
	OnChangeZoom;
	DrawPage;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.Button1Click(Sender: TObject);
begin
	PrintPreview1.PrintPages(1, 1);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.Button2Click(Sender: TObject);
begin
	LastZoom := ComboBox1.ItemIndex;
  LastDrive := DriveComboBox1.Drive;

  FontName := PrintPreview1.Font.Name;
  FontSize := PrintPreview1.Font.Size;
  FontColor := PrintPreview1.Font.Color;
  FontCharSet := PrintPreview1.Font.CharSet;
  if fsBold in PrintPreview1.Font.Style then FontStyle[1] := true else FontStyle[1] := false;
  if fsItalic in PrintPreview1.Font.Style then FontStyle[2] := true else FontStyle[2] := false;
  if fsUnderline in PrintPreview1.Font.Style then FontStyle[3] := true else FontStyle[3] := false;
  if fsStrikeOut in PrintPreview1.Font.Style then FontStyle[4] := true else FontStyle[4] := false;

	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.ComboBox1Change(Sender: TObject);
begin
	OnChangeZoom;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.DriveComboBox1Change(Sender: TObject);
begin
	DrawPage;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.Button3Click(Sender: TObject);
begin
	FontDialog1.Font.Assign(PrintPreview1.Font);
  if FontDialog1.Execute then
  begin
  	PrintPreview1.Font.Assign(FontDialog1.Font);
    DrawPage;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.FontDialog1Apply(Sender: TObject; Wnd: HWND);
begin
 	PrintPreview1.Font.Assign(FontDialog1.Font);
  DrawPage;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmPrintCover.Button4Click(Sender: TObject);
begin
	SetStretch;
  SetSize;
  DrawPage;
end;

{ --------------------------------------------------------------------------- }

end.
