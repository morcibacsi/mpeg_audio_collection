unit RepTagDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Global;

type
  TfrmReplTag = class(TForm)
    Memo1: TMemo;
    bOK: TButton;
    bCancel: TButton;
    procedure bOKClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReplaceFile: string = 'tag.rep';
  frmReplTag: TfrmReplTag;

implementation

{$R *.dfm}

procedure TfrmReplTag.bOKClick(Sender: TObject);
begin
 Memo1.Lines.SaveToFile(RootD + ReplaceFile);
 Close;
end;

procedure TfrmReplTag.bCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmReplTag.FormCreate(Sender: TObject);
begin
  Caption := GetText(256);
  bOK.Caption := GetText(54);
  bCancel.Caption := GetText(57);
  if FileExists(RootD + ReplaceFile) then Memo1.Lines.LoadFromFile(RootD + ReplaceFile);
end;

end.
