unit ProgressWindow;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls;

type
  TfrmProgressWindow = class(TForm)
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	ProgressWindow1: TfrmProgressWindow;

procedure ShowProgressWindow(Title: string);
procedure CloseProgressWindow;
procedure SetProgressValue(Value: integer);

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

procedure ShowProgressWindow(Title: string);
begin
	ProgressWindow1 := TfrmProgressWindow.Create(Application);
	ProgressWindow1.Caption := Title;
  ProgressWindow1.ProgressBar1.Position := 0;
	ProgressWindow1.Show;
	ProgressWindow1.Repaint;
end;

{ --------------------------------------------------------------------------- }

procedure CloseProgressWindow;
begin
	ProgressWindow1.Close;
	ProgressWindow1.Release;
end;

{ --------------------------------------------------------------------------- }

procedure SetProgressValue(Value: integer);
begin
	ProgressWindow1.ProgressBar1.Position := Value;
	ProgressWindow1.Repaint;
end;

{ --------------------------------------------------------------------------- }

end.
