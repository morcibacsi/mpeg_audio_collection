unit Options;

interface

uses
	FileCtrl, Global, Windows, Messages, SysUtils, Classes, Graphics,
	Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, SourcePath;

type
  TfrmOptions = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Image2: TImage;
    Image3: TImage;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Image4: TImage;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    Image5: TImage;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    Image7: TImage;
    CheckBox4: TCheckBox;
    Image6: TImage;
    RadioGroup1: TRadioGroup;
    GroupBox4: TGroupBox;
    Image8: TImage;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBoxFoobar: TCheckBox;
    ImageFoobar: TImage;
    CheckBoxAllFiles: TCheckBox;
    ImageAllFiles: TImage;
    edtFoobar: TEdit;
    spdbtnFoobar: TSpeedButton;
    cbAutoSort: TCheckBox;
    cbAutoSave: TCheckBox;
    Image9: TImage;
    Image10: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBoxFoobarClick(Sender: TObject);
    procedure spdbtnFoobarClick(Sender: TObject);
  private
		SetOptions: boolean;
		function GetLangName(FileIndex: longint): string;
	end;

function OptionsOK: boolean;

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

function OptionsOK: boolean;
begin
	with TfrmOptions.Create(Application) do
		try
		begin
			SetOptions := false;
			ShowModal;
			Result := SetOptions;
		end;
		finally Release;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmOptions.Button1Click(Sender: TObject);
begin
	if ComboBox1.ItemIndex = 0 then LangName := ''
	else LangName := ComboBox1.Items.Strings[ComboBox1.ItemIndex];

	AutoOpen := CheckBox1.Checked;
	UseWindowSettings := CheckBox2.Checked;
  AutoBackup := CheckBox3.Checked;
  ValidFiles := CheckBox5.Checked;
  GuessedEncoder := CheckBox4.Checked;
  UseFoobar := CheckBoxFoobar.Checked;
  FoobarPath := edtFoobar.Text;
  AllFiles := CheckBoxAllFiles.Checked;
  AutoSort := cbAutoSort.Checked; //PP
  AutoSave := cbAutoSave.Checked; //PP

  if RadioButton2.Checked then PreferTag := 2
  else PreferTag := 1;

	SetOptions := true;
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmOptions.Button2Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

function TfrmOptions.GetLangName(FileIndex: longint): string;
begin
	Result := '';

	if FileIndex > 0 then
		try
			TempList.Items.LoadFromFile(ComboBox1.Items.Strings[FileIndex]);
			Result := TempList.Items.Strings[0];
			Delete(Result, 1, 3);
		finally
			TempList.Clear;
		end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmOptions.ComboBox1Change(Sender: TObject);
begin
	Label1.Caption := GetLangName(ComboBox1.ItemIndex);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmOptions.FormShow(Sender: TObject);
var
	Index, LangIndex: longint;
	FileName, LangPath: string;
begin
	Caption := GetText(31);
	Button1.Caption := GetText(54);
	Button2.Caption := GetText(57);
	GroupBox1.Caption := GetText(142);
	CheckBox1.Caption := GetText(143);
	CheckBox2.Caption := GetText(144);
	GroupBox2.Caption := GetText(145);
	ComboBox1.Items.Add(AnsiLowerCase(GetText(146)));
	GroupBox3.Caption := GetText(203);
  GroupBox4.Caption := GetText(225);
	CheckBox3.Caption := GetText(204);
  CheckBox5.Caption := GetText(209);
  CheckBox4.Caption := GetText(224);
  CheckBoxFoobar.Caption := GetText(235);
  CheckBoxAllFiles.Caption := GetText(236);
  cbAutoSort.Caption := GetText(330);//PP
  cbAutoSave.Caption := GetText(331);//PP

	if DirectoryExists(RootD + LanguageDir) then LangPath := RootD + LanguageDir + '\'
  else LangPath := RootD;

	LangIndex := 0;

	DirList.Directory := LangPath;
	DirList.Update;
	FileList.Update;
	FileList.Mask := '*.' + LanguageExt;
	for Index := 1 to FileList.Items.Count do
	begin
		FileName := AnsiLowerCase(FileList.Items.Strings[Index - 1]);
		ComboBox1.Items.Add(FileName);

		if FileName = LangName then LangIndex := Index;
	end;

	ComboBox1.ItemIndex := LangIndex;
	Label1.Caption := GetLangName(ComboBox1.ItemIndex);

	CheckBox1.Checked := AutoOpen;
	CheckBox2.Checked := UseWindowSettings;
  CheckBox3.Checked := AutoBackup;
  CheckBox5.Checked := ValidFiles;
  CheckBox4.Checked := GuessedEncoder;
  CheckBoxFoobar.Checked := UseFoobar;
  edtFoobar.Enabled := UseFoobar;
  spdbtnFoobar.Enabled := UseFoobar;
  edtFoobar.Text := FoobarPath;
  CheckBoxAllFiles.Checked := AllFiles;
  cbAutoSort.Checked := AutoSort;//PP
  cbAutoSave.Checked := AutoSave;//PP
  if PreferTag = 2 then RadioButton2.Checked := true
  else RadioButton1.Checked := true;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmOptions.CheckBoxFoobarClick(Sender: TObject);
begin
  edtFoobar.Enabled := not edtFoobar.Enabled;
  spdbtnFoobar.Enabled := not spdbtnFoobar.Enabled;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmOptions.spdbtnFoobarClick(Sender: TObject);
var
	SourcePath, SourceLabel: string;
	SourceSerial: longint;
begin
  if SourcePathOKfoobar(GetText(238), SourcePath, SourceLabel, SourceSerial) then
    edtFoobar.Text := SourcePath;
end;

{ --------------------------------------------------------------------------- }

end.
