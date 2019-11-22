unit About;

interface

uses
	ShellAPI, Global, Windows, Messages, SysUtils, Classes, Graphics,
	Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
	TfrmAbout = class(TForm)
		Button1: TButton;
		Panel1: TPanel;
		Label1: TLabel;
		Label2: TLabel;
		Label3: TLabel;
		Label4: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label5: TLabel;
    Image6: TImage;
    Label6: TLabel;
    Label7: TLabel;
    mmFuturama1: TMemo;
    mmFuturama2: TMemo;
		procedure Button1Click(Sender: TObject);
		procedure FormCreate(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
	private
		{ Private declarations }
	end;

procedure ShowAbout;

implementation

{$R *.DFM}

// -----------------------------------------------------------------------------

procedure ShowAbout;
begin
	with TfrmAbout.Create(Application) do
		try ShowModal;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.Button1Click(Sender: TObject);
begin
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
	Caption := GetText(39);
	Button1.Caption := GetText(54);

	Label1.Caption := AppTitle;
	Label2.Caption := 'Version ' + AVersion + ',  ' + ADate;
	Label3.Caption := AppCopyright;
	Label4.Caption := EMail;
	Label5.Caption := Homepage;
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.Label5Click(Sender: TObject);
begin
	ShellExecute(Handle, 'open', PChar(Homepage), nil, nil, SW_SHOW);
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.Label4Click(Sender: TObject);
var
	Command: string;
begin
	Command := 'mailto:' + EMail + '?subject=' + AppTitleShort + ' '
  	+ AVersion + ' (' + GetText(0) + ')';
	ShellExecute(Handle, 'open', PChar(Command), nil, nil, SW_SHOW);
end;

// -----------------------------------------------------------------------------

procedure TfrmAbout.Image2DblClick(Sender: TObject);
var
  Quote : String;
  RandomLine, RandomMemo : Integer;
begin
Randomize;
RandomLine := Random(748);
RandomMemo := Random(2);

if RandomMemo = 1 then
begin
  // finds the start of a quote
  while (Trim(mmFuturama1.Lines[RandomLine]) <> '')  do
  begin
    Inc(RandomLine);
  end;
  Quote := 'Pearls of wisdom from Futurama:';
  // reads a quote to the end indicated by an empty line
  repeat
    Quote := Quote + #13 + #10 + mmFuturama1.Lines[RandomLine];
    Inc(RandomLine);
  until (Trim(mmFuturama1.Lines[RandomLine]) = '');
  MessageDlg(Quote, mtInformation, [mbOk], 0);
end
else
begin
  // finds the start of a quote
  while (Trim(mmFuturama2.Lines[RandomLine]) <> '')  do
  begin
    Inc(RandomLine);
  end;
  Quote := 'Pearls of wisdom from Futurama:';
  // reads a quote to the end indicated by an empty line
  repeat
    Quote := Quote + #13 + #10 + mmFuturama2.Lines[RandomLine];
    Inc(RandomLine);
  until (Trim(mmFuturama2.Lines[RandomLine]) = '');
  MessageDlg(Quote, mtInformation, [mbOk], 0);
end;
end;

// -----------------------------------------------------------------------------

end.
