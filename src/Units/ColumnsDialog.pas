unit ColumnsDialog;

interface

uses
	Global, StdCtrls,
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, CheckLst;

type
	TfrmColumnsDialog = class(TForm)
		Button1: TButton;
		Button2: TButton;
		Image1: TImage;
		GroupBox3: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    CheckListBox1: TCheckListBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    Image2: TImage;
		procedure FormCreate(Sender: TObject);
		procedure Button2Click(Sender: TObject);
		procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckListBox1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure CheckListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
	private
		ColumnsOK: boolean;
	end;

function ColumnsDialogOK: boolean;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

function ColumnsDialogOK: boolean;
begin
	with TfrmColumnsDialog.Create(Application) do
		try
		begin
			ColumnsOK := false;
			ShowModal;
			Result := ColumnsOK;
		end;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmColumnsDialog.FormCreate(Sender: TObject);
var
	Index: integer;
begin
	Caption := GetText(210);
	Button1.Caption := GetText(54);
	Button2.Caption := GetText(57);
  GroupBox1.Caption := GetText(126);
	GroupBox3.Caption := GetText(168);
  CheckBox1.Caption := GetText(234);

  for Index := 1 to 13 do
  begin
  	case Abs(InfoCol[Index]) div 10000 mod 100 of
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
      13: CheckListBox1.Items.Add(GetText(177) + ': ' + GetText(lngGenre));
    end;

    CheckListBox1.Checked[Index - 1] := InfoCol[Index] > 0;
  	CheckListBox1.Items.Objects[Index - 1] := TObject(InfoCol[Index]);
  end;

  CheckBox1.Checked := ColumnAutoSize;
  CheckListBox1.Tag := -1;
	Button3.Caption := GetText(193);
	Button4.Caption := GetText(194);
end;

// -----------------------------------------------------------------------------

procedure TfrmColumnsDialog.Button2Click(Sender: TObject);
begin
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmColumnsDialog.Button1Click(Sender: TObject);
var
	Index: integer;
begin
  for Index := 1 to 13 do
  begin
  	InfoCol[Index] := Longint(CheckListBox1.Items.Objects[Index - 1]);
		if CheckListBox1.Checked[Index - 1] then InfoCol[Index] := Abs(InfoCol[Index])
    else InfoCol[Index] := -Abs(InfoCol[Index]);
  end;

  ColumnAutoSize := CheckBox1.Checked;
	ColumnsOK := true;
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmColumnsDialog.Button3Click(Sender: TObject);
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

// -----------------------------------------------------------------------------

procedure TfrmColumnsDialog.Button4Click(Sender: TObject);
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

// -----------------------------------------------------------------------------

procedure TfrmColumnsDialog.CheckListBox1EndDrag(Sender, Target: TObject; X, Y: Integer);
begin
	CheckListBox1.Tag := -1;
end;

// -----------------------------------------------------------------------------

procedure TfrmColumnsDialog.CheckListBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	Point: TPoint;
begin
	Point.X := X;
  Point.Y := Y;
  CheckListBox1.Tag := CheckListBox1.ItemAtPos(Point, true);
end;

// -----------------------------------------------------------------------------

procedure TfrmColumnsDialog.CheckListBox1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
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

// -----------------------------------------------------------------------------

end.
