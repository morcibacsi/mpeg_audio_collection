unit Stretch;

interface

uses
	Global,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmStretch = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image3: TImage;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Image4: TImage;
    Label5: TLabel;
    Image5: TImage;
    Label6: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    UpDown4: TUpDown;
    UpDown3: TUpDown;
    Label8: TLabel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image6: TImage;
    CheckBox4: TCheckBox;
    Image7: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure SetStretch;

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

procedure SetStretch;
begin
	with TfrmStretch.Create(Application) do
		try ShowModal;
		finally Release;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmStretch.FormCreate(Sender: TObject);
begin
	Caption := GetText(126);
  Button1.Caption := GetText(54);
  Button2.Caption := GetText(57);
  GroupBox1.Caption := GetText(205);
  CheckBox1.Caption := GetText(206);
  CheckBox2.Caption := GetText(207);
  CheckBox3.Caption := GetText(208);
  CheckBox4.Caption := GetText(80);
  GroupBox2.Caption := GetText(196);
  Label5.Caption := GetText(197);
  Label6.Caption := GetText(198);

  CheckBox1.Checked := Numeration;
  CheckBox2.Checked := AddDate;
  CheckBox3.Checked := CustomLabel;
  CheckBox4.Checked := AddSize;
  Edit1.Text := LabelText;
  Edit1.Enabled := CheckBox3.Checked;
  UpDown4.Position := IStretch[1];
  UpDown3.Position := IStretch[2];
end;

{ --------------------------------------------------------------------------- }

procedure TfrmStretch.Button2Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmStretch.Button1Click(Sender: TObject);
begin
  Numeration := CheckBox1.Checked;
  AddDate := CheckBox2.Checked;
  CustomLabel := CheckBox3.Checked;
  LabelText := Edit1.Text;
  AddSize := CheckBox4.Checked;

  IStretch[1] := UpDown4.Position;
  IStretch[2] := UpDown3.Position;
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmStretch.CheckBox3Click(Sender: TObject);
begin
	Edit1.Enabled := CheckBox3.Checked;
end;

{ --------------------------------------------------------------------------- }

end.
