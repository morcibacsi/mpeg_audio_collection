unit Find;

interface

// MB add unit GlobalMB
uses
	Global, SourcePath,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, ImgList;

type
  TfrmFind = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
		GroupBox1: TGroupBox;
		RadioButton1: TRadioButton;
		RadioButton2: TRadioButton;
		RadioButton3: TRadioButton;
		Image2: TImage;
		Image3: TImage;
		Image4: TImage;
		GroupBox2: TGroupBox;
		CheckBox1: TCheckBox;
		Image5: TImage;
    GroupBox3: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    GroupBox4: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button3: TButton;
    TabSheet4: TTabSheet;
    GroupBox5: TGroupBox;
    Image18: TImage;
    Image19: TImage;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    GroupBox6: TGroupBox;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    CheckBox10: TCheckBox;
    Image23: TImage;
    ComboBox11: TComboBox;
// begin MB
    Image24: TImage;
    Label7: TLabel;
    Edit1: TEdit;
    cbClearResults: TCheckBox;   //PinterPeti
// end MB
		procedure Button2Click(Sender: TObject);
		procedure Button1Click(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox11Change(Sender: TObject);
	private
		SearchArea: string;
    SearchOK: boolean;
		procedure StartSearch;
	end;

function FindOK(var Area: string): boolean;

implementation

uses Main;

{$R *.DFM}

{ --------------------------------------------------------------------------- }

function FindOK(var Area: string): boolean;
begin
	with TfrmFind.Create(Application) do
		try
    	SearchOK := false;
			SearchArea := '';
			ShowModal;
      Area := SearchArea;
			Result := SearchOK;
		finally Release;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.StartSearch;
var
	Index, Count: integer;
	TextArray: array [1..7] of string;
begin
	if Button1.Enabled then
	begin
  	Count := 1;
		TextArray[1] := Trim(ComboBox11.Text);
    for Index := 2 to 7 do TextArray[Index] := '';
    for Index := 1 to 6 do
    	if (CompareText(LastNameText[Index], TextArray[1]) <> 0) and (LastNameText[Index] <> '') then
      begin
        Inc(Count);
	      TextArray[Count] := LastNameText[Index];
      end;
    for Index := 1 to 6 do LastNameText[Index] := TextArray[Index];

		if RadioButton1.Checked then NameArea := 1;
		if RadioButton2.Checked then NameArea := 2;
		if RadioButton3.Checked then NameArea := 3;
		NameCase := CheckBox1.Checked;

		Prop[1, 2] := ComboBox1.ItemIndex;
		Prop[1, 3] := ComboBox2.ItemIndex;
		Prop[2, 2] := ComboBox3.ItemIndex;
		Prop[2, 3] := ComboBox4.ItemIndex;
		Prop[3, 2] := ComboBox5.ItemIndex;
		Prop[4, 2] := ComboBox6.ItemIndex;
		Prop[4, 3] := ComboBox7.ItemIndex;
		Prop[5, 2] := ComboBox8.ItemIndex;
		Prop[5, 3] := ComboBox9.ItemIndex;
		Prop[6, 2] := ComboBox10.ItemIndex;
		if CheckBox2.Checked then Prop[1, 1] := 1 else Prop[1, 1] := 0;
		if CheckBox3.Checked then Prop[2, 1] := 1 else Prop[2, 1] := 0;
		if CheckBox4.Checked then Prop[3, 1] := 1 else Prop[3, 1] := 0;
		if CheckBox5.Checked then Prop[4, 1] := 1 else Prop[4, 1] := 0;
		if CheckBox6.Checked then Prop[5, 1] := 1 else Prop[5, 1] := 0;
		if CheckBox7.Checked then Prop[6, 1] := 1 else Prop[6, 1] := 0;

		TagText[1] := Edit2.Text;
		TagText[2] := Edit3.Text;
		TagText[3] := Edit4.Text;
		TagText[4] := Edit5.Text;
		TagText[5] := Edit6.Text;
		TagText[6] := Edit7.Text;
// begin MB    
    TagText[7] := Edit1.Text;
// end MB
		CompareName := CheckBox8.Checked;
		CompareProperty := CheckBox9.Checked;
    CompareTag := CheckBox10.Checked;
		if RadioButton4.Checked then DuplicateArea := 1;
		if RadioButton5.Checked then DuplicateArea := 2;
		if RadioButton6.Checked then DuplicateArea := 3;

		FindArea := PageControl1.ActivePageIndex;
      Main.SearchArea := FindArea; //PinterPeti
    SearchOK := true;

		Close;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.Button2Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.Button1Click(Sender: TObject);
begin
  if cbClearResults.Checked then begin //PinterPeti
    frmMain.ListView2.Items.Clear;
    STempList.Clear;
    STempList.Tag := 0;
    frmMain.ListBox5.Clear;
    frmMain.ComboBox1.Clear;
  end;

	StartSearch;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.FormCreate(Sender: TObject);
var
	Index: longint;
begin
	Caption := GetText(15);
	Button1.Caption := GetText(16);
	Button2.Caption := GetText(57);
  Button3.Caption := GetText(17);
	TabSheet1.Caption := GetText(120);
	TabSheet2.Caption := GetText(18);
	TabSheet3.Caption := GetText(19);
  TabSheet4.Caption := GetText(20);

	GroupBox1.Caption := GetText(122);
	RadioButton1.Caption := GetText(123);
	RadioButton2.Caption := GetText(124);
	RadioButton3.Caption := GetText(125);
	GroupBox2.Caption := GetText(126);
	CheckBox1.Caption := GetText(127);
	cbClearResults.Caption := GetText(294);       //PinterPeti

  for Index := 1 to 6 do
  	if LastNameText[Index] <> '' then ComboBox11.Items.Add(LastNameText[Index]);
  if ComboBox11.Items.Count > 0 then ComboBox11.ItemIndex := 0;
	case NameArea of
		1: RadioButton1.Checked := true;
		2: RadioButton2.Checked := true;
		3: RadioButton3.Checked := true;
	end;
	CheckBox1.Checked := NameCase;

	GroupBox3.Caption := GetText(130);
	CheckBox2.Caption := GetText(131);
	CheckBox3.Caption := GetText(132);
	CheckBox4.Caption := GetText(133);
	CheckBox5.Caption := GetText(134);
	CheckBox6.Caption := GetText(135);
	CheckBox7.Caption := GetText(136);
	for Index := 0 to ComboBox2.Items.Count - 1 do
		ComboBox2.Items.Strings[Index] := ComboBox2.Items.Strings[Index] + ' ' + GetText(67);
	for Index := 0 to ComboBox4.Items.Count - 1 do
		ComboBox4.Items.Strings[Index] := ComboBox4.Items.Strings[Index] + ' ' + GetText(70);
	ComboBox5.Items.Add(GetText(74));
	ComboBox5.Items.Add(GetText(71));
	ComboBox10.Items.Add(GetText(137));
	ComboBox10.Items.Add(GetText(138));

	ComboBox1.ItemIndex := Prop[1, 2];
	ComboBox2.ItemIndex := Prop[1, 3];
	ComboBox3.ItemIndex := Prop[2, 2];
	ComboBox4.ItemIndex := Prop[2, 3];
	ComboBox5.ItemIndex := Prop[3, 2];
	ComboBox6.ItemIndex := Prop[4, 2];
	ComboBox7.ItemIndex := Prop[4, 3];
	ComboBox8.ItemIndex := Prop[5, 2];
	ComboBox9.ItemIndex := Prop[5, 3];
	ComboBox10.ItemIndex := Prop[6, 2];
	CheckBox2.Checked := (Prop[1, 1] = 1);
	CheckBox3.Checked := (Prop[2, 1] = 1);
	CheckBox4.Checked := (Prop[3, 1] = 1);
	CheckBox5.Checked := (Prop[4, 1] = 1);
	CheckBox6.Checked := (Prop[5, 1] = 1);
	CheckBox7.Checked := (Prop[6, 1] = 1);

	GroupBox4.Caption := GetText(179);
	Label1.Caption := GetText(42);
	Label2.Caption := GetText(43);
	Label3.Caption := GetText(44);
	Label4.Caption := GetText(45);
	Label5.Caption := GetText(46);
	Label6.Caption := GetText(47);
// begin MB
  Label7.Caption := GetText(lngGenre);
// end MB

	Edit2.Text := TagText[1];
	Edit3.Text := TagText[2];
	Edit4.Text := TagText[3];
	Edit5.Text := TagText[4];
	Edit6.Text := TagText[5];
	Edit7.Text := TagText[6];
// begin MB
  Edit1.Text := TagText[7];
// end MB

	GroupBox5.Caption := GetText(185);
	CheckBox8.Caption := GetText(120);
	CheckBox9.Caption := GetText(18);
  CheckBox10.Caption := GetText(19);
	GroupBox6.Caption := GetText(122);
	RadioButton4.Caption := GetText(123);
	RadioButton5.Caption := GetText(124);
	RadioButton6.Caption := GetText(125);

	CheckBox8.Checked := CompareName;
	CheckBox9.Checked := CompareProperty;
  CheckBox10.Checked := CompareTag;
	case DuplicateArea of
		1: RadioButton4.Checked := true;
		2: RadioButton5.Checked := true;
		3: RadioButton6.Checked := true;
	end;

	PageControl1.ActivePageIndex := FindArea;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.TabSheet1Show(Sender: TObject);
begin
	ComboBox11Change(Self);
  ActiveControl := ComboBox11;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.TabSheet2Show(Sender: TObject);
begin
	ComboBox1.Enabled := CheckBox2.Checked;
	ComboBox2.Enabled := CheckBox2.Checked;
	ComboBox3.Enabled := CheckBox3.Checked;
	ComboBox4.Enabled := CheckBox3.Checked;
	ComboBox5.Enabled := CheckBox4.Checked;
	ComboBox6.Enabled := CheckBox5.Checked;
	ComboBox7.Enabled := CheckBox5.Checked;
	ComboBox8.Enabled := CheckBox6.Checked;
	ComboBox9.Enabled := CheckBox6.Checked;
	ComboBox10.Enabled := CheckBox7.Checked;

	Button1.Enabled := ((CheckBox2.Checked) or (CheckBox3.Checked) or
											(CheckBox4.Checked) or (CheckBox5.Checked) or
											(CheckBox6.Checked) or (CheckBox7.Checked));
  Button3.Enabled := Button1.Enabled;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.TabSheet3Show(Sender: TObject);
begin
	Button1.Enabled := ((Trim(Edit2.Text) <> '') or
											(Trim(Edit3.Text) <> '') or
											(Trim(Edit4.Text) <> '') or
											(Trim(Edit5.Text) <> '') or
											(Trim(Edit6.Text) <> '') or
											(Trim(Edit7.Text) <> '') or
                      (Trim(Edit1.Text) <> ''));  // MB add Edit1

  Button3.Enabled := Button1.Enabled;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if Key = VK_RETURN then Button1Click(Sender);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.Button3Click(Sender: TObject);
var
	SourcePath, SourceLabel: string;
	SourceSerial: longint;
  SourceType: Integer;
begin
	if SourcePathOK(GetText(17), SourcePath, SourceLabel, SourceSerial, SourceType) then
	begin
		SearchArea := SourcePath;
		Button1Click(Sender);
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.TabSheet4Show(Sender: TObject);
begin
	Button1.Enabled := (CheckBox8.Checked) or (CheckBox9.Checked) or (CheckBox10.Checked);
  Button3.Enabled := Button1.Enabled;

  RadioButton4.Enabled := not CheckBox10.Checked;
  RadioButton5.Enabled := not CheckBox10.Checked;
  RadioButton6.Enabled := not CheckBox10.Checked;
  if CheckBox10.Checked then RadioButton6.Checked := true;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_RETURN then Button1Click(Sender);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.ComboBox11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_RETURN then Button1Click(Sender);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFind.ComboBox11Change(Sender: TObject);
begin
	Button1.Enabled := Trim(ComboBox11.Text) <> '';
  Button3.Enabled := Button1.Enabled;
end;

{ --------------------------------------------------------------------------- }

end.
