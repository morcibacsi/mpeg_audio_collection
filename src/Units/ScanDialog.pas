unit ScanDialog;

interface

uses
	ComCtrls, MessageDialog, Windows, SysUtils,
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
    imgMagn: TImage;
    tmrScanAnimate: TTimer;
		procedure Button1Click(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure FormCreate(Sender: TObject);
		procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tmrScanAnimateTimer(Sender: TObject);
	private
		SourcePath: string;
		UpdatedNode: TTreeNode;
		UpdateInfo: boolean;
		SourceScanOK: boolean;
		SourceScanThread: TScanThread;
		procedure ThreadDone(Sender: TObject);
	end;

function ScanOK(SPath: string; UNode: TTreeNode; UInfo: boolean): boolean;

const
  FILE_DEVICE_MASS_STORAGE = $2D;
  METHOD_BUFFERED          = 0;
  FILE_ANY_ACCESS          = 0;
  FILE_READ_ACCESS         = 1;
  FILE_WRITE_ACCESS        = 2;

  IOCTL_STORAGE_EJECT_MEDIA = (FILE_DEVICE_MASS_STORAGE shl 16) OR
                              (FILE_READ_ACCESS shl 14)         OR
                              ($202 shl 2)                      OR
                              (METHOD_BUFFERED);

  IOCTL_STORAGE_LOAD_MEDIA  = (FILE_DEVICE_MASS_STORAGE shl 16) OR
                              (FILE_READ_ACCESS shl 14)         OR
                              ($203 shl 2)                      OR
                              (METHOD_BUFFERED);

var
  XPrevious, YPrevious : Integer;

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

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

{ --------------------------------------------------------------------------- }

procedure TfrmScanDialog.Button1Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmScanDialog.FormClose(Sender: TObject; var Action: TCloseAction);
var
  cd: THandle;
  ret: DWORD;
begin
	if SourceScanThread <> nil then
	begin
		SourceScanThread.Terminate;
		SourceScanThread.WaitFor;
		SourceScanThread.Free;
	end;

  if (SourceScanOK = True) and (EjectCD) then
  begin
    cd := CreateFile(PChar('\\.\' + UpperCase(SourcePath[1]) + ':'), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
    if CD <> INVALID_HANDLE_VALUE then
    begin
      // eject
      if not DeviceIoControl(cd,IOCTL_STORAGE_EJECT_MEDIA, nil, 0, nil, 0, ret, nil) then { report error };
      // load
      //if not DeviceIoControl(cd,IOCTL_STORAGE_LOAD_MEDIA, nil, 0, nil, 0, ret, nil) then { report error };
      CloseHandle(cd);
    end;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmScanDialog.FormCreate(Sender: TObject);
begin
	Caption := GetText(102);
	Label3.Hint := GetText(103) + ': ';
	Label1.Hint := GetText(104) + ': ';
	Label2.Hint := GetText(105) + ': ';
	Button1.Caption := GetText(57);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmScanDialog.ThreadDone(Sender: TObject);
begin
	Caption := GetText(79);
	Button1.Enabled := false;
  tmrScanAnimate.Enabled := False;
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmScanDialog.FormShow(Sender: TObject);
begin
  tmrScanAnimate.Enabled := True;
	SourceScanThread := TScanThread.Create(SourcePath, UpdatedNode, UpdateInfo, Label1, Label2, Label3);
	SourceScanThread.OnTerminate := ThreadDone;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmScanDialog.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if Button1.Enabled = True then
  SourceScanOK := false;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmScanDialog.tmrScanAnimateTimer(Sender: TObject);
begin

if (XPrevious < imgMagn.Left) and (imgMagn.Left < 440) then
begin
  imgMagn.Left := imgMagn.Left + 1;
  XPrevious := imgMagn.Left - 1;
end
else if (XPrevious > imgMagn.Left) and (imgMagn.Left > 410) then
begin
  imgMagn.Left := imgMagn.Left - 1;
  XPrevious := imgMagn.Left + 1;
end
else if (imgMagn.Left = 440) then
begin
  imgMagn.Left := imgMagn.Left - 1;
  XPrevious := imgMagn.Left + 1;
end
else if (imgMagn.Left = 410) then
begin
  imgMagn.Left := imgMagn.Left + 1;
  XPrevious := imgMagn.Left - 1;
end;

if (YPrevious < imgMagn.Top) and (imgMagn.Top < 70) and ((imgMagn.Left div 4) * 4 = imgMagn.Left) then
begin
  imgMagn.Top := imgMagn.Top + 1;
  YPrevious := imgMagn.Top - 1;
end
else if (YPrevious > imgMagn.Top) and (imgMagn.Top > 40) and ((imgMagn.Left div 4) * 4 = imgMagn.Left) then
begin
  imgMagn.Top := imgMagn.Top - 1;
  YPrevious := imgMagn.Top + 1;
end
else if (imgMagn.Top = 70) then
begin
  imgMagn.Top := imgMagn.Top - 1;
  YPrevious := imgMagn.Top + 1;
end
else if (imgMagn.Top = 40) then
begin
  imgMagn.Top := imgMagn.Top + 1;
  YPrevious := imgMagn.Top - 1;
end;

end;

{ --------------------------------------------------------------------------- }

end.
