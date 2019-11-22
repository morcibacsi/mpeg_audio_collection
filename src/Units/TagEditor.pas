unit TagEditor;

interface

uses
	MessageDialog, ID3v1,
	Global, Windows, Messages, SysUtils, Classes, Graphics,
	Controls, Forms, FileCtrl, StdCtrls, ExtCtrls;

type
  TfrmTagEditor = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    Button3: TButton;
    Edit5: TEdit;
    Image1: TImage;
    Edit6: TEdit;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
// begin MB    
    Image8: TImage;
    CheckBox7: TCheckBox;
    Edit7: TEdit;
// end MB
    procedure Button3Click(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
	private
	  procedure UpdateControls;
	end;

var
  ID3: TID3v1;

procedure ShowTagEditor;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

procedure ShowTagEditor;
begin
	with TfrmTagEditor.Create(Application) do
		try ShowModal;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagEditor.UpdateControls;
begin
	Edit1.Enabled := CheckBox1.Checked;
  if Edit1.Enabled then Edit1.Color := FileListBox1.Color
  else Edit1.Color := Color;
  Edit2.Enabled := CheckBox2.Checked;
  if Edit2.Enabled then Edit2.Color := FileListBox1.Color
  else Edit2.Color := Color;
  Edit3.Enabled := CheckBox3.Checked;
  if Edit3.Enabled then Edit3.Color := FileListBox1.Color
  else Edit3.Color := Color;
  Edit4.Enabled := CheckBox6.Checked;
  if Edit4.Enabled then Edit4.Color := FileListBox1.Color
  else Edit4.Color := Color;
  Edit5.Enabled := CheckBox5.Checked;
  if Edit5.Enabled then Edit5.Color := FileListBox1.Color
  else Edit5.Color := Color;
  Edit6.Enabled := CheckBox4.Checked;
  if Edit6.Enabled then Edit6.Color := FileListBox1.Color
  else Edit6.Color := Color;
// begin MB
  Edit7.Enabled := CheckBox7.Checked;
  if Edit7.Enabled then Edit7.Color := FileListBox1.Color
  else Edit7.Color := Color;
// end MB

  Button1.Enabled := CheckBox1.Checked or CheckBox2.Checked or CheckBox3.Checked
  	or CheckBox4.Checked or CheckBox5.Checked or CheckBox6.Checked or CheckBox7.Checked; // MB 
end;

// -----------------------------------------------------------------------------

procedure TfrmTagEditor.FormCreate(Sender: TObject);
begin
	Caption := GetText(29);
	GroupBox1.Caption := GetText(89);
	GroupBox2.Caption := GetText(90);
	CheckBox1.Caption := GetText(42);
	CheckBox2.Caption := GetText(43);
	CheckBox3.Caption := GetText(44);
	CheckBox4.Caption := GetText(45);
	CheckBox5.Caption := GetText(46);
	CheckBox6.Caption := GetText(47);
  CheckBox7.Caption := GetText(lngGenre); // MB
	Button1.Caption := GetText(91);
	Button2.Caption := GetText(92);
	Button3.Caption := GetText(93);

  CheckBox1.Checked := TagField[1];
  CheckBox2.Checked := TagField[2];
  CheckBox3.Checked := TagField[3];
  CheckBox4.Checked := TagField[4];
  CheckBox5.Checked := TagField[5];
  CheckBox6.Checked := TagField[6];
  CheckBox7.Checked := TagField[7]; // MB

  FileListBox1.Mask := FileMask + ';' + MPPFileMask;
  UpdateControls;

  ID3 := TID3v1.Create;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TagField[1] := CheckBox1.Checked;
  TagField[2] := CheckBox2.Checked;
  TagField[3] := CheckBox3.Checked;
  TagField[4] := CheckBox4.Checked;
  TagField[5] := CheckBox5.Checked;
  TagField[6] := CheckBox6.Checked;
  TagField[7] := CheckBox7.Checked; // MB

  ID3.Free;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagEditor.Button3Click(Sender: TObject);
begin
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagEditor.DriveComboBox1Change(Sender: TObject);
begin
	if GetVolumeLabel(DriveComboBox1.Drive) = NO_DISC then
	begin
		DirectoryListBox1.Clear;
		FileListBox1.Clear;
	end
	else
	begin
		DirectoryListBox1.Drive := DriveComboBox1.Drive;
		DirectoryListBox1.Update;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagEditor.FileListBox1Change(Sender: TObject);
begin
	Edit1.Clear;
	Edit2.Clear;
	Edit3.Clear;
	Edit4.Clear;
	Edit5.Clear;
	Edit6.Clear;

	if FileExists(FileListBox1.FileName) then
	begin
  	ID3.ReadFromFile(FileListBox1.FileName);

		if ID3.Exists then
		begin
			Edit1.Text := ID3.Title;
			Edit2.Text := ID3.Artist;
			Edit3.Text := ID3.Album;
			Edit4.Text := ID3.Comment;
			Edit5.Text := ID3.Year;
      Edit6.Text := IntToStr(ID3.Track);
		end;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagEditor.Button1Click(Sender: TObject);
var
	Track, Error: integer;
	Index: integer;
	Path: string;
begin
	Val(Edit6.Text, Track, Error);

	for Index := 0 to FileListBox1.Items.Count - 1 do
		if FileListBox1.Selected[Index] then
		begin
    	if Length(FileListBox1.Directory) = 3 then Path := FileListBox1.Directory + FileListBox1.Items[Index]
      else Path := FileListBox1.Directory + '\' + FileListBox1.Items[Index];

      if (not FileExists(Path)) or (not ID3.ReadFromFile(Path)) then
        if Dialog(GetText(95) + ': ' + Path, GetText(51), GetText(54), GetText(57), '', 1, 2) = 2 then exit
        else continue;

			if Edit1.Enabled then ID3.Title := Edit1.Text;
			if Edit2.Enabled then ID3.Artist := Edit2.Text;
			if Edit3.Enabled then ID3.Album := Edit3.Text;
			if Edit4.Enabled then ID3.Comment := Edit4.Text;
			if Edit5.Enabled then ID3.Year := Edit5.Text;
      if Edit6.Enabled then
				if (Error = 0) and (Track in [0..99]) then ID3.Track := Track
				else ID3.Track := 0;

      try
      	FileSetAttr(Path, 0);

        if not ID3.SaveToFile(Path) then raise Exception.Create('')
        else FileListBox1.Selected[Index] := false;
      except
      	if Dialog(GetText(96) + ': ' + Path, GetText(51), GetText(54), GetText(57), '', 1, 2) = 2 then exit;
      end;
		end;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagEditor.Button2Click(Sender: TObject);
var
	Index: integer;
	Path: string;
begin
	for Index := 0 to FileListBox1.Items.Count - 1 do
		if FileListBox1.Selected[Index] then
		begin
    	if Length(FileListBox1.Directory) = 3 then Path := FileListBox1.Directory + FileListBox1.Items[Index]
      else Path := FileListBox1.Directory + '\' + FileListBox1.Items[Index];

      if (not FileExists(Path)) or (not ID3.RemoveFromFile(Path)) then
        if Dialog(GetText(95) + ': ' + Path, GetText(51), GetText(54), GetText(57), '', 1, 2) = 2 then exit
        else continue;

      ID3.ReadFromFile(Path);
      if not ID3.Exists then FileListBox1.Selected[Index] := false
      else if Dialog(GetText(97) + ': ' + Path, GetText(51), GetText(54), GetText(57), '', 1, 2) = 2 then exit;
		end;

 	Edit1.Clear;
	Edit2.Clear;
	Edit3.Clear;
	Edit4.Clear;
	Edit5.Clear;
	Edit6.Clear;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagEditor.CheckBox1Click(Sender: TObject);
begin
	UpdateControls;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagEditor.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (Key = VK_RETURN) and (Button1.Enabled) then Button1Click(Self);
end;

// -----------------------------------------------------------------------------

end.
