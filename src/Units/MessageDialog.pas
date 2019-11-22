unit MessageDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, StdCtrls;

type
  TfrmMessageDialog = class(TForm)
    Panel1: TPanel;
		Button1: TButton;
		Button2: TButton;
		Button3: TButton;
		Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
	private
	{}
	end;

var
	frmMessageDialog: TfrmMessageDialog;

function Dialog(Msg, Title, Btn1, Btn2, Btn3: string; Init, Img: byte): byte;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

function Dialog(Msg, Title, Btn1, Btn2, Btn3: string; Init, Img: byte): byte;
begin
	with TfrmMessageDialog.Create(Application) do
		try
		begin
			Tag := 0;

      Caption := Title;

			Label1.Width := 480;
			Label1.Height := 200;
			Label1.Caption := WrapText(Msg, #13#10, [' ', ';', ':', '.', '-', '!', '\', ')', ']', '}', '?', '_', '+', '*'], 70);
			Label1.AutoSize := true;

			Button1.Caption := Btn1;
			Button2.Caption := Btn2;
			Button3.Caption := Btn3;

			case Img of
				1: Image1.Visible := true;
				2: Image2.Visible := true;
				3: Image3.Visible := true;
				4: Image4.Visible := true
				else Label1.Left := Label1.Top;
			end;

			if Image1.Height < Label1.Height then
			begin
				Image1.Top := Label1.Top + Trunc((Label1.Height - Image1.Height) / 2);
				Image2.Top := Label1.Top + Trunc((Label1.Height - Image1.Height) / 2);
				Image3.Top := Label1.Top + Trunc((Label1.Height - Image1.Height) / 2);
				Image4.Top := Label1.Top + Trunc((Label1.Height - Image1.Height) / 2);

				Panel1.Height := Label1.Height + Label1.Top * 2;
				Button1.Top := Panel1.Height + Panel1.Top * 2;
				Button2.Top := Panel1.Height + Panel1.Top * 2;
				Button3.Top := Panel1.Height + Panel1.Top * 2;
				ClientHeight := Panel1.Height + Button1.Height + Panel1.Top * 3;
			end
			else
			begin
				Label1.Top := Image1.Top + Trunc((Image1.Height - Label1.Height) / 2);
			end;

			if Panel1.Width < Label1.Left + Label1.Width + Label1.Top then
			begin
				Panel1.Width := Label1.Left + Label1.Width + Label1.Top;
				ClientWidth := Panel1.Width + Panel1.Left * 2;
			end
			else
				Label1.Left := Trunc((Panel1.Width + Label1.Left - Label1.Width - Label1.Top) / 2);

			if Btn3 = '' then
			begin
				Button1.Tag := 2;
				Button3.Visible := false;

				if Btn2 = '' then
				begin
					Button1.Tag := 1;
					Button2.Visible := false;
				end;
			end
			else
				Button1.Tag := 3;

			Button1.Left := Trunc((Width - (Button1.Width * Button1.Tag + Panel1.Left * (Button1.Tag - 1))) / 2);
			Button2.Left := Button1.Left + Button1.Width + Panel1.Left;
			Button3.Left := Button1.Left + (Button1.Width + Panel1.Left) * 2;

			case Init of
				1: ActiveControl := Button1;
				2: if Button2.Visible then ActiveControl := Button2;
				3: if Button3.Visible then ActiveControl := Button3;
			end;

			ShowModal;
		end;
		finally
		begin
			Result := Tag;
			Release;
		end;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmMessageDialog.Button1Click(Sender: TObject);
begin
	Tag := 1;
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmMessageDialog.Button2Click(Sender: TObject);
begin
	Tag := 2;
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmMessageDialog.Button3Click(Sender: TObject);
begin
	Tag := 3;
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmMessageDialog.Button1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if Key = VK_ESCAPE then Close;
end;

// -----------------------------------------------------------------------------

end.
