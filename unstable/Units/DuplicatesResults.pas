unit DuplicatesResults;

interface

uses
	Global, WaitWindow, ProgressWindow, SysUtils, MessageDialog, Windows,
	Classes, Forms, ImgList, Controls, StdCtrls, ComCtrls, ExtCtrls, Graphics,
  Dialogs;

type
	TfrmDuplicatesResults = class(TForm)
		Panel1: TPanel;
		Button1: TButton;
		ListView1: TListView;
		Image1: TImage;
		ImageList1: TImageList;
    ComboBox1: TComboBox;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    Button3: TButton;
    StatusBar1: TStatusBar;
		procedure Button1Click(Sender: TObject);
		procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
	private
  	FindItem: TTreeNode;
    SourcePath: string;
		procedure OnChange;
    function SaveFoundItemsOK(FName: string): boolean;
	end;

function ShowDuplicatesResults(Path: string; GD, HT: boolean): TTreeNode;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

function ShowDuplicatesResults(Path: string; GD, HT: boolean): TTreeNode;
var
	Index: longint;
	ItemData: DataArray;
  ItemTag: TagArray;
	Duplicate, NameText, PropertyText, TagText, DCaption: string;
	Item: TTreeNode;
begin
	with TfrmDuplicatesResults.Create(Application) do
		try
		begin
    	SourcePath := Path;
      ListView1.GridLines := GD;
      ListView1.RowSelect := ListView1.GridLines;
      ListView1.HotTrack := HT;

			ShowProgressWindow(GetText(141));

			Duplicate := '';
			for Index := 0 to TempList.Items.Count - 1 do
      begin
				if (Index mod 100) = 0 then
	    		SetProgressValue(Round(Index / TempList.Items.Count * 100));

				if CompareText(Duplicate, TempList.Items.Strings[Index]) <> 0 then
				begin
					Duplicate := TempList.Items.Strings[Index];
					Item := TTreeNode(TempList.Items.Objects[Index]);

					if CompareName then NameText := ', ' + ExtractName(Item.Text)
					else NameText := '';

					if CompareTag then
					begin
						ItemTag := ExtractTag(Item.Text);
						TagText := ', ' + ItemTag[2] + ' - ' + ItemTag[1];
					end
          else TagText := '';

					if CompareProperty then
					begin
						ItemData := ExtractData(Item.Text);
						PropertyText := ',  ' + FloatToStrF(ItemData[1] / 1024, ffFixed, 15, 3)
          		+ ' ' + GetText(62) + ',  ' + DurationToStr(Abs(ItemData[2]))
              + ' ' + GetText(64);
					end
          else PropertyText := '';

          DCaption := NameText + TagText + PropertyText;
          Delete(DCaption, 1, 2);
					ComboBox1.Items.Add(DCaption);

					ComboBox1.Items.Objects[ComboBox1.Items.Count - 1] := TObject(Index);
				end;
      end;

			ComboBox1.ItemIndex := 0;
			OnChange;

			CloseProgressWindow;

      FindItem := nil;
      ShowModal;
      Result := FindItem;
		end;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDuplicatesResults.Button1Click(Sender: TObject);
begin
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmDuplicatesResults.FormCreate(Sender: TObject);
begin
	Tag := 0;
	Caption := GetText(140) + ': ' + GetText(20) + ': ' + IntToStr(TempList.Items.Count);
	Button1.Caption := GetText(93);
  Button2.Caption := GetText(91);
  Button3.Caption := GetText(15);
	ListView1.Column[0].Caption := GetText(41);
  ListView1.Column[1].Caption := GetText(104);
  ListView1.Column[2].Caption := GetText(171);
  ListView1.Column[3].Caption := GetText(172);
  ListView1.Column[4].Caption := GetText(131);
end;

// -----------------------------------------------------------------------------

procedure TfrmDuplicatesResults.OnChange;
var
	Index, FirstLine, BitRate: longint;
	ListItem: TListItem;
	Duplicate, Path, ItemText: string;
	Item, ParentNode: TTreeNode;
  FileData: DataArray;
begin
	ComboBox1.Hint := ComboBox1.Items.Strings[ComboBox1.ItemIndex];
	FirstLine := integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
	Duplicate := TempList.Items.Strings[FirstLine];
	Index := FirstLine;

	ListView1.Items.Clear;
	repeat
	begin
		Item := TTreeNode(TempList.Items.Objects[Index]);
		ListItem := ListView1.Items.Insert(0);
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
    if (Path <> '') and (Path[Length(Path)] = '\') then Delete(Path, Length(Path), 1);
		ListItem.SubItems.Add(Path);

    FileData := ExtractData(Item.Text);
    ListItem.SubItems.Add(FloatToStrF(FileData[1] / 1024, ffFixed, 15, 3) + ' ' + GetText(62));
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

		Inc(Index);
	end;
	until (Index >= TempList.Items.Count) or (CompareText(Duplicate, TempList.Items.Strings[Index]) <> 0);

  ListView1.AlphaSort;
	ListView1.Selected := ListView1.Items[0];
	ListView1.ItemFocused := ListView1.Selected;
end;

// -----------------------------------------------------------------------------

procedure TfrmDuplicatesResults.ComboBox1Change(Sender: TObject);
begin
	OnChange;
end;

// -----------------------------------------------------------------------------

procedure TfrmDuplicatesResults.ListView1DblClick(Sender: TObject);
begin
	if ListView1.Selected <> nil then
  begin
  	FindItem := ListView1.Selected.Data;
	  Close;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDuplicatesResults.Button2Click(Sender: TObject);
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

function TfrmDuplicatesResults.SaveFoundItemsOK(FName: string): boolean;
var
	RFile: TextFile;
	Index, Index2, FirstLine: longint;
	Duplicate, Path: string;
	Item, ParentNode: TTreeNode;
begin
	try
  	FileSetAttr(FName, 0);
  	AssignFile(RFile, FName);
		Rewrite(RFile);
    Writeln(RFile, Caption);

    for Index2 := 0 to ComboBox1.Items.Count - 1 do
    begin
			FirstLine := integer(ComboBox1.Items.Objects[Index2]);
			Duplicate := TempList.Items.Strings[FirstLine];
			Index := FirstLine;
      Writeln(RFile, '');
      Writeln(RFile, ComboBox1.Items.Strings[Index2]);

			repeat
			begin
				Item := TTreeNode(TempList.Items.Objects[Index]);

				Path := '';
				ParentNode := Item;
				while (ParentNode.Level > 1) do
				begin
					ParentNode := ParentNode.Parent;
					Path := ExtractName(ParentNode.Text) + '\' + Path;
				end;
		   	if SourcePath <> '' then
		    begin
    			if Pos('\', Path) > 0 then Delete(Path, 1, Pos('\', Path))
		      else Path := '';
    		  Path := Copy(SourcePath, 1, 3) + Path;
		    end;
        if (Length(Path) > 0) and (Path[Length(Path)] = '\') then Delete(Path, Length(Path), 1);

        Writeln(RFile, Path + '\' + ExtractName(Item.Text));

				Inc(Index);
			end;
			until (Index >= TempList.Items.Count) or (CompareText(Duplicate, TempList.Items.Strings[Index]) <> 0);
    end;

    CloseFile(RFile);

    Result := true;
	except
  	Result := false;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmDuplicatesResults.Button3Click(Sender: TObject);
begin
	TempList.Tag := 1;
  Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmDuplicatesResults.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_RETURN then ListView1DblClick(Self);
end;

// -----------------------------------------------------------------------------

procedure TfrmDuplicatesResults.FormResize(Sender: TObject);
begin
	Panel1.Width := ClientWidth - Button1.Width - Panel1.Left * 3 + 2;
  ListView1.Width := Panel1.Width - ListView1.Left * 2;
  ComboBox1.Width := ListView1.Width;
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

// -----------------------------------------------------------------------------

procedure TfrmDuplicatesResults.ListView1ColumnClick(Sender: TObject; Column: TListColumn);
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

procedure TfrmDuplicatesResults.ListView1Compare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
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
