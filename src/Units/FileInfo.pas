unit FileInfo;

interface

uses
	Global,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, StdCtrls, ExtCtrls;

type
  TfrmFileInfo = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Panel2: TPanel;
    Image12: TImage;
    Label1: TLabel;
    Image13: TImage;
    Label2: TLabel;
    Image14: TImage;
    Label3: TLabel;
    Image15: TImage;
    Label4: TLabel;
    Image16: TImage;
    Label5: TLabel;
    Image17: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  	SelectedNode: TTreeNode;
  end;

procedure ShowFileInfo(const Node: TTreeNode);

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

procedure ShowFileInfo(const Node: TTreeNode);
begin
	with TfrmFileInfo.Create(Application) do
		try
    	SelectedNode := Node;
    	ShowModal;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.Button1Click(Sender: TObject);
begin
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.FormCreate(Sender: TObject);
begin
	Caption := GetText(52);
	Button1.Caption := GetText(54);

	Label1.Caption := GetText(42);
	Label2.Caption := GetText(43);
	Label3.Caption := GetText(44);
	Label4.Caption := GetText(45);
	Label5.Caption := GetText(46);
	Label6.Caption := GetText(47);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.FormShow(Sender: TObject);
var
	NTag: TagArray;
begin
	Caption := Caption + ':  ' + ExtractName(SelectedNode.Text);
  NTag := ExtractTag(SelectedNode.Text);

  Label7.Caption := NTag[1];
  Label8.Caption := NTag[2];
  Label9.Caption := NTag[3];
  Label10.Caption := NTag[4];
  Label11.Caption := NTag[5];
  Label12.Caption := NTag[6];

  if Label7.Caption = '' then Label7.Enabled := false;
  if Label8.Caption = '' then Label8.Enabled := false;
  if Label9.Caption = '' then Label9.Enabled := false;
  if Label10.Caption = '' then Label10.Enabled := false;
  if Label11.Caption = '' then Label11.Enabled := false;
  if Label12.Caption = '' then Label12.Enabled := false;

  if Label7.Caption = '' then Label7.Caption := GetText(138);
  if Label8.Caption = '' then Label8.Caption := GetText(138);
  if Label9.Caption = '' then Label9.Caption := GetText(138);
  if Label10.Caption = '' then Label10.Caption := GetText(138);
  if Label11.Caption = '' then Label11.Caption := GetText(138);
  if Label12.Caption = '' then Label12.Caption := GetText(138);
end;

// -----------------------------------------------------------------------------

end.
