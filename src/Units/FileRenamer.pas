unit FileRenamer;

interface

uses
	MessageDialog, Filter, WaitWindow, ShellAPI,
	FileCtrl, Global, Windows, Messages, SysUtils, Classes, Graphics,
	Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, FolderTree, Menus,
  ImgList;

type
	TfrmFileRenamer = class(TForm)
    Image2: TImage;
    Button1: TButton;
    GroupBox1: TGroupBox;
    FolderTree1: TFolderTree;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    FileListBox1: TFileListBox;
    StatusBar1: TStatusBar;
    GroupBox3: TGroupBox;
    ListView1: TListView;
    ImageList1: TImageList;
    Button3: TButton;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    Button4: TButton;
    ListView2: TListView;
    ListBox1: TListBox;
    Button5: TButton;
		procedure Button1Click(Sender: TObject);
		procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FolderTree1Change(Sender: TObject; Node: TTreeNode);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListView1Editing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure ListView1Edited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure Edit1Change(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure Button3Click(Sender: TObject);
    procedure ListView1GetImageIndex(Sender: TObject; Item: TListItem);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure Button5Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
	private
		SPath: string;
    Renamed: integer;
    procedure OnMenuClick(Index: byte);
		function LoadFilterOK(FileName: string): boolean;
		procedure LoadDefaultFilter;
    function SaveFilter(FileName: string): boolean;
	end;

function FileRenamerDialog: string;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

function FileRenamerDialog: string;
begin
	with TfrmFileRenamer.Create(Application) do
		try
    	SPath := '';
    	ShowModal;
      Result := SPath;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.Button1Click(Sender: TObject);
begin
	SPath := '';
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.FormCreate(Sender: TObject);
var
	Index, IconIndex: integer;
begin
	Caption := GetText(220);
  GroupBox1.Caption := GetText(89);
  GroupBox2.Caption := GetText(41);
  ListView1.Columns[0].Caption := GetText(105);
  ListView1.Columns[1].Caption := GetText(42);
  ListView1.Columns[2].Caption := GetText(43);
  ListView1.Columns[3].Caption := GetText(44);
  ListView1.Columns[4].Caption := GetText(45);
  ListView1.Columns[5].Caption := GetText(46);
  ListView1.Columns[6].Caption := GetText(47);
	Button1.Caption := GetText(93);
  Button2.Caption := GetText(226);
  Button3.Caption := GetText(228);
  Button4.Caption := GetText(229);
  Button5.Caption := GetText(231);
  Label8.Caption := GetText(42);
  Label9.Caption := GetText(43);
  Label10.Caption := GetText(44);
  Label11.Caption := GetText(45);
  Label12.Caption := GetText(46);
  Label13.Caption := GetText(47);

  FileListBox1.Mask := FileMask + ';' + MPPFileMask;

	if FolderTree1.GetPath(FolderTree1.Items[2]) = 'A:\' then
  begin
		IconIndex := FolderTree1.Items[2].ImageIndex;
	  for Index := FolderTree1.Items.Count - 1 downto 0 do
  		if FolderTree1.Items[Index].ImageIndex = IconIndex then
	    		FolderTree1.Items.Delete(FolderTree1.Items[Index]);
  end;

	FolderTree1.SetDirectory(LastEditDir);

	Edit1.Text := LastMacro;
  if not LoadFilterOK(RootD + FilterFile) then LoadDefaultFilter;

	Tag := 0;
  ListView1.AlphaSort;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.Button2Click(Sender: TObject);
var
	Index, Index2: integer;
  Path, NewName: string;
  Item: TListItem;
  TagInfo: TagArray;
begin
	LastMacro := Trim(Edit1.Text);
	LastEditDir := FileListBox1.Directory;

	for Index := 0 to ListView1.Items.Count - 1 do
		if ListView1.Items[Index].Selected then
		begin
    	Item := ListView1.Items[Index];
    	Path := Item.SubItems.Strings[6];

      if not FileExists(Path) then
      	if Dialog(GetText(95) + ': ' + Path, GetText(51), GetText(54), GetText(57), '', 1, 2) = 2 then exit
	      else continue;

      for Index2 := 1 to 6 do TagInfo[Index2] := Item.SubItems[Index2 - 1];

			NewName := GetNewFileName(Path, TagInfo, LastMacro, ListView2);
      if LowerCase(NewName) = LowerCase(Path) then
      begin
      	Item.Selected := false;
      	continue;
      end;

      try
      	FileSetAttr(Path, 0);
				if not RenameFile(Path, NewName) then raise Exception.Create('')
        else
        begin
        	Item.Selected := false;
          Item.Caption := ExtractFileName(NewName);
			    if Item.ImageIndex <> 3 then
			    begin
	    			Item.ImageIndex := 3;
			      Inc(Renamed);
			    end;
			    Item.SubItems.Strings[6] := NewName;
			    if Item.SubItems.Strings[7] = '' then Item.SubItems.Strings[7] := Path;
			    if Item.SubItems.Strings[6] = Item.SubItems.Strings[7] then
			    begin
    				Item.ImageIndex := 0;
			      Dec(Renamed);
			      Item.SubItems.Strings[7] := '';
			    end;
        end;
      except
      	if Dialog(GetText(105) + ': ' + Path + #13#10 + GetText(227) + ' ' + ExtractFileName(NewName),
        	GetText(51), GetText(54), GetText(57), '', 1, 2) = 2 then exit;
      end;
		end;

  Button3.Enabled := (Renamed > 0) and (ListView1.SelCount > 0);
  ListView1.AlphaSort;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.FormResize(Sender: TObject);
begin
	GroupBox3.Width := ClientWidth - Button1.Width - GroupBox3.Left * 3 + 2;
  GroupBox2.Left := GroupBox3.Left + GroupBox3.Width - GroupBox2.Width;
  GroupBox1.Width := GroupBox2.Left - GroupBox3.Left - 8;
  FolderTree1.Width := GroupBox1.Width - FolderTree1.Left * 2;
  ListView1.Width := GroupBox3.Width - ListView1.Left * 2;
	Button1.Left := ClientWidth - GroupBox3.Left - Button1.Width + 1;
  Button2.Left := Button1.Left;
  Button3.Left := Button1.Left;
  Button4.Left := Button1.Left;
  Button5.Left := Button1.Left;
  Image2.Left := Button1.Left + (Button1.Width - Image2.Width) div 2;

  GroupBox3.Height := Trunc(ClientHeight - GroupBox1.Height - GroupBox1.Top * 2.5);
  ListView1.Height := GroupBox3.Height - GroupBox3.Left - ListView1.Top;
  Button1.Top := ClientHeight - Button1.Height - GroupBox1.Top - 1;
  Button4.Top := ClientHeight - (Button4.Height + GroupBox1.Top) * 2 + 1;
  Button5.Top := ClientHeight - (Button5.Height + GroupBox1.Top) * 3 + 2;
  Button3.Top := ClientHeight - (Button3.Height + GroupBox1.Top) * 4 + 3;
  Button2.Top := ClientHeight - (Button2.Height + GroupBox1.Top) * 5 + 4;
  Image2.Top := (Button2.Top + GroupBox1.Top - Image2.Height) div 2;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.FolderTree1Change(Sender: TObject; Node: TTreeNode);
var
	Index, Index2: integer;
  Item: TListItem;
  Path: string;
  FileTag: TagArray;
begin
	try
  	if not DirectoryExists(FolderTree1.Directory) then raise Exception.Create('');
		FileListBox1.Directory := FolderTree1.Directory;
    FileListBox1.Update;

		if Length(FileListBox1.Directory) = 3 then Path := FileListBox1.Directory
		else Path := FileListBox1.Directory + '\';

		if FileListBox1.Items.Count > 0 then
    begin
			ListView1.Items.BeginUpdate;
			ShowWaitWindow(GetText(58));
			SetWaitWindowText(GetText(79) + '...');
      ListView1.Items.Clear;

	    for Index := 1 to FileListBox1.Items.Count do
  	  begin
    		Item := ListView1.Items.Add;
      	Item.Caption := FileListBox1.Items.Strings[Index - 1];

        FileTag := GetFileTag(Path + Item.Caption, 0, Index);
        for Index2 := 1 to 6 do Item.SubItems.Add(FileTag[Index2]);

        Item.SubItems.Add(Path + Item.Caption);
        Item.SubItems.Add('');
        Item.SubItems.Add(Chr(Index));
	    end;

      ListView1.AlphaSort;
      CloseWaitWindow;
      ListView1.Items.EndUpdate;

	    ListView1.Enabled := true;
  	  ListView1.Items[0].Focused := true;
    end
    else
    begin
    	ListView1.Items.Clear;
    	ListView1.Enabled := false;
    end;
  except
  	ListView1.Items.Clear;
    ListView1.Enabled := false;
  end;

  Renamed := 0;
  Button3.Enabled := (Renamed > 0) and (ListView1.SelCount > 0);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	Index: integer;
begin
	if (ssCtrl in Shift) and (Key = Ord('A')) then
  	for Index := 0 to ListView1.Items.Count - 1 do
    	ListView1.Items[Index].Selected := true;

  if Key = VK_RETURN then ListView1DblClick(Self);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.ListView1Editing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
	AllowEdit := true;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.ListView1Edited(Sender: TObject; Item: TListItem;
  var S: String);
var
	OldName, Ext, NewName: string;
begin
	OldName := Item.SubItems.Strings[6];
	Ext := ExtractFileExt(OldName);
  if LowerCase(Ext) <> LowerCase(ExtractFileExt(S)) then S := S + Ext;

  if not FileExists(OldName) then
  begin
  	Dialog(GetText(95) + ': ' + OldName, GetText(51), GetText(54), '', '', 1, 2);
    S := ExtractFileName(OldName);
    exit;
  end;

  try
  	NewName := Copy(OldName, 1, LastDelimiter('\', OldName)) + S;
  	FileSetAttr(OldName, 0);
		if not RenameFile(OldName, NewName) then raise Exception.Create('');
    if Item.ImageIndex <> 3 then
    begin
	    Item.ImageIndex := 3;
      Inc(Renamed);
    end;
    Item.SubItems.Strings[6] := NewName;
    if Item.SubItems.Strings[7] = '' then Item.SubItems.Strings[7] := OldName;
    if Item.SubItems.Strings[6] = Item.SubItems.Strings[7] then
    begin
    	Item.ImageIndex := 0;
      Dec(Renamed);
      Item.SubItems.Strings[7] := '';
    end;
  except
		Dialog(GetText(105) + ': ' + OldName + #13#10 + GetText(227) + ' ' + S,
    	GetText(51), GetText(54), '', '', 1, 2);
   	S := ExtractFileName(OldName);
  end;

  Button3.Enabled := (Renamed > 0) and (ListView1.SelCount > 0);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.Edit1Change(Sender: TObject);
begin
	ListView1GetImageIndex(Self, nil);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.ListView1ColumnClick(Sender: TObject; Column: TListColumn);
var
	Value: integer;
begin
	Value := Abs(Tag) - 1;
  Tag := Column.Index + 1;
  if ListView1.Columns[Column.Index].ImageIndex = 1 then Tag := -Tag;

  if Value >= 0 then ListView1.Columns[Value].ImageIndex := -1;
  ListView1.AlphaSort;

  if Tag < 0 then ListView1.Columns[Column.Index].ImageIndex := 2
  else ListView1.Columns[Column.Index].ImageIndex := 1;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.Button3Click(Sender: TObject);
var
	Index: integer;
  Path, NewName: string;
  Item: TListItem;
begin
	for Index := 0 to ListView1.Items.Count - 1 do
  begin
    Item := ListView1.Items[Index];

		if (Item.Selected) and (Item.SubItems.Strings[7] <> '') then
		begin
    	Path := Item.SubItems.Strings[6];

      if not FileExists(Path) then
      	if Dialog(GetText(95) + ': ' + Path, GetText(51), GetText(54), GetText(57), '', 1, 2) = 2 then exit
	      else continue;

			NewName := Item.SubItems.Strings[7];

      try
      	FileSetAttr(Path, 0);
				if not RenameFile(Path, NewName) then raise Exception.Create('')
        else
        begin
        	Item.Selected := false;
          Item.Caption := ExtractFileName(NewName);
			    if Item.ImageIndex = 3 then
			    begin
	    			Item.ImageIndex := 0;
			      Dec(Renamed);
			    end;
			    Item.SubItems.Strings[6] := NewName;
			    Item.SubItems.Strings[7] := '';
        end;
      except
      	if Dialog(GetText(105) + ': ' + Path + #13#10 + GetText(227) + ' ' + ExtractFileName(NewName),
        	GetText(51), GetText(54), GetText(57), '', 1, 2) = 2 then exit;
      end;
		end;
  end;

  Button3.Enabled := (Renamed > 0) and (ListView1.SelCount > 0);
  ListView1.AlphaSort;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.ListView1GetImageIndex(Sender: TObject; Item: TListItem);
var
	Index: integer;
  AllowRename: boolean;
begin
	AllowRename := false;
	for Index := 1 to 6 do
  	if Pos('%0' + IntToStr(Index), Edit1.Text) > 0 then AllowRename := true;

  Button2.Enabled := (AllowRename) and (ListView1.SelCount > 0);
	Button3.Enabled := (Renamed > 0) and (ListView1.SelCount > 0);
  Button5.Enabled := ListView1.SelCount > 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.PopupMenu1Popup(Sender: TObject);
begin
  PopupMenu1.Items[0].Caption := Label8.Caption;
  PopupMenu1.Items[1].Caption := Label9.Caption;
  PopupMenu1.Items[2].Caption := Label10.Caption;
  PopupMenu1.Items[3].Caption := Label11.Caption;
  PopupMenu1.Items[4].Caption := Label12.Caption;
  PopupMenu1.Items[5].Caption := Label13.Caption;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.OnMenuClick(Index: byte);
begin
	if Length(Edit1.Text) < Edit1.MaxLength then
  	Edit1.Text := Edit1.Text + '%0' + IntToStr(Index);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.N11Click(Sender: TObject);
begin
	OnMenuClick(1);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.N21Click(Sender: TObject);
begin
	OnMenuClick(2);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.N31Click(Sender: TObject);
begin
	OnMenuClick(3);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.N41Click(Sender: TObject);
begin
	OnMenuClick(4);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.N51Click(Sender: TObject);
begin
	OnMenuClick(5);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.N61Click(Sender: TObject);
begin
	OnMenuClick(6);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.Button4Click(Sender: TObject);
begin
	SetFilter(ListView2);
end;

// -----------------------------------------------------------------------------

function TfrmFileRenamer.LoadFilterOK(FileName: string): boolean;
var
	Index: integer;
  Line, First, Second: string;
  Item: TListItem;
begin
	Result := false;

 	if FileExists(FileName) then
		try
			ListBox1.Items.LoadFromFile(FileName);
  	  ListView2.Items.Clear;

		  for Index := 1 to ListBox1.Items.Count do
  		begin
    		Line := ListBox1.Items.Strings[Index - 1];
      	First := Copy(Line, Pos(#1, Line) + 1, Pos(#2, Line) - Pos(#1, Line) - 1);
	      Second := Copy(Line, Pos(#2, Line) + 1, Pos(#3, Line) - Pos(#2, Line) - 1);

  	    if First <> '' then
    	  begin
					Item := ListView2.Items.Add;
  		  	Item.Caption := First;
					Item.SubItems.Add(Second);
  	    end;
	  	end;

      Result := true;
	  except
	  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.LoadDefaultFilter;
var
	Index: integer;
  Item: TListItem;
begin
	ListView2.Items.Clear;

  for Index := 1 to MAX_DEFAULT_FILTER_ITEMS do
  begin
		Item := ListView2.Items.Add;
    Item.Caption := DEFAULT_FILTER[Index, 1];
		Item.SubItems.Add(DEFAULT_FILTER[Index, 2]);
  end;
end;

// -----------------------------------------------------------------------------

function TfrmFileRenamer.SaveFilter(FileName: string): boolean;
var
	Index: integer;
begin
	ListBox1.Items.Clear;

  for Index := 1 to ListView2.Items.Count do
  begin
		ListBox1.Items.Add(#1 + ListView2.Items[Index - 1].Caption + #2 +
    	ListView2.Items[Index - 1].SubItems.Strings[0] + #3);
  end;

  try
  	FileSetAttr(FileName, 0);
    ListBox1.Items.SaveToFile(FileName);
  	Result := true;
  except
  	Result := false;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	if not SaveFilter(RootD + FilterFile) then
		Dialog(GetText(77) + ': ' + RootD + FilterFile, GetText(51), GetText(54), '', '', 1, 2);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.ListView1Compare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
	Compare := 0;
	if Tag = 0 then exit;

	if Abs(Tag) = 1 then Compare := AnsiCompareText(Item1.Caption,Item2.Caption)
  else Compare := AnsiCompareText(Item1.SubItems.Strings[Abs(Tag) - 2],
  	Item2.SubItems.Strings[Abs(Tag) - 2]);

  if Tag < 0 then Compare := -Compare;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.Button5Click(Sender: TObject);
var
	Index: integer;
  Item: TListItem;
  Path: string;
begin
	if Dialog(GetText(232), GetText(50), GetText(55), GetText(56), '', 2, 1) = 1 then
		for Index := ListView1.Items.Count - 1 downto 0 do
  	begin
			Item := ListView1.Items[Index];

			if Item.Selected then
			begin
	    	Path := Item.SubItems.Strings[6];

	      if not FileExists(Path) then
  	    	if Dialog(GetText(95) + ': ' + Path, GetText(51), GetText(54), GetText(57), '', 1, 2) = 2 then exit
	  	    else continue;

	      try
  	    	FileSetAttr(Path, 0);
          if not DeleteFile(Path) then raise Exception.Create('')
					else Item.Delete;
	      except
	      	if Dialog(GetText(48) + ': ' + Path, GetText(51), GetText(54), GetText(57), '', 1, 2) = 2 then exit;
    	  end;
			end;
		end;

	ListView1GetImageIndex(Self, nil);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileRenamer.ListView1DblClick(Sender: TObject);
begin
	if (ListView1.ItemFocused <> nil) and (ListView1.ItemFocused.Selected) then
  	ShellExecute(Handle, 'open', PChar(ListView1.ItemFocused.SubItems.Strings[6]), nil, nil, SW_SHOW);
end;

// -----------------------------------------------------------------------------

end.
