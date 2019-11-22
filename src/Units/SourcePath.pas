unit SourcePath;

interface

uses
	MessageDialog, Global, Windows, Messages, SysUtils, Classes, Graphics,
	Controls,	Forms, Dialogs, StdCtrls, FileCtrl, ExtCtrls, ComCtrls, ImgList,
  FolderTree;

type
  TfrmSourcePath = class(TForm)
    GroupBox1: TGroupBox;
		Button1: TButton;
		Button2: TButton;
		Image1: TImage;
    FolderTree1: TFolderTree;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
		procedure Button2Click(Sender: TObject);
		procedure Button1Click(Sender: TObject);
		procedure FormCreate(Sender: TObject);
    procedure FolderTree1Change(Sender: TObject; Node: TTreeNode);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
	private
		SourcePath: string;
		SourceLabel: string;
		SourceSerial: longint;
		SourceOK: boolean;
    procedure DrawLabel;
	end;

function SourcePathOK(WTitle: string; var SPath, SLabel: string; var SSerial: longint): boolean;
function SourcePathOKfoobar(WTitle: string; var SPath, SLabel: string; var SSerial: longint): boolean;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

function SourcePathOK(WTitle: string; var SPath, SLabel:  string; var SSerial: longint): boolean;
begin
	with TfrmSourcePath.Create(Application) do
		try
		begin
    	UserVolumeLabel := '';
			Caption := WTitle;
			SourceOK := false;

			ShowModal;

			Result := SourceOK;
			SPath := SourcePath;
			SLabel := SourceLabel;
			SSerial := SourceSerial;
		end;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

function SourcePathOKfoobar(WTitle: string; var SPath, SLabel:  string; var SSerial: longint): boolean;
var
	LastAddDirNotFoobar : String;
begin
	with TfrmSourcePath.Create(Application) do
		try
		begin
    	UserVolumeLabel := '';
			Caption := WTitle;
			SourceOK := false;

      GroupBox2.Visible := False;
      GroupBox1.Height := GroupBox1.Height + 72;
      FolderTree1.Height := FolderTree1.Height + 72;

      LastAddDirNotFoobar := LastAddDir;
      FolderTree1.SetDirectory(FoobarPath);

			ShowModal;

      LastAddDir := LastAddDirNotFoobar;

			Result := SourceOK;
			SPath := SourcePath;
			SLabel := SourceLabel;
			SSerial := SourceSerial;
		end;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSourcePath.Button2Click(Sender: TObject);
begin
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmSourcePath.Button1Click(Sender: TObject);
begin
	if (DirectoryExists(FolderTree1.Directory)) and
	  (VolumeDataOK(FolderTree1.Directory[1], SourceLabel, SourceSerial)) then
	begin
		SourceOK := true;

		SourcePath := FolderTree1.Directory;
		if Length(SourcePath) > 3 then SourceLabel := SourceLabel + Copy(SourcePath, 3, Length(SourcePath) - 2);

    UserVolumeLabel := Edit1.Text;
    if Pos('\', UserVolumeLabel) > 0 then
    	UserVolumeLabel := Trim(StringReplace(UserVolumeLabel, '\', ' ', [rfReplaceAll]));

    LastAddDir := SourcePath;
		Close;
	end
	else
		Dialog(GetText(98), GetText(51), GetText(54), '', '', 1, 2);
end;

// -----------------------------------------------------------------------------

procedure TfrmSourcePath.FormCreate(Sender: TObject);
var
	Index, IconIndex: integer;
begin
	GroupBox1.Caption := GetText(89);
  GroupBox2.Caption := GetText(103);
	Button1.Caption := GetText(54);
	Button2.Caption := GetText(57);

	if FolderTree1.GetPath(FolderTree1.Items[2]) = 'A:\' then
  begin
		IconIndex := FolderTree1.Items[2].ImageIndex;
	  for Index := FolderTree1.Items.Count - 1 downto 0 do
  		if FolderTree1.Items[Index].ImageIndex = IconIndex then
	    		FolderTree1.Items.Delete(FolderTree1.Items[Index]);
  end;

	FolderTree1.SetDirectory(LastAddDir);
end;

// -----------------------------------------------------------------------------

procedure TfrmSourcePath.DrawLabel;
var
	SL: string;
  SS: longint;
begin
	if (DirectoryExists(FolderTree1.Directory)) and
	  (VolumeDataOK(FolderTree1.Directory[1], SL, SS)) then
  begin
    Edit1.Text := SL;
    if (FolderTree1.Selected <> nil) and (FolderTree1.Selected.Level <> 2) then
    	Edit1.Text := FolderTree1.Selected.Text;
  end
  else
  	Edit1.Text := '';
end;

// -----------------------------------------------------------------------------

procedure TfrmSourcePath.FolderTree1Change(Sender: TObject; Node: TTreeNode);
begin
	DrawLabel;
end;

// -----------------------------------------------------------------------------

procedure TfrmSourcePath.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_RETURN then Button1Click(Self);
end;

// -----------------------------------------------------------------------------

end.
