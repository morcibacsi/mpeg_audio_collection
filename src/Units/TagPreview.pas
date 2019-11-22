unit TagPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Global;

type
  TfrmPreview = class(TForm)
    ListView1: TListView;
    bCancel: TButton;
    bOK: TButton;
    procedure FormCreate(Sender: TObject);
    procedure AddTagEntry(ThisTagArray: TagArray; Filename, TagVersion:String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreview: TfrmPreview;

implementation

{$R *.dfm}

procedure TfrmPreview.AddTagEntry(ThisTagArray: TagArray;
  Filename, TagVersion: String);
  var   Item: TListItem;
        Index: Integer;
begin
    		Item := ListView1.Items.Add;
      	Item.Caption := ExtractFileName(Filename);
        for Index := 1 to 7 do Item.SubItems.Add(ThisTagArray[Index]);
        Item.SubItems.Add(TagVersion);
        Item.SubItems.Add(Filename);
        Item.SubItems.Add('');
        Item.SubItems.Add(Chr(Index));
end;

procedure TfrmPreview.FormCreate(Sender: TObject);
begin
        bOK.Caption := GetText(54);
        bCancel.Caption := GetText(57);
        ListView1.Columns[0].Caption := GetText(105);
        ListView1.Columns[1].Caption := GetText(42);
        ListView1.Columns[2].Caption := GetText(43);
        ListView1.Columns[3].Caption := GetText(44);
        ListView1.Columns[4].Caption := GetText(45);
        ListView1.Columns[5].Caption := GetText(46);
        ListView1.Columns[6].Caption := GetText(47);
        ListView1.Columns[7].Caption := GetText(239);
        ListView1.Columns[8].Caption := GetText(267);
        Caption := GetText(260);
end;

end.
