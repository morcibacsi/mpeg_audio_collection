unit RemTags;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Global;

type
  TfrmRemTags = class(TForm)
    rbRemAll: TRadioButton;
    rbRemSpec: TRadioButton;
    gbTagFormats: TGroupBox;
    cbID3v1: TCheckBox;
    cbID3v2: TCheckBox;
    cbAPE: TCheckBox;
    bOK: TButton;
    bCancel: TButton;
    procedure rbRemSpecClick(Sender: TObject);
    procedure rbRemAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRemTags: TfrmRemTags;

implementation

{$R *.dfm}

procedure TfrmRemTags.rbRemSpecClick(Sender: TObject);
begin
 cbID3v1.Enabled:=true;
 cbID3v2.Enabled:=true;
 cbAPE.Enabled:=true;
end;

procedure TfrmRemTags.rbRemAllClick(Sender: TObject);
begin
 cbID3v1.Enabled:=false;
 cbID3v2.Enabled:=false;
 cbAPE.Enabled:=false;
end;

procedure TfrmRemTags.FormCreate(Sender: TObject);
begin
        rbRemAll.Caption := GetText(261);
        rbRemSpec.Caption  := GetText(262);
        gbTagFormats.Caption  := GetText(263);
        cbID3v1.Caption  := GetText(264);
        cbID3v2.Caption  := GetText(265);
        cbAPE.Caption  := GetText(266);
        bOK.Caption := GetText(54);
        bCancel.Caption := GetText(57);
        Caption := GetText(254);
end;

end.
