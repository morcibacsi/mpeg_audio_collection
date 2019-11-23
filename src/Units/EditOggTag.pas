unit EditOggTag;

interface

uses
  ComCtrls, SysUtils, Windows, Forms,
  Controls, StdCtrls, ExtCtrls, Classes,
  Main, Global, OggVorbis, Math;

function Str2Size( s: String ): Int64;
function Size2Str( a: Int64 ): String;

type
  TFormEditOggTag = class(TForm)
    lePath: TLabeledEdit;
    gbStandTags: TGroupBox;
    leArtist: TLabeledEdit;
    leTitle: TLabeledEdit;
    leAlbum: TLabeledEdit;
    leTrack: TLabeledEdit;
    leDate: TLabeledEdit;
    cbGenre: TComboBox;
    lbGenre: TLabel;
    gbInfo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lbComment: TLabel;
    Memo: TMemo;
    btUpdate: TButton;
    btClose: TButton;
    procedure btCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
    procedure leArtistChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearAll;
    procedure SetCaptions;
  end;

var
  FormEditOggTag: TFormEditOggTag;
  Data: TOggVorbis;
  NeedUpd: Boolean;
  SelectedNode: TTreeNode;

implementation


{$R *.dfm}

function Size2Str( a: Int64 ): String;
var s: String;
begin
  s := IntToStr( a );
  if Copy( s, Length( s ) - 3, 1 ) <> ',' then
    Insert( ',', s, Length( s ) - 2 );
  if Copy( s, Length( s ) - 7, 1 ) <> ',' then
    if ( Length( s ) > 7 ) then
      Insert( ',', s, Length( s ) - 6 );
  if ( Length( s ) > 11 ) and ( Copy( s, Length( s ) - 11, 1 ) <> ',' ) then
    Insert( ',', s, Length( s ) - 10 );
  Size2Str := s;
end;
{ --------------------------------------------------------------------------- }
function Str2Size( s: String ): Int64;
var j: Int64;
    i: Integer;
begin
  i := 1;
  repeat
    if not ( s[i] in ['0'..'9'] ) then
      Delete( s, i, 1 )
    else
  inc(i);
  until i = Length( s )+1;
  j := StrToInt64( s );
  Str2Size := j;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.ClearAll;
begin
{ Clear all captions }
  leTrack.Text   := '';
  leArtist.Text  := '';
  leTitle.Text   := '';
  leAlbum.Text   := '';
  leDate.Text    := '';
  Memo.Text := '';
  cbGenre.Text   := '';
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.btCloseClick(Sender: TObject);
begin
  FormActivate(Sender);
  FormEditOggTag.Close;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.FormCreate(Sender: TObject);
begin
  NeedUpd := False;
  ClearAll;
  SetCaptions;
 //  leTrack.Enabled    := False;
 // leArtist.Enabled   := False;
 // leTitle.Enabled    := False;
 // leAlbum.Enabled    := False;
 // leDate.Enabled     := False;
 // Memo.Enabled       := False;
 // cbGenre.Enabled    := False;
 // lbComment.Enabled  := False;
 // lbGenre.Enabled    := False;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.FormActivate(Sender: TObject);
var m,sec:Integer;
    sDuration:String;
begin
  ClearAll;
  lePath.Text := GetFilePath(frmMain.GetSelectedNode);//GetFilePath(SelectedNode);
  Data := TOggVorbis.Create;
  Data.ReadFromFile( lePath.Text );

  m := Floor(Data.Duration/60);
  sec := Floor(Data.Duration) - m * 60;
  sDuration := Format('%u',[m]) + ':' + Format('%02.2u',[sec]);

  Label1.Caption := GetText(172) +': '+ sduration;
  Label2.Caption := GetText(082) +': '+ IntToStr(Data.BitRate) + ' kbps';
  Label3.Caption := GetText(171) +': '+ Size2Str(Data.FileSize) + ' Bytes';
  Label4.Caption := GetText(313) +': ' + IntToStr(Data.BitRateNominal) + ' kbps';
  Label5.Caption := GetText(133) +': '+ Data.ChannelMode;
  Label6.Caption := GetText(132) +': '+ IntToStr(Data.SampleRate) + ' Hz';
  Label7.Caption := GetText(314) +': ';
  Label8.Caption := GetText(315) +': ';
  Label9.Caption := GetText(316) +': ';
  Label10.Caption := Data.Vendor;

  if Data.Valid then begin
    leArtist.Text := Data.Artist;
    leTitle.Text  := Data.Title;
    leAlbum.Text  := Data.Album;
    leTrack.Text  := IntToStr(Data.Track);
    leDate.Text   := Data.Date;
    cbGenre.Text  := Data.Genre;
    Memo.Text     := Data.Comment;
  end;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.btUpdateClick(Sender: TObject);
var SelectedIndex,Value, Code: Integer;
    FileTag: TagArray;
    IText,Artist,Title, Comment,Genre,Album,Track,Year:String;
    Item:TListItem;
    Node:TTreeNode;

begin
  if (leArtist.Text='') and
     (leTitle.Text= '') and
     (leAlbum.Text='') and
     (leTrack.Text='') and
     (leDate.Text='') and
     (cbGenre.Text='') and
     (Memo.Text='') then
    Data.ClearTag(lePath.Text);

  if NeedUpd then begin
    Data.Artist := leArtist.Text;
    Data.Title  := leTitle.Text;
    Data.Album  := leAlbum.Text;
    Val(leTrack.Text, Value, Code);
    if (Code = 0) and (Value > 0) then
      Data.Track := Value
    else
      Data.Track := 0;
    Data.Date   := leDate.Text;
    Data.Comment := Memo.Text;
    Data.Genre := cbGenre.Text;
    //    Data.SaveTag(lePath.Text);
    if (not FileExists(lePath.Text)) or (not Data.SaveTag(lePath.Text)) then
      MessageBox(Handle, PChar(GetText(307) + lePath.Text), PChar('Error'), $00000010);

  if (frmMain.ListView1.Selected <> nil) then begin
    Item := frmMain.ListView1.Selected;
    Node := Item.Data;
    IText := Node.Text;

    Artist := leArtist.Text;
    Title  := leTitle.Text;
    Album  := leAlbum.Text;
    Track  := leTrack.Text;
    Year   := leDate.Text;
    Comment := Memo.Text;
    Genre := cbGenre.Text;

    Delete(IText,Pos(#$15,IText)+1,(Pos(#$16,IText)-1-Pos(#$15,IText)));  //Title  
    Delete(IText,Pos(#$16,IText)+1,(Pos(#$17,IText)-1-Pos(#$16,IText)));  //Artist 
    Delete(IText,Pos(#$17,IText)+1,(Pos(#$18,IText)-1-Pos(#$17,IText)));  //Album  
    Delete(IText,Pos(#$18,IText)+1,(Pos(#$19,IText)-1-Pos(#$18,IText)));  //Track  
    Delete(IText,Pos(#$19,IText)+1,(Pos(#$1A,IText)-1-Pos(#$19,IText)));  //Year   
    Delete(IText,Pos(#$1A,IText)+1,(Pos(#$1B,IText)-1-Pos(#$1A,IText)));  //Comment
    Delete(IText,Pos(#$1B,IText)+1,(Pos(#$1C,IText)-1-Pos(#$1B,IText)));  //Genre  
    {Insert new tags to list in frmMain}
    Insert(Title,IText,Pos(#$15,IText)+1);
    Insert(Artist,IText,Pos(#$16,IText)+1);
    Insert(Album,IText,Pos(#$17,IText)+1);
    if Track <> '0' then
      Insert(Track,IText,Pos(#$18,IText)+1);
    Insert(Year,IText,Pos(#$19,IText)+1);
    Insert(Comment,IText,Pos(#$1A,IText)+1);
    Insert(Genre,IText,Pos(#$1B,IText)+1);

    Node.Text := IText;
    Item.Data := Node;
    frmMain.ListView1.Selected.Data := Item.Data;
    DataIsChanged := True;

    SelectedIndex := frmMain.ListView1.Selected.Index;
    frmMain.UpdateControls;
    frmMain.UpdateListView;
    frmMain.ListView1.Items[SelectedIndex].Selected := true;
    frmMain.ListView1.Items[SelectedIndex].Focused := True;
    frmMain.ListView1.Items[SelectedIndex].MakeVisible(False);
  end;
  end;
  Close;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.leArtistChange(Sender: TObject);
begin
  NeedUpd := True;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    FormEditOggTag.btCloseClick(Sender);
  if Key=VK_RETURN then
    FormEditOggTag.btUpdateClick(Sender);
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.SetCaptions;
begin
  leArtist.EditLabel.Caption := GetText(043);
  leTitle.EditLabel.Caption := GetText(042);
  leAlbum.EditLabel.Caption := GetText(044);
  leTrack.EditLabel.Caption := GetText(045);
  leDate.EditLabel.Caption := GetText(174);
  lePath.EditLabel.Caption := GetText(217);
  lbGenre.Caption := GetText(239);
  lbComment.Caption := GetText(047);
  btClose.Caption := GetText(093);
  btUpdate.Caption := GetText(299);
  Label1.Caption := GetText(172)+': ';
  Label2.Caption := GetText(082)+': ';
  Label3.Caption := GetText(171)+': ';
  Label4.Caption := GetText(313)+': ';
  Label5.Caption := GetText(133)+': ';
  Label6.Caption := GetText(132)+': ';
  Label7.Caption := GetText(314)+': ';
  Label8.Caption := GetText(315)+': ';
  Label9.Caption := GetText(316)+': ';
end;
{ --------------------------------------------------------------------------- }
end.
