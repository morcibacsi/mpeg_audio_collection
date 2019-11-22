unit WaitWindow;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmWaitWindow = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	WaitWindow1: TfrmWaitWindow;

procedure ShowWaitWindow(Title: string);
procedure CloseWaitWindow;
procedure SetWaitWindowText(Text: string);

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

procedure ShowWaitWindow(Title: string);
begin
	WaitWindow1 := TfrmWaitWindow.Create(Application);
	WaitWindow1.Caption := Title;
	WaitWindow1.Show;
	WaitWindow1.Repaint;
end;

{ --------------------------------------------------------------------------- }

procedure CloseWaitWindow;
begin
	WaitWindow1.Close;
	WaitWindow1.Release;
end;

{ --------------------------------------------------------------------------- }

procedure SetWaitWindowText(Text: string);
begin
	WaitWindow1.Label1.Caption := WrapText(Text, #13#10, [' ', ';', ':', '.', '-', '!', '\', ')', ']', '}', '?', '_', '+', '*'], 25);
	WaitWindow1.Repaint;
	Sleep(200);
end;

{ --------------------------------------------------------------------------- }

end.
