unit ScanDialog;

interface

uses
	ComCtrls, MessageDialog,
	ScanThread, Global, StdCtrls, Controls, ExtCtrls, Graphics, Classes, Forms;

type
	TfrmScanDialog = class(TForm)
		Button1: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Image1: TImage;
		Image2: TImage;
    Image3: TImage;
		Image4: TImage;
		procedure Button1Click(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure FormCreate(Sender: TObject);
		procedure FormShow(Sender: TObject);
	private
		SourcePath: string;
		UpdatedNode: TTreeNode;
		UpdateInfo: boolean;
		SourceScanOK: boolean;
		SourceScanThread: TScanThread;
		procedure ThreadDone(Sender: TObject);
	end;

function ScanOK(SPath: string; UNode: TTreeNode; UInfo: boolean): boolean;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

function ScanOK(SPath: string; UNode: TTreeNode; UInfo: boolean): boolean;
begin
	DirList.Tag := 0;

	with TfrmScanDialog.Create(Application) do
		try
		begin
			SourcePath := SPath;
			UpdatedNode := UNode;
			UpdateInfo := UInfo;
			SourceScanOK := true;

			ShowModal;

			Result := SourceScanOK;
		end;
		finally
			Release;
	end;

  if (Result) and (DirList.Tag < 0) then
  begin
		DirList.Tag := 0;
  	Dialog(GetText(201), GetText(53), GetText(54), '', '', 1, 4);
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmScanDialog.Button1Click(Sender: TObject);
begin
	SourceScanOK := false;
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmScanDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	if SourceScanThread <> nil then
	begin
		SourceScanThread.Terminate;
		SourceScanThread.WaitFor;
		SourceScanThread.Free;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmScanDialog.FormCreate(Sender: TObject);
begin
	Caption := GetText(102);
	Label3.Hint := GetText(103) + ': ';
	Label1.Hint := GetText(104) + ': ';
	Label2.Hint := GetText(105) + ': ';
	Button1.Caption := GetText(57);
end;

// -----------------------------------------------------------------------------

procedure TfrmScanDialog.ThreadDone(Sender: TObject);
begin
	Caption := GetText(79);
	Button1.Enabled := false;
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmScanDialog.FormShow(Sender: TObject);
begin
	SourceScanThread := TScanThread.Create(SourcePath, UpdatedNode, UpdateInfo, Label1, Label2, Label3);
	SourceScanThread.OnTerminate := ThreadDone;
end;

// -----------------------------------------------------------------------------

end.
