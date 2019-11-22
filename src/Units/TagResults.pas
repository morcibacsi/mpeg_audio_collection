unit TagResults;

interface

uses
	Global, WaitWindow, ProgressWindow, SysUtils, MessageDialog, Windows,
	Classes, Forms, ImgList, Controls, StdCtrls, ComCtrls, ExtCtrls, Graphics,
  Dialogs, Menus, ShellAPI;

type
	TfrmTagResults = class(TForm)
		Panel1: TPanel;
		Button1: TButton;
		ListView1: TListView;
		Image1: TImage;
		ImageList1: TImageList;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    Button3: TButton;
    StatusBar1: TStatusBar;
    pmnSearch: TPopupMenu;
    Play1: TMenuItem;
    Enqueue1: TMenuItem;
    Playlist1: TMenuItem;
    N4: TMenuItem;
    Information1: TMenuItem;
    OpenDir: TMenuItem;
		procedure Button1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnSearchPopup(Sender: TObject);
    procedure Play1Click(Sender: TObject);
    procedure Enqueue1Click(Sender: TObject);
    procedure Playlist1Click(Sender: TObject);
    procedure OpenDirClick(Sender: TObject);
	private
  	FindItem: TTreeNode;
    SourcePath: string;
    function SaveFoundItemsOK(FName: string): boolean;

    function GetSelectedNode: TTreeNode;
	end;

function ShowTagResults(SPath: string; GD, HT: boolean): TTreeNode;

implementation

uses
  Main;

{$R *.DFM}

{ --------------------------------------------------------------------------- }

function ShowTagResults(SPath: string; GD, HT: boolean): TTreeNode;
var
	Index, Index2: longint;
	ListItem: TListItem;
	Path, ItemText: string;
	Item, ParentNode: TTreeNode;
  TagInfo: TagArray;
begin
	with TfrmTagResults.Create(Application) do
		try
		begin
    	SourcePath := SPath;
      ListView1.GridLines := GD;
      ListView1.RowSelect := ListView1.GridLines;
      ListView1.HotTrack := HT;
      FindItem := nil;

      Tag := 0;
			Caption := GetText(140) + ': ' + GetText(19) + ': ' + IntToStr(TempList.Items.Count);
			Button1.Caption := GetText(93);
		  Button2.Caption := GetText(91);
      Button3.Caption := GetText(15);
			ListView1.Columns.Items[0].Caption := GetText(41);
			ListView1.Columns.Items[1].Caption := GetText(104);
			ListView1.Columns.Items[2].Caption := GetText(42);
			ListView1.Columns.Items[3].Caption := GetText(43);
			ListView1.Columns.Items[4].Caption := GetText(44);
			ListView1.Columns.Items[5].Caption := GetText(45);
			ListView1.Columns.Items[6].Caption := GetText(46);
			ListView1.Columns.Items[7].Caption := GetText(47);
      ListView1.Columns.Items[8].Caption := GetText(lngGenre); // MB

			ShowProgressWindow(GetText(141));

			for Index := 0 to TempList.Items.Count - 1 do
			begin
				if (Index mod 100) = 0 then
        	SetProgressValue(Round(Index / TempList.Items.Count * 100));

      	Item := TTreeNode(TempList.Items.Objects[Index]);

        TagInfo := ExtractTag(Item.Text);

				ListItem := ListView1.Items.Add;
    		ListItem.Data := Item;
        ItemText := ExtractName(Item.Text);
		    if (not FileExtensions) and (Pos('.', ItemText) > 0) then ItemText := Copy(ItemText, 1, LastDelimiter('.', ItemText) - 1);
				ListItem.Caption := ItemText;

				Path := '';
				ParentNode := Item;
				while (ParentNode.Level > 1) do
				begin
					ParentNode := ParentNode.Parent;
    		  if (ParentNode.Level > 1) or (SourcePath <> '') then Path := ExtractName(ParentNode.Text) + '\' + Path
		      else Path := TTreeNode(ParentNode.Data).Text + '\' + Path;
				end;
		    if Length(Path) > 0 then Delete(Path, Length(Path), 1);
   			if SourcePath <> '' then
		    begin
    			if Pos('\', Path) > 0 then Delete(Path, 1, Pos('\', Path))
		      else Path := '';
    		  Path := Copy(SourcePath, 1, 3) + Path;
		    end;
        if (Length(Path) > 0) and (Path[Length(Path)] = '\') then Delete(Path, Length(Path), 1);
				ListItem.SubItems.Add(Path);

				for Index2 := 1 to numTag do // MB
					if Trim(TagText[Index2]) <> '' then
          begin
          	TagInfo[Index2] := Trim(TagInfo[Index2]);
						if (Length(TagInfo[Index2]) = 1) and (TagInfo[Index2][1] in ['1'..'9']) then TagInfo[Index2] := '0' + TagInfo[Index2];
          	ListItem.SubItems.Add(Trim(TagInfo[Index2]));
          end;
			end;

      for Index := numTag downto 1 do // MB
      	if Trim(TagText[Index]) = '' then ListView1.Columns.Delete(Index + 1);

			ListView1.Selected := ListView1.Items[0];
			ListView1.ItemFocused := ListView1.Selected;

		  CloseProgressWindow;

      ShowModal;
      Result := FindItem;
		end;
		finally Release;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.Button1Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.ListView1DblClick(Sender: TObject);
begin
	if ListView1.Selected <> nil then
  begin
	  FindItem := ListView1.Selected.Data;
  	Close;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.Button2Click(Sender: TObject);
begin
	SaveDialog1.Title := GetText(5);
	SaveDialog1.DefaultExt := '*.' + TextExt;
	SaveDialog1.Filter := GetText(169) + ' (*.' + TextExt + ')|*.' + TextExt;
	SaveDialog1.InitialDir := LastSaveDir;

  if SaveDialog1.Execute then
  begin
  	Repaint;

  	LastSaveDir := ExtractFilePath(SaveDialog1.FileName);

		ShowWaitWindow(GetText(78));
		SetWaitWindowText(GetText(79) + '...');

    if SaveFoundItemsOK(SaveDialog1.FileName) then
    	Dialog(GetText(181) + ': ' + SaveDialog1.FileName, GetText(52), GetText(54), '', '', 1, 3)
  	else
    	Dialog(GetText(77) + ': ' + SaveDialog1.FileName, GetText(51), GetText(54), '', '', 1, 2);

    CloseWaitWindow;
  end;
end;

{ --------------------------------------------------------------------------- }

function TfrmTagResults.SaveFoundItemsOK(FName: string): boolean;
var
	RFile: TextFile;
	Index: longint;
  ListItem: TListItem;
begin
	try
  	FileSetAttr(FName, 0);
  	AssignFile(RFile, FName);
		Rewrite(RFile);
    Writeln(RFile, Caption);
		Writeln(RFile, '');
    for Index := 1 to numTag do // MB
    	if Trim(TagText[Index]) <> '' then
      	Writeln(RFile, GetText(Index + 41) + ': ' + TagText[Index]);
    Writeln(RFile, '');

    for Index := 0 to ListView1.Items.Count - 1 do
    begin
    	ListItem := ListView1.Items[Index];
    	Writeln(RFile, ListItem.SubItems.Strings[0] + '\' + ListItem.Caption);
    end;

    CloseFile(RFile);

    Result := true;
	except
  	Result := false;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.Button3Click(Sender: TObject);
begin
	TempList.Tag := 1;
  Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_RETURN then ListView1DblClick(Self);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.FormResize(Sender: TObject);
begin
	Panel1.Width := ClientWidth - Button1.Width - Panel1.Left * 3 + 2;
  ListView1.Width := Panel1.Width - ListView1.Left * 2;
	Button1.Left := ClientWidth - Panel1.Left - Button1.Width + 1;
  Button2.Left := Button1.Left;
  Button3.Left := Button1.Left;
  Image1.Left := Button1.Left + (Button1.Width - Image1.Width) div 2;

  Panel1.Height := ClientHeight - Panel1.Top * 2;
  ListView1.Height := Panel1.Height - Panel1.Left - ListView1.Top;
  Button1.Top := ClientHeight - Button1.Height - Panel1.Top;
  Button2.Top := ClientHeight - (Button2.Height + Panel1.Top) * 3 + 2;
  Button3.Top := ClientHeight - (Button3.Height + Panel1.Top) * 2 + 1;
  Image1.Top := (Button2.Top + Panel1.Top - Image1.Height) div 2;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.ListView1ColumnClick(Sender: TObject; Column: TListColumn);
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

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.ListView1Compare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  Compare := 0;
	if Abs(Tag) = 1 then Compare := AnsiCompareText(Item1.Caption,Item2.Caption);
  if Abs(Tag) > 1 then Compare := AnsiCompareText(Item1.SubItems.Strings[Abs(Tag) - 2],Item2.SubItems.Strings[Abs(Tag) - 2]);
  if Tag < 0 then Compare := -Compare;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.FormCreate(Sender: TObject);
begin
if UseWindowSettings then
begin
  if SearchTop > 0 then	Top := SearchTop;
	if SearchLeft > 0 then	Left := SearchLeft;
	if SearchHeight > 239 then	Height := SearchHeight;
	if SearchWidth > 319 then	Width := SearchWidth;
end;

	Play1.Caption := GetText(152);
	Enqueue1.Caption := GetText(153);
	Playlist1.Caption := GetText(154);
  Information1.Caption := GetText(52);
  OpenDir.Caption := GetText(242);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SearchTop := Top;
	SearchLeft := Left;
	SearchHeight := Height;
	SearchWidth := Width;
end;

{ --------------------------------------------------------------------------- }

function TfrmTagResults.GetSelectedNode: TTreeNode;
var
	Index, Value: integer;
begin
	Result := nil;
  frmMain.ListBox4.Items.Clear;

	if ActiveControl = ListView1 then
   	for Index := 0 to ListView1.Items.Count - 1 do
     	if ListView1.Items[Index].Selected then
      begin
				Result := ListView1.Items[Index].Data;
		    Value := frmMain.ListBox4.Items.Add(Result.Text);
		    frmMain.ListBox4.Items.Objects[Value] := Result;
     	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.pmnSearchPopup(Sender: TObject);
var
  SelNode: TTreeNode;
begin

	SelNode := GetSelectedNode;

	if SelNode <> nil then
	begin
		Play1.Visible := true;
		Enqueue1.Visible := true;
		N4.Visible := true;
    //if frmMain.ListBox4.Items.Count = 1 then Information1.Visible := true;
    if (SelNode.HasChildren) or (frmMain.ListBox4.Items.Count > 1) then
      Playlist1.Visible := true
    else
      Playlist1.Visible := False;
    if frmMain.ListBox4.Items.Count = 1 then
      OpenDir.Visible := True
    else
      OpenDir.Visible := False;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.Play1Click(Sender: TObject);
var
	SelectedNode: TTreeNode;
  ErrorMsg: string;
begin
	SelectedNode := GetSelectedNode;
	if SelectedNode <> nil then
  begin
  	ShowWaitWindow(GetText(155));
    SetWaitWindowText(GetText(156) + '...');
    TempList.Sorted := false;
  	ErrorMsg := frmMain.CreatePlayList(SelectedNode, TempList);
    CloseWaitWindow;

    if ErrorMsg = '' then
     	try
       	TempList.Items.SaveToFile(RootD + PlaylistFile);
        if (UseFoobar) and (FileExists(FoobarPath + '\foobar2000.exe')) then
          ShellExecute(Handle, nil, PChar('"' + FoobarPath + '\foobar2000.exe"'), PChar('"' + RootD + PlaylistFile + '"'), nil, SW_SHOW)
        else
          ShellExecute(Handle, 'open', PChar(RootD + PlaylistFile), nil, nil, SW_SHOW);
      except
       	Dialog(GetText(157) + ': ' + RootD + PlaylistFile, GetText(51), GetText(54), '', '', 1, 2);
      end
    else Dialog(ErrorMsg, GetText(51), GetText(54), '', '', 1, 2);
		TempList.Clear;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.Enqueue1Click(Sender: TObject);
var
	SelectedNode: TTreeNode;
  ErrorMsg: string;
begin
	SelectedNode := GetSelectedNode;
	if SelectedNode <> nil then
  begin
  	ShowWaitWindow(GetText(155));
    SetWaitWindowText(GetText(156) + '...');
    TempList.Sorted := false;
  	ErrorMsg := frmMain.CreatePlayList(SelectedNode, TempList);
    CloseWaitWindow;

    if ErrorMsg = '' then
     	try
       	TempList.Items.SaveToFile(RootD + PlaylistFile);
        if (UseFoobar) and (FileExists(FoobarPath + '\foobar2000.exe')) then
          ShellExecute(Handle, nil, PChar('"' + FoobarPath + '\foobar2000.exe"'), PChar('/add "' + RootD + PlaylistFile + '"'), nil, SW_SHOW)
        else
          ShellExecute(Handle, 'enqueue', PChar(RootD + PlaylistFile), nil, nil, SW_SHOW);
      except
       	Dialog(GetText(157) + ': ' + RootD + PlaylistFile, GetText(51), GetText(54), '', '', 1, 2);
      end
    else Dialog(ErrorMsg, GetText(51), GetText(54), '', '', 1, 2);
		TempList.Clear;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.Playlist1Click(Sender: TObject);
var
	SelectedNode: TTreeNode;
	FileName, ErrorMsg: string;
  Index: integer;
begin
	SelectedNode := GetSelectedNode;

	if SelectedNode <> nil then
	begin
		FileName := ExtractName(SelectedNode.Text);
		Delete(FileName, 1, LastDelimiter('\', FileName));

		SaveDialog1.Title := GetText(154);
		SaveDialog1.DefaultExt := PlaylistExt1;
		SaveDialog1.Filter := GetText(162) + ' (*.' + PlaylistExt1 + ', *.' + PlaylistExt2 + ')|*.' + PlaylistExt1 + ';*.' + PlaylistExt2;

		SaveDialog1.InitialDir := PlayListSaveDir;
    if frmMain.ListBox4.Items.Count > 1 then FileName := '';
		SaveDialog1.FileName := FileName;
		if SaveDialog1.Execute then
		begin
			PlayListSaveDir := ExtractFilePath(SaveDialog1.FileName);

      Repaint;
	  	ShowWaitWindow(GetText(155));
  	  SetWaitWindowText(GetText(156) + '...');
    	TempList.Sorted := false;
	  	ErrorMsg := frmMain.CreatePlayList(SelectedNode, TempList);

	    if ErrorMsg = '' then
      	try
          for Index := 0 to TempList.Items.Count - 1 do
	          if Pos(LowerCase(PlayListSaveDir), LowerCase(TempList.Items.Strings[Index])) = 1 then
  	        begin
    	      	FileName := TempList.Items.Strings[Index];
              Delete(FileName, 1, Length(PlayListSaveDir));
              TempList.Items.Strings[Index] := FileName;
      	    end;

        	TempList.Items.SaveToFile(SaveDialog1.FileName);
          CloseWaitWindow;
        except
        	CloseWaitWindow;
        	Dialog(GetText(157) + ': ' + SaveDialog1.FileName, GetText(51), GetText(54), '', '', 1, 2);
        end
  	  else
      begin
      	CloseWaitWindow;
      	Dialog(ErrorMsg, GetText(51), GetText(54), '', '', 1, 2);
      end;
			TempList.Clear;
		end;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmTagResults.OpenDirClick(Sender: TObject);
var
	SelectedNode: TTreeNode;
  SelectedItemPath: String;
begin
  SelectedNode := GetSelectedNode;

  if SelectedNode <> nil then
  begin
    if SelectedNode.HasChildren then
      SelectedItemPath := GetSelectedPath(SelectedNode)
    else
      SelectedItemPath := ExtractFilePath(GetSelectedPath(SelectedNode));

    if DirectoryExists(SelectedItemPath) then
      ShellExecute(Handle, 'open', PChar(SelectedItemPath), nil, nil, SW_SHOW)
    else
      Dialog(GetText(158) + ': ' + #13 + #10 + SelectedItemPath, GetText(51), GetText(54), '', '', 1, 2);
  end;
end;

{ --------------------------------------------------------------------------- }

end.
