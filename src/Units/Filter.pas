unit Filter;

interface

uses
  Global,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ImgList;

type
  TfrmFilter = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image3: TImage;
    Panel1: TPanel;
    ListView2: TListView;
    ImageList1: TImageList;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ListView2GetImageIndex(Sender: TObject; Item: TListItem);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure ListView2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    OriginalFilter: TListView;
  public
    { Public declarations }
  end;

procedure SetFilter(Filter: TListView);

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

procedure SetFilter(Filter: TListView);
begin
	with TfrmFilter.Create(Application) do
		try
    	OriginalFilter := Filter;
    	ShowModal;
		finally
    	Release;
		end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFilter.FormCreate(Sender: TObject);
begin
	Caption := GetText(229);
  Button1.Caption := GetText(54);
  Button2.Caption := GetText(57);
  Button3.Caption := GetText(230);
  Button4.Caption := GetText(92);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFilter.Button2Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFilter.Button1Click(Sender: TObject);
var
	Index: integer;
	Item: TListItem;
begin
	OriginalFilter.Items.Clear;

	for Index := 0 to ListView2.Items.Count - 1 do
  begin
  	Item := OriginalFilter.Items.Add;
    Item.Caption := ListView2.Items[Index].Caption;
    Item.SubItems.Add(ListView2.Items[Index].SubItems.Strings[0]);
  end;

	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFilter.FormShow(Sender: TObject);
var
	Index: integer;
  Item: TListItem;
begin
  for Index := 0 to OriginalFilter.Items.Count - 1 do
  begin
  	Item := ListView2.Items.Add;
    Item.Caption := OriginalFilter.Items[Index].Caption;
    Item.SubItems.Add(OriginalFilter.Items[Index].SubItems.Strings[0]);
    Item.SubItemImages[0] := 1;
  end;

  if OriginalFilter.Items.Count > 0 then ListView2.Items[0].Focused := true;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFilter.Button3Click(Sender: TObject);
var
  Item: TListItem;
begin
	if ListView2.Items.Count > 100 then exit;
	Item := ListView2.Items.Add;
  Item.SubItems.Add('');
	Item.SubItemImages[0] := 1;
  ListView2.ItemFocused := Item;
  ListView2.Selected := Item;

  Button3.Enabled := ListView2.Items.Count < 100;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFilter.Button4Click(Sender: TObject);
begin
	if ListView2.Selected <> nil then ListView2.Selected.Delete;
  Button3.Enabled := ListView2.Items.Count < 100;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFilter.ListView2GetImageIndex(Sender: TObject; Item: TListItem);
begin
  Button4.Enabled := ListView2.Selected <> nil;

  if ListView2.Selected <> nil then
  begin
		Edit1.Text := ListView2.Selected.Caption;
    Edit1.Enabled := true;
		Edit2.Text := ListView2.Selected.SubItems.Strings[0];
    Edit2.Enabled := true;
  end
  else
  begin
  	Edit1.Text := '';
    Edit1.Enabled := false;
    Edit2.Text := '';
    Edit2.Enabled := false;
  end;

  if Edit1.Enabled then Edit1.Color := ListView2.Color
  else Edit1.Color := Color;
  if Edit2.Enabled then Edit2.Color := ListView2.Color
  else Edit2.Color := Color;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFilter.Edit1Change(Sender: TObject);
begin
  if ListView2.Selected <> nil then
  	ListView2.Selected.Caption := Edit1.Text;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFilter.Edit2Change(Sender: TObject);
begin
	if ListView2.Selected <> nil then
  	ListView2.Selected.SubItems.Strings[0] := Edit2.Text;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFilter.ListView2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then Button4Click(Self);
end;

{ --------------------------------------------------------------------------- }

end.
