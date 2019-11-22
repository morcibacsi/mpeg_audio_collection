unit SelectVolume;

interface

uses
	Global, MessageDialog,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, ImgList, Menus;

type
  TfrmSelectVolume = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ImageList1: TImageList;
    Image1: TImage;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    StatusBar1: TStatusBar;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
	private
		Selection: integer;
    procedure OnButtonClick(MIndex: integer; AIndex: integer);
	end;

function SelectVolumeAction(GD, HT: boolean): integer;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

function SelectVolumeAction(GD, HT: boolean): integer;
begin
	with TfrmSelectVolume.Create(Application) do
		try
		begin
      ListView1.GridLines := GD;
      ListView1.RowSelect := ListView1.GridLines;
      ListView1.HotTrack := HT;

			Selection := 0;
			ShowModal;
			Result := Selection;
		end;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmSelectVolume.Button2Click(Sender: TObject);
begin
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmSelectVolume.Button1Click(Sender: TObject);
begin
	OnButtonClick(109, 1);
end;

// -----------------------------------------------------------------------------

procedure TfrmSelectVolume.FormCreate(Sender: TObject);
var
	Child: TTreeNode;
	ListItem: TListItem;
	Line: string;
	FileData: DataArray;
begin
	Tag := 0;
	Caption := GetText(106);
	Button1.Caption := GetText(92);
  Button3.Caption := GetText(222);
	Button2.Caption := GetText(93);
	ListView1.Column[0].Caption := GetText(103);
  ListView1.Column[1].Caption := GetText(174);
  ListView1.Column[2].Caption := GetText(171);
  ListView1.Column[3].Caption := GetText(172);
  ListView1.Column[4].Caption := GetText(131);

	if Tree.Items.Count > 1 then Child := Tree.Items[1]
	else Child := nil;

	while Child <> nil do
	begin
		ListItem := ListView1.Items.Add;
		ListItem.Data := Child;
    if Child.OverlayIndex >= 0 then
    begin
    	ListItem.StateIndex := 1;
      ListView1.Tag := 1;
    end;

		ListItem.Caption := TTreeNode(Child.Data).Text;

    FileData := ExtractData(Child.Text);
    ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy', FileData[5]));
    ListItem.SubItems.Add(FloatToStrF(FileData[1] / 1024, ffFixed, 15, 2) + ' ' + GetText(62));
    ListItem.SubItems.Add(DurationToStr(FileData[2]));
		if FileData[2] <= 0 then Line := ''
    else Line := FormatFloat('000', Trunc(FileData[1] * 8 * 1.024 / FileData[2])) + ' ' + GetText(67) + ' ' + GetText(65);
    ListItem.SubItems.Add(Line);

		Child := Child.GetNextSibling;
	end;

  ListView1.AlphaSort;
  if ListView1.Items.Count > 0 then ListView1.ItemFocused := ListView1.Items[0];
  if ListView1.Tag <= 0 then ListView1.StateImages := nil;
end;

// -----------------------------------------------------------------------------

procedure TfrmSelectVolume.ListView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
	Index: integer;
begin
	if (ssCtrl in Shift) and (Key = Ord('A')) then
  	for Index := 0 to ListView1.Items.Count - 1 do
    	ListView1.Items[Index].Selected := true;

	if Key = VK_DELETE then Button1Click(Self);
  if Key = VK_RETURN then ListView1DblClick(Self);
end;

// -----------------------------------------------------------------------------

procedure TfrmSelectVolume.FormResize(Sender: TObject);
begin
	GroupBox1.Width := ClientWidth - Button1.Width - GroupBox1.Left * 3 + 2;
  ListView1.Width := GroupBox1.Width - ListView1.Left * 2;
	Button1.Left := ClientWidth - GroupBox1.Left - Button1.Width + 1;
  Button3.Left := Button1.Left;
  Button2.Left := Button1.Left;
  Image1.Left := Button1.Left + (Button1.Width - Image1.Width) div 2;

  GroupBox1.Height := ClientHeight - GroupBox1.Top * 2;
  ListView1.Height := GroupBox1.Height - GroupBox1.Left - ListView1.Top;
  Button1.Top := ClientHeight - (Button1.Height + GroupBox1.Top) * 3 + 2;
  Button3.Top := ClientHeight - (Button3.Height + GroupBox1.Top) * 2 + 1;
  Button2.Top := ClientHeight - Button2.Height - GroupBox1.Top;
  Image1.Top := (Button1.Top + GroupBox1.Top - Image1.Height) div 2;
end;

// -----------------------------------------------------------------------------

procedure TfrmSelectVolume.ListView1ColumnClick(Sender: TObject; Column: TListColumn);
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

procedure TfrmSelectVolume.ListView1Compare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
var
  VData1, VData2: DataArray;
begin
  VData1 := ExtractData(TTreeNode(Item1.Data).Text);
  VData2 := ExtractData(TTreeNode(Item2.Data).Text);
  Compare := 0;

  case Abs(Tag) of
  	1: Compare := AnsiCompareText(Item1.Caption,Item2.Caption);
    2: if VData1[5] <> VData2[5] then
    	if VData1[5] > VData2[5] then Compare := 1 else Compare := -1;
    3: if VData1[1] <> VData2[1] then
    	if VData1[1] > VData2[1] then Compare := 1 else Compare := -1;
    4: if VData1[2] <> VData2[2] then
    	if VData1[2] > VData2[2] then Compare := 1 else Compare := -1;
    5: if (VData1[1] / VData1[2]) <> (VData2[1] / VData2[2]) then
    	if (VData1[1] / VData1[2]) > (VData2[1] / VData2[2]) then Compare := 1 else Compare := -1;
	end;

  if Tag < 0 then Compare := -Compare;
end;

// -----------------------------------------------------------------------------

procedure TfrmSelectVolume.ListView1DblClick(Sender: TObject);
begin
	if ListView1.Selected <> nil then
  	TTreeNode(TTreeNode(ListView1.Selected.Data).Data).Selected := true;
end;

// -----------------------------------------------------------------------------

procedure TfrmSelectVolume.OnButtonClick(MIndex: integer; AIndex: integer);
var
	Index: integer;
begin
	for Index := 0 to ListView1.Items.Count - 1 do
		if ListView1.Items[Index].Selected then
		begin
			TTreeNode(ListView1.Items[Index].Data).ImageIndex := 1;
			Selection := AIndex;
		end
    else TTreeNode(ListView1.Items[Index].Data).ImageIndex := -1;

	if Selection = AIndex then
		if Dialog(GetText(MIndex), GetText(50), GetText(55), GetText(56), '', 2, 1) = 1 then Close
  	else Selection := 0
  else Dialog(GetText(107), GetText(53), GetText(54), '', '', 2, 4);
end;

// -----------------------------------------------------------------------------

procedure TfrmSelectVolume.Button3Click(Sender: TObject);
begin
	OnButtonClick(223, 2);
end;

// -----------------------------------------------------------------------------

procedure TfrmSelectVolume.ListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
	Index, Count: integer;
begin
  Count := 0;

  for Index := 0 to ListView1.Items.Count - 1 do
  	if ListView1.Items[Index].Selected then Inc(Count);

	Button1.Enabled := Count > 0;
	Button3.Enabled := Count > 1;
end;

// -----------------------------------------------------------------------------

end.
