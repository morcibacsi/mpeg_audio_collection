unit NameResults;

interface

uses
	Global, WaitWindow, ProgressWindow, SysUtils, MessageDialog, Windows,
	Classes, Forms, ImgList, Controls, StdCtrls, ComCtrls, ExtCtrls, Graphics,
  Dialogs;

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
	private
  	FindItem: TTreeNode;
    SourcePath: string;
    function SaveFoundItemsOK(FName: string): boolean;
	end;

function ShowNameResults(SPath: string; GD, HT: boolean): TTreeNode;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

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
			Button6.Caption := GetText(93);
		  Button4.Caption := GetText(91);
      Button5.Caption := GetText(15);
			ListView1.Column[0].Caption := GetText(41);
		  ListView1.Column[1].Caption := GetText(104);
		  ListView1.Column[2].Caption := GetText(171);
		  ListView1.Column[3].Caption := GetText(172);
		  ListView1.Column[4].Caption := GetText(131);

			ShowProgressWindow(GetText(141));

			for Index := 0 to TempList.Items.Count - 1 do
			begin
				if (Index mod 100) = 0 then
        	SetProgressValue(Round(Index / TempList.Items.Count * 100));

        Item := TTreeNode(TempList.Items.Objects[Index]);

				ListItem := ListView1.Items.Add;
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
					ItemText := FormatFloat('000', BitRate) + ' ' + GetText(67) + ' ' + GetText(65)
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

			ListView1.Selected := ListView1.Items[0];
			ListView1.ItemFocused := ListView1.Selected;

		  CloseProgressWindow;

      ShowModal;
      Result := FindItem;
		end;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmNameResults.Button6Click(Sender: TObject);
begin
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmNameResults.ListView1DblClick(Sender: TObject);
begin
	if ListView1.Selected <> nil then
  begin
  	FindItem := ListView1.Selected.Data;
	  Close;
  end;
end;

// -----------------------------------------------------------------------------

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

// -----------------------------------------------------------------------------

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

// -----------------------------------------------------------------------------

procedure TfrmNameResults.Button5Click(Sender: TObject);
begin
	TempList.Tag := 1;
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmNameResults.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_RETURN then ListView1DblClick(Self);
end;

// -----------------------------------------------------------------------------

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

// -----------------------------------------------------------------------------

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

// -----------------------------------------------------------------------------

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

// -----------------------------------------------------------------------------

end.
