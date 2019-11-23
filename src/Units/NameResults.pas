unit NameResults;

interface

uses
	Global, WaitWindow, ProgressWindow, SysUtils, MessageDialog, Windows,
	Classes, Forms, ImgList, Controls, StdCtrls, ComCtrls, ExtCtrls, Graphics,
  Dialogs, Menus, ShellAPI;

type
	TfrmNameResults = class(TForm)
		Panel1: TPanel;
    Button6: TButton;
		ListView1: TListView;
		Image1: TImage;
		ImageList1: TImageList;
    Button4: TButton;
    SaveDialog1: TSaveDialog;
    Button5: TButton;
    StatusBar1: TStatusBar;
    pmnSearch: TPopupMenu;
    Play1: TMenuItem;
    Enqueue1: TMenuItem;
    Playlist1: TMenuItem;
    N4: TMenuItem;
    Information1: TMenuItem;
    OpenDir: TMenuItem;
		procedure Button6Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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

function ShowNameResults(SPath: string; GD, HT: boolean): TTreeNode;

implementation

uses Main;

{$R *.DFM}

{ --------------------------------------------------------------------------- }

function ShowNameResults(SPath: string; GD, HT: boolean): TTreeNode;
var
	Index, BitRate: longint;
	ListItem: TListItem;
	Path, ItemText: string;
	Item, ParentNode: TTreeNode;
  FileData: DataArray;
begin
	with TfrmNameResults.Create(Application) do
		try
		begin
    	SourcePath := SPath;
      ListView1.GridLines := GD;
      ListView1.RowSelect := ListView1.GridLines;
      ListView1.HotTrack := HT;
      FindItem := nil;

      Tag := 0;
			Caption := GetText(140) + ': ' + GetText(120) + ' (' + LastNameText[1] + '): ' + IntToStr(TempList.Items.Count);
			//Button6.Caption := GetText(93);
		//Button4.Caption := GetText(91);
      //Button5.Caption := GetText(15);
			ListView2.Column[0].Caption := GetText(41);
		ListView2.Column[1].Caption := GetText(104);
		ListView2.Column[2].Caption := GetText(171);
		ListView2.Column[3].Caption := GetText(172);
		ListView2.Column[4].Caption := GetText(131);

			ShowProgressWindow(GetText(141));

			for Index := 0 to TempList.Items.Count - 1 do
			begin
				if (Index mod 100) = 0 then
        	SetProgressValue(Round(Index / TempList.Items.Count * 100));

        Item := TTreeNode(TempList.Items.Objects[Index]);

				ListItem := ListView2.Items.Add;
    		ListItem.Data := Item;

        ItemText := ExtractName(Item.Text);
        if not Item.HasChildren then
        begin
        	if (not FileExtensions) and (Pos('.', ItemText) > 0) then ItemText := Copy(ItemText, 1, LastDelimiter('.', ItemText) - 1);
        	ListItem.ImageIndex := 1;
				end;
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

		    FileData := ExtractData(Item.Text);
    		ListItem.SubItems.Add(FloatToStrF(FileData[1] / 1024, ffFixed, 14, 2) + ' ' + GetText(62));
		    if Item.HasChildren then ListItem.SubItems.Add(DurationToStr(FileData[2]))
    		else ListItem.SubItems.Add(DurationToShortStr(Abs(FileData[2])));

		    if FileData[2] <> 0 then BitRate := Trunc(FileData[1] * 8 * 1.024 / Abs(FileData[2]))
				else BitRate := 0;
				if Item.HasChildren then
					ItemText := GetText(65) + ' ' + FormatFloat('000', BitRate) + ' ' + GetText(67)
				else
	 				if FileData[2] < 0 then
      			ItemText := FormatFloat('000', BitRate) + ' ' + GetText(67) + ' ' + GetText(66)
					else
					begin
						BitRate := AlignedBitRate(BitRate, FileData[3], FileData[4], FileData[5], FileData[6]);
			      ItemText := FormatFloat('000', BitRate) + ' ' + GetText(67) + ' ' + GetText(148);
	 				end;
        ListItem.SubItems.Add(ItemText);
			end;

			ListView2.Selected := ListView2.Items[0];
			ListView2.ItemFocused := ListView2.Selected;

		  CloseProgressWindow;

      //ShowModal;
      Result := FindItem;
		end;
		finally Release;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmNameResults.Button6Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmNameResults.ListView1DblClick(Sender: TObject);
begin
	if ListView1.Selected <> nil then
  begin
  	FindItem := ListView1.Selected.Data;
	  Close;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmNameResults.Button4Click(Sender: TObject);
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

function TfrmNameResults.SaveFoundItemsOK(FName: string): boolean;
var
	RFile: TextFile;
	Index: longint;
  ListItem: TListItem;
begin
	try
  	FileSetAttr(FName, 0);
  	AssignFile(RFile, FName);
		Rewrite(RFile);
    Writeln(RFile, GetText(140) + ': ' + GetText(120));
    Writeln(RFile, '');
    Writeln(RFile, GetText(179) + ': ' + LastNameText[1]);
    if NameCase then Writeln(RFile, GetText(127) + ': ' + GetText(55))
    else Writeln(RFile, GetText(127) + ': ' + GetText(56));
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

procedure TfrmNameResults.Button5Click(Sender: TObject);
begin
	TempList.Tag := 1;
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmNameResults.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_RETURN then ListView1DblClick(Self);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmNameResults.FormResize(Sender: TObject);
begin
	Panel1.Width := ClientWidth - Button6.Width - Panel1.Left * 3 + 2;
  ListView1.Width := Panel1.Width - ListView1.Left * 2;
	Button6.Left := ClientWidth - Panel1.Left - Button6.Width + 1;
  Button4.Left := Button6.Left;
  Button5.Left := Button6.Left;
  Image1.Left := Button6.Left + (Button6.Width - Image1.Width) div 2;

  Panel1.Height := ClientHeight - Panel1.Top * 2;
  ListView1.Height := Panel1.Height - Panel1.Left - ListView1.Top;
  Button6.Top := ClientHeight - Button6.Height - Panel1.Top;
  Button4.Top := ClientHeight - (Button4.Height + Panel1.Top) * 3 + 2;
  Button5.Top := ClientHeight - (Button5.Height + Panel1.Top) * 2 + 1;
  Image1.Top := (Button4.Top + Panel1.Top - Image1.Height) div 2;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmNameResults.ListView1ColumnClick(Sender: TObject; Column: TListColumn);
var
	Value: integer;
begin
	Value := Abs(Tag) - 1;
  Tag := Column.Index + 1;
  if ListView1.Columns[Column.Index].ImageIndex = 2 then Tag := -Tag;

  if Value >= 0 then ListView1.Columns[Value].ImageIndex := -1;
  ListView1.AlphaSort;

  if Tag < 0 then ListView1.Columns[Column.Index].ImageIndex := 3
  else ListView1.Columns[Column.Index].ImageIndex := 2;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmNameResults.ListView1Compare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
var
  VData1, VData2: DataArray;
begin
  VData1 := ExtractData(TTreeNode(Item1.Data).Text);
  VData2 := ExtractData(TTreeNode(Item2.Data).Text);
  Compare := 0;

	case Abs(Tag) of
  	1: Compare := AnsiCompareText(Item1.Caption,Item2.Caption);
    2: Compare := AnsiCompareText(Item1.SubItems.Strings[0],Item2.SubItems.Strings[0]);
    3: if VData1[1] <> VData2[1] then
    	if VData1[1] > VData2[1] then Compare := 1 else Compare := -1;
    4: if Abs(VData1[2]) <> Abs(VData2[2]) then
    	if Abs(VData1[2]) > Abs(VData2[2]) then Compare := 1 else Compare := -1;
    5: if (VData1[1] / Abs(VData1[2])) <> (VData2[1] / Abs(VData2[2])) then
    	if (VData1[1] / Abs(VData1[2])) > (VData2[1] / Abs(VData2[2])) then Compare := 1 else Compare := -1;
	end;

  if Tag < 0 then Compare := -Compare;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmNameResults.FormCreate(Sender: TObject);
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

procedure TfrmNameResults.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SearchTop := Top;
	SearchLeft := Left;
	SearchHeight := Height;
	SearchWidth := Width;
end;

{ --------------------------------------------------------------------------- }

function TfrmNameResults.GetSelectedNode: TTreeNode;
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

procedure TfrmNameResults.pmnSearchPopup(Sender: TObject);
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

procedure TfrmNameResults.Play1Click(Sender: TObject);
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

procedure TfrmNameResults.Enqueue1Click(Sender: TObject);
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

procedure TfrmNameResults.Playlist1Click(Sender: TObject);
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

procedure TfrmNameResults.OpenDirClick(Sender: TObject);
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
