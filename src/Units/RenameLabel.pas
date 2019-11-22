unit RenameLabel;

interface

uses
	Global, Windows, Messages, SysUtils, Classes, Graphics, Controls,
	Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TfrmRenameLabel = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Image1: TImage;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    VLabel: string;
  end;

function RenameVolumeLabel(VT, VL: string): string;

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

function RenameVolumeLabel(VT, VL: string): string;
begin
	Result := VL;
	with TfrmRenameLabel.Create(Application) do
		try
    	VLabel := VL;

      Caption := GetText(28);
      Button1.Caption := GetText(54);
      Button2.Caption := GetText(57);
      Label1.Caption := GetText(103) + ': ' + VT;
      Edit1.Text := VL;

    	ShowModal;
      Result := VLabel;
		finally
    	Release;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmRenameLabel.Button2Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmRenameLabel.Button1Click(Sender: TObject);
begin
	VLabel := Edit1.Text;
  Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmRenameLabel.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_RETURN then Button1Click(Self);
end;

{ --------------------------------------------------------------------------- }

end.
