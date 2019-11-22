unit FileInfo;

interface

uses
	Global,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, StdCtrls, ExtCtrls, Buttons;

type
  TfrmFileInfo = class(TForm)
    Button1: TButton;
    imgFileInfo: TImage;
    Panel2: TPanel;
    imgTitle: TImage;
    lblTitle: TLabel;
    imgArtist: TImage;
    lblArtist: TLabel;
    imgAlbum: TImage;
    lblAlbum: TLabel;
    imgTrack: TImage;
    lblTrack: TLabel;
    imgYear: TImage;
    lblYear: TLabel;
    imgComment: TImage;
    lblComment: TLabel;
    imgFileType: TImage;
    imgMpc: TImage;
    imgMp3: TImage;
    imgVorbis: TImage;
    imgFlac: TImage;
    imgMonkey: TImage;
    imgWav: TImage;
    imgWma: TImage;
    edtTitle: TEdit;
    edtArtist: TEdit;
    edtAlbum: TEdit;
    edtTrack: TEdit;
    edtYear: TEdit;
    edtComment: TEdit;
    btnCopy: TButton;
    MemoClipboard: TMemo;
    MemoInfo: TMemo;
    imgVqf: TImage;
    imgOfr: TImage;
    imgAac: TImage;
    imgCue: TImage;
    imgPls: TImage;
    imgText: TImage;
    imgImage: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure edtCommentMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtAlbumMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtArtistMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtTitleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtTrackMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtYearMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtCommentEnter(Sender: TObject);
    procedure edtCommentExit(Sender: TObject);
    procedure edtAlbumEnter(Sender: TObject);
    procedure edtAlbumExit(Sender: TObject);
    procedure edtArtistEnter(Sender: TObject);
    procedure edtArtistExit(Sender: TObject);
    procedure edtTitleEnter(Sender: TObject);
    procedure edtTitleExit(Sender: TObject);
    procedure edtTrackEnter(Sender: TObject);
    procedure edtTrackExit(Sender: TObject);
    procedure edtYearEnter(Sender: TObject);
    procedure edtYearExit(Sender: TObject);
  private
  	SelectedNode: TTreeNode;
  end;

procedure ShowFileInfo(const Node: TTreeNode);

implementation

uses
  Main;

{$R *.DFM}

// -----------------------------------------------------------------------------

procedure ShowFileInfo(const Node: TTreeNode);
begin
	with TfrmFileInfo.Create(Application) do
		try
    	SelectedNode := Node;
    	ShowModal;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.Button1Click(Sender: TObject);
begin
	Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.FormCreate(Sender: TObject);
begin
	Caption := GetText(52);
	Button1.Caption := GetText(54);

	lblTitle.Caption := GetText(42);
	lblArtist.Caption := GetText(43);
	lblAlbum.Caption := GetText(44);
	lblTrack.Caption := GetText(45);
	lblYear.Caption := GetText(46);
	lblComment.Caption := GetText(47);

  btnCopy.Caption := GetText(237);
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.FormShow(Sender: TObject);
var
	NTag: TagArray;
begin
	Caption := Caption + ':  ' + ExtractName(SelectedNode.Text);

  MemoClipboard.Lines.Append(ExtractName(SelectedNode.Text) + #13 + #10);

  MemoInfo.Lines.Append(frmMain.ListView1.Selected.SubItems[5]);
  MemoInfo.Lines.Append(frmMain.ListView1.Selected.SubItems[2]);
  MemoInfo.Lines.Append(frmMain.ListView1.Selected.SubItems[3]);
  MemoInfo.Lines.Append(frmMain.ListView1.Selected.SubItems[4]);
  MemoInfo.Lines.Append(frmMain.ListView1.Selected.SubItems[1]);
  MemoInfo.Lines.Append(frmMain.ListView1.Selected.SubItems[0]);

  NTag := ExtractTag(SelectedNode.Text);

  edtTitle.Text := NTag[1];
  edtArtist.Text := NTag[2];
  edtAlbum.Text := NTag[3];
  edtTrack.Text := NTag[4];
  edtYear.Text := NTag[5];
  edtComment.Text := NTag[6];

  if edtTitle.Text = '' then edtTitle.Enabled := false else
    MemoClipboard.Lines.Append(lblTitle.Caption + ': ' + edtTitle.Text);
  if edtArtist.Text = '' then edtArtist.Enabled := false else
    MemoClipboard.Lines.Append(lblArtist.Caption + ': ' + edtArtist.Text);
  if edtAlbum.Text = '' then edtAlbum.Enabled := false else
    MemoClipboard.Lines.Append(lblAlbum.Caption + ': ' + edtAlbum.Text);
  if edtTrack.Text = '' then edtTrack.Enabled := false else
    MemoClipboard.Lines.Append(lblTrack.Caption + ': ' + edtTrack.Text);
  if edtYear.Text = '' then edtYear.Enabled := false else
    MemoClipboard.Lines.Append(lblYear.Caption + ': ' + edtYear.Text);
  if edtComment.Text = '' then edtComment.Enabled := false else
    MemoClipboard.Lines.Append(lblComment.Caption + ': ' + edtComment.Text);

  if edtTitle.Text = '' then edtTitle.Text := GetText(138);
  if edtArtist.Text = '' then edtArtist.Text := GetText(138);
  if edtAlbum.Text = '' then edtAlbum.Text := GetText(138);
  if edtTrack.Text = '' then edtTrack.Text := GetText(138);
  if edtYear.Text = '' then edtYear.Text := GetText(138);
  if edtComment.Text = '' then edtComment.Text := GetText(138);

  //MessageDlg('Info', mtInformation, [mbOk], 0);
  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), MPPFileMask) > 0 then
    imgFileType.Picture := imgMpc.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), FileMask) > 0 then
    imgFileType.Picture := imgMp3.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), MonkeyMask) > 0 then
    imgFileType.Picture := imgMonkey.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), FlacMask) > 0 then
    imgFileType.Picture := imgFlac.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), OfrMask) > 0 then
    imgFileType.Picture := imgOfr.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), '.' + OGGExt) > 0 then
    imgFileType.Picture := imgVorbis.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), '.' + WMAExt) > 0 then
    imgFileType.Picture := imgWma.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), '.' + WAVExt) > 0 then
    imgFileType.Picture := imgWav.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), '.' + VQFExt) > 0 then
    imgFileType.Picture := imgVqf.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), AacMask) > 0 then
    imgFileType.Picture := imgAac.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), CueFile) > 0 then
    imgFileType.Picture := imgCue.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), PlaylistMask) > 0 then
    imgFileType.Picture := imgPls.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), TextMask) > 0 then
    imgFileType.Picture := imgText.Picture;

  if Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), ImageMask) > 0 then
    imgFileType.Picture := imgImage.Picture;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.btnCopyClick(Sender: TObject);
begin
  MemoClipboard.SelectAll;
  MemoClipboard.CopyToClipboard;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.Panel2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  //Tag = 0  <- nothing
  //Tag = 1  <- hovered
  //Tag = 2  <- selected
  if (Panel2.Tag = 1) then
  begin
    if edtTitle.Tag <> 2 then
      edtTitle.Color := clBtnFace;
    if edtArtist.Tag <> 2 then
      edtArtist.Color := clBtnFace;
    if edtAlbum.Tag <> 2 then
      edtAlbum.Color := clBtnFace;
    if edtTrack.Tag <> 2 then
      edtTrack.Color := clBtnFace;
    if edtYear.Tag <> 2 then
      edtYear.Color := clBtnFace;
    if edtComment.Tag <> 2 then
      edtComment.Color := clBtnFace;

    Panel2.Tag := 0;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtCommentMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if edtComment.Color = clBtnFace then
  begin
    edtComment.Color := clSkyBlue;
    Panel2.Tag := 1;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtAlbumMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if edtAlbum.Color = clBtnFace then
  begin
    edtAlbum.Color := clSkyBlue;
    Panel2.Tag := 1;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtArtistMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if edtArtist.Color = clBtnFace then
  begin
    edtArtist.Color := clSkyBlue;
    Panel2.Tag := 1;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtTitleMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if edtTitle.Color = clBtnFace then
  begin
    edtTitle.Color := clSkyBlue;
    Panel2.Tag := 1;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtTrackMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if edtTrack.Color = clBtnFace then
  begin
    edtTrack.Color := clSkyBlue;
    Panel2.Tag := 1;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtYearMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if edtYear.Color = clBtnFace then
  begin
    edtYear.Color := clSkyBlue;
    Panel2.Tag := 1;
  end;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtCommentEnter(Sender: TObject);
begin
  edtComment.Color := clCream;
  edtComment.Tag := 2;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtCommentExit(Sender: TObject);
begin
  edtComment.Color := clBtnFace;
  edtComment.Tag := 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtAlbumEnter(Sender: TObject);
begin
  edtAlbum.Color := clCream;
  edtAlbum.Tag := 2;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtAlbumExit(Sender: TObject);
begin
  edtAlbum.Color := clBtnFace;
  edtAlbum.Tag := 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtArtistEnter(Sender: TObject);
begin
  edtArtist.Color := clCream;
  edtArtist.Tag := 2;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtArtistExit(Sender: TObject);
begin
  edtArtist.Color := clBtnFace;
  edtArtist.Tag := 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtTitleEnter(Sender: TObject);
begin
  edtTitle.Color := clCream;
  edtTitle.Tag := 2;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtTitleExit(Sender: TObject);
begin
  edtTitle.Color := clBtnFace;
  edtTitle.Tag := 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtTrackEnter(Sender: TObject);
begin
  edtTrack.Color := clCream;
  edtTrack.Tag := 2;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtTrackExit(Sender: TObject);
begin
  edtTrack.Color := clBtnFace;
  edtTrack.Tag := 0;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtYearEnter(Sender: TObject);
begin
  edtYear.Color := clCream;
  edtYear.Tag := 2;
end;

// -----------------------------------------------------------------------------

procedure TfrmFileInfo.edtYearExit(Sender: TObject);
begin
  edtYear.Color := clBtnFace;
  edtYear.Tag := 0;
end;

// -----------------------------------------------------------------------------

end.
