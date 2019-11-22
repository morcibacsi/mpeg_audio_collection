unit AutoNumber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Global;

type
  TfrmAutoNumber = class(TForm)
    lStartNumber: TLabel;
    spBeginNumber: TSpinEdit;
    eSkip: TEdit;
    lSkip: TLabel;
    bOK: TButton;
    bCancel: TButton;
    cbTestmode: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function GetAutoNumberOptions(var TheBegin:Integer; var  Skip:String; var Testmode:Boolean):boolean;

var
  frmAutoNumber: TfrmAutoNumber;

implementation

{$R *.dfm}
  function GetAutoNumberOptions(var TheBegin:Integer; var  Skip:String; var Testmode:Boolean):boolean;
  begin
   Result:=false;
  	with TfrmAutoNumber.Create(Application) do
     begin
  	  	try if ShowModal=mrOK then Result:=true;
            TheBegin:=spBeginNumber.Value;
            Skip:=eSkip.Text;
            if cbTestmode.Checked then Testmode:=true else Testmode:=false;
  	  	finally Release;
  	    end;
     end;
  end;

procedure TfrmAutoNumber.FormCreate(Sender: TObject);
begin
        bOK.Caption := GetText(54);
        bCancel.Caption := GetText(57);
        lStartNumber.Caption := GetText(273);
        lSkip.Caption := GetText(274);
        cbTestmode.Caption := GetText(275);
        Caption := GetText(253);
end;

end.
