unit Statistic;

interface

uses
	WaitWindow,
	Global, Windows, Messages, SysUtils, Classes, Graphics, Controls,
	Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TfrmStatistic = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Image8: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowStatistic;

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

procedure ShowStatistic;
begin
	with TfrmStatistic.Create(Application) do
		try ShowModal;
		finally Release;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmStatistic.Button1Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmStatistic.FormCreate(Sender: TObject);
var
	CollectionData: DataArray;
  Index, Count: integer;
begin
	Caption := GetText(7);
	Button1.Caption := GetText(54);
	Label1.Caption := GetText(80);
	Label2.Caption := GetText(81);
	Label3.Caption := GetText(82);
	Label4.Caption := GetText(83);
	Label5.Caption := GetText(84);
	Label6.Caption := GetText(85);
  Label13.Caption := GetText(173);

  if Tree.Items.Count > 5000 then
  begin
  	ShowWaitWindow(GetText(102));
		SetWaitWindowText(GetText(79) + '...');
  end;

	Count := 0;
	for Index := 0 to Tree.Items.Count - 1 do
  	if (Tree.Items[Index].Level > 1) and (Tree.Items[Index].HasChildren) then Inc(Count);

  if Tree.Items.Count > 5000 then CloseWaitWindow;

	CollectionData := ExtractData(Tree.Items[0].Text);

	Label7.Caption := FloatToStr(Round(CollectionData[1] / 1048576 * 100) / 100) + ' ' + GetText(86);
	Label8.Caption := FloatToStr(Round(Abs(CollectionData[2]) / 360) / 10) + ' ' + GetText(87);

	if CollectionData[2] > 0 then Label9.Caption := IntToStr(Round(CollectionData[1] * 8 * 1.024 / CollectionData[2])) + ' ' + GetText(67)
	else Label9.Caption := '0 ' + GetText(67);

	Label10.Caption := IntToStr(CollectionData[3]) + ' ' + GetText(88);
  Label14.Caption := IntToStr(Count) + ' ' + GetText(68);
	Label11.Caption := IntToStr(CollectionData[4]) + ' ' + GetText(69);
	Label12.Caption := FormatDateTime('dd/mm/yyyy', CollectionData[5]);
end;

{ --------------------------------------------------------------------------- }

end.
