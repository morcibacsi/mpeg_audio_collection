unit ReportProcess;

interface

uses
	ReportThread,
	ComCtrls, Global, StdCtrls, Controls, ExtCtrls, Graphics, Classes, Forms;

type
	TfrmReportProcess = class(TForm)
		Button1: TButton;
		Panel1: TPanel;
		Label1: TLabel;
		Image1: TImage;
		Image2: TImage;
		Image4: TImage;
		Label2: TLabel;
		ProgressBar1: TProgressBar;
		procedure Button1Click(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure FormCreate(Sender: TObject);
		procedure FormShow(Sender: TObject);
	private
		ReportOK: boolean;
		RThread: TReportThread;
		procedure ThreadDone(Sender: TObject);
	end;

function ReportProcessOK: boolean;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

function ReportProcessOK: boolean;
begin
	with TfrmReportProcess.Create(Application) do
		try
		begin
			ReportOK := true;
			ShowModal;
			Result := ReportOK;
		end;
		finally
			Release;
		end;
end;

// -----------------------------------------------------------------------------

procedure TfrmReportProcess.Button1Click(Sender: TObject);
begin
	ReportOK := false;
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmReportProcess.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	if RThread <> nil then
	begin
		RThread.Terminate;
		RThread.WaitFor;
		RThread.Free;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmReportProcess.FormCreate(Sender: TObject);
begin
	Caption := GetText(141);
	Label1.Hint := GetText(180) + ': ';
	Label2.Hint := GetText(166) + ': ';
	Button1.Caption := GetText(57);
end;

// -----------------------------------------------------------------------------

procedure TfrmReportProcess.ThreadDone(Sender: TObject);
begin
	Caption := GetText(79);
	Button1.Enabled := false;
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmReportProcess.FormShow(Sender: TObject);
begin
	RThread := TReportThread.Create(Label1, Label2, ProgressBar1);
	RThread.OnTerminate := ThreadDone;
end;

// -----------------------------------------------------------------------------

end.
