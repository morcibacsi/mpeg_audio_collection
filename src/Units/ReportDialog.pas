unit ReportDialog;

interface

uses
	Global, StdCtrls,
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, CheckLst;

type
	TfrmReportDialog = class(TForm)
		Button1: TButton;
		Button2: TButton;
		Image1: TImage;
		GroupBox1: TGroupBox;
		GroupBox2: TGroupBox;
		GroupBox3: TGroupBox;
		CheckBox1: TCheckBox;
		CheckBox2: TCheckBox;
		CheckBox3: TCheckBox;
		CheckBox4: TCheckBox;
		RadioButton1: TRadioButton;
		RadioButton2: TRadioButton;
		Image2: TImage;
		Image3: TImage;
		Image4: TImage;
		Image5: TImage;
		Image6: TImage;
		Image7: TImage;
    Button3: TButton;
    Button4: TButton;
    CheckListBox1: TCheckListBox;
    RadioButton3: TRadioButton;
    Image8: TImage;
    GroupBox4: TGroupBox;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Image9: TImage;
    Image10: TImage;
    GroupBox5: TGroupBox;
    CheckBox5: TCheckBox;
    Image11: TImage;
    CheckBox6: TCheckBox;
    Image12: TImage;
    CheckBox7: TCheckBox;
    Image13: TImage;
		procedure FormCreate(Sender: TObject);
		procedure Button2Click(Sender: TObject);
		procedure Button1Click(Sender: TObject);
		procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckListBox1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure CheckListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure RadioButton2Click(Sender: TObject);
	private
		ReportOK: boolean;
		procedure UpdateControls;
	end;

function ReportDialogOK: boolean;

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

function ReportDialogOK: boolean;
begin
	with TfrmReportDialog.Create(Application) do
		try
		begin
			ReportOK := false;
			ShowModal;
			Result := ReportOK;
		end;
		finally Release;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.UpdateControls;
begin
	Button1.Enabled := (CheckBox1.Checked) or (CheckBox2.Checked) or (CheckBox3.Checked) or (CheckBox4.Checked);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.FormCreate(Sender: TObject);
var
	Index: integer;
begin
	Caption := GetText(8);
	Button1.Caption := GetText(54);
	Button2.Caption := GetText(57);
	GroupBox1.Caption := GetText(166);
	GroupBox2.Caption := GetText(167);
	GroupBox3.Caption := GetText(210);
  GroupBox4.Caption := GetText(102);
  GroupBox5.Caption := GetText(126);
	CheckBox1.Caption := GetText(1);
	CheckBox2.Caption := GetText(103);
	CheckBox3.Caption := GetText(175);
	CheckBox4.Caption := GetText(105);
  CheckBox5.Caption := GetText(14);
  CheckBox6.Caption := GetText(215);
  CheckBox7.Caption := GetText(219);
	RadioButton1.Caption := GetText(169);
	RadioButton2.Caption := GetText(170);
  RadioButton3.Caption := GetText(195);
	RadioButton4.Caption := GetText(199);
  RadioButton5.Caption := GetText(200);
  CheckBox1.Checked := RowCol[1];
  CheckBox2.Checked := RowCol[2];
  CheckBox3.Checked := RowCol[3];
  CheckBox4.Checked := RowCol[4];
  CheckBox5.Checked := RSorting;
  CheckBox6.Checked := ItemNumeration;
  CheckBox7.Checked := ReportSummary;

  for Index := 1 to 17 do
  begin
  	case RowColIndex[Index] of
    	1: CheckListBox1.Items.Add(GetText(171));
      2: CheckListBox1.Items.Add(GetText(172));
      3: CheckListBox1.Items.Add(GetText(131));
      4: CheckListBox1.Items.Add(GetText(132));
      5: CheckListBox1.Items.Add(GetText(133));
      6: CheckListBox1.Items.Add(GetText(211));
      7: CheckListBox1.Items.Add(GetText(177) + ': ' + GetText(42));
      8: CheckListBox1.Items.Add(GetText(177) + ': ' + GetText(43));
      9: CheckListBox1.Items.Add(GetText(177) + ': ' + GetText(44));
      10: CheckListBox1.Items.Add(GetText(177) + ': ' + GetText(45));
      11: CheckListBox1.Items.Add(GetText(177) + ': ' + GetText(46));
      12: CheckListBox1.Items.Add(GetText(177) + ': ' + GetText(47));
      13: CheckListBox1.Items.Add(GetText(173));
      14: CheckListBox1.Items.Add(GetText(84));
      15: CheckListBox1.Items.Add(GetText(174));
      16: CheckListBox1.Items.Add(GetText(103));
      17: CheckListBox1.Items.Add(GetText(177) + ': ' + GetText(lngGenre));
    end;
    CheckListBox1.Items.Objects[CheckListBox1.Items.Count - 1] := TObject(RowColIndex[Index]);
    CheckListBox1.Checked[CheckListBox1.Items.Count - 1] := RowCol[RowColIndex[Index] + 4];
  end;
  CheckListBox1.Tag := -1;
	Button3.Caption := GetText(193);
	Button4.Caption := GetText(194);

	case RScanning of
  	1: RadioButton4.Checked := true;
		2: RadioButton5.Checked := true;
	end;

	case RFormat of
  	1: RadioButton1.Checked := true;
		2: RadioButton2.Checked := true;
    3: RadioButton3.Checked := true;
	end;

	UpdateControls;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.Button2Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.Button1Click(Sender: TObject);
var
	Index: integer;
begin
	RowCol[1] := CheckBox1.Checked;
	RowCol[2] := CheckBox2.Checked;
	RowCol[3] := CheckBox3.Checked;
	RowCol[4] := CheckBox4.Checked;

  RSorting := CheckBox5.Checked;
  ItemNumeration := CheckBox6.Checked;
  ReportSummary := CheckBox7.Checked;

  for Index := 0 to 16 do
  begin
  	RowColIndex[Index + 1] := Integer(CheckListBox1.Items.Objects[Index]);
    RowCol[RowColIndex[Index + 1] + 4] := CheckListBox1.Checked[Index];
  end;

	if RadioButton4.Checked then RScanning := 1;
	if RadioButton5.Checked then RScanning := 2;

	if RadioButton1.Checked then RFormat := 1;
	if RadioButton2.Checked then RFormat := 2;
  if RadioButton3.Checked then RFormat := 3;

	ReportOK := true;
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.CheckBox1Click(Sender: TObject);
begin
	UpdateControls;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.Button3Click(Sender: TObject);
var
	Index: integer;
begin
	for Index := 0 to CheckListBox1.Items.Count - 1 do
  	if (CheckListBox1.Selected[Index]) and (Index > 0) then
    begin
    	CheckListBox1.Items.Move(Index, Index - 1);
      CheckListBox1.ItemIndex := Index - 1;
      break;
    end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.Button4Click(Sender: TObject);
var
	Index: integer;
begin
	for Index := 0 to CheckListBox1.Items.Count - 1 do
  	if (CheckListBox1.Selected[Index]) and (Index < CheckListBox1.Items.Count - 1) then
    begin
    	CheckListBox1.Items.Move(Index, Index + 1);
      CheckListBox1.ItemIndex := Index + 1;
      break;
    end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.CheckListBox1EndDrag(Sender, Target: TObject; X, Y: Integer);
begin
	CheckListBox1.Tag := -1;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.CheckListBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	Point: TPoint;
begin
	Point.X := X;
  Point.Y := Y;
  CheckListBox1.Tag := CheckListBox1.ItemAtPos(Point, true);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.CheckListBox1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
	Point: TPoint;
  NewPlace: integer;
begin
	if CheckListBox1.Tag >= 0 then
  begin
  	Accept := true;

		Point.X := X;
  	Point.Y := Y;
	  NewPlace := CheckListBox1.ItemAtPos(Point, true);

    if (NewPlace <> -1) and (NewPlace <> CheckListBox1.Tag) then
    begin
    	CheckListBox1.Items.Move(CheckListBox1.Tag, NewPlace);
      CheckListBox1.Tag := NewPlace;
      CheckListBox1.ItemIndex := CheckListBox1.Tag;
    end;
  end
  else
	  Accept := false;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmReportDialog.RadioButton2Click(Sender: TObject);
begin
	CheckBox6.Enabled := not RadioButton2.Checked;
  CheckBox7.Enabled := not RadioButton2.Checked;
  if RadioButton2.Checked then
  begin
  	CheckBox6.Checked := false;
    CheckBox7.Checked := false;
  end;
end;

{ --------------------------------------------------------------------------- }

end.
