// mixed using of mpegaudio and pkid3 -  maybe i should use one of them, but this
// was easier

unit EditTag;

interface
uses
  ComCtrls, SysUtils, Windows, Forms,
  Controls, StdCtrls, ExtCtrls, Classes,
  Main, Global, TagEditor, MPEGAudio, pkID3, Registry, Unicode,
  Graphics, Math, Buttons;

function Str2Size( s: String ): Int64;
function Size2Str( a: Int64 ): String;

type
  TFormEditTag = class(TForm)
    gbID1: TGroupBox;
    gbID2: TGroupBox;
    gbInfo: TGroupBox;
    btUpdate: TButton;
    btCancel: TButton;
    btUndo: TButton;
    btCopyTo: TButton;
    btCopyFrom: TButton;
    edPath: TEdit;
    cbID3v1: TCheckBox;
    cbID3v2: TCheckBox;
    leTrack1: TLabeledEdit;
    leArtist1: TLabeledEdit;
    leTitle1: TLabeledEdit;
    leAlbum1: TLabeledEdit;
    leYear1: TLabeledEdit;
    leComment1: TLabeledEdit;
    cbGenre1: TComboBox;
    lbGenre1: TLabel;
    leTrack2: TLabeledEdit;
    leArtist2: TLabeledEdit;
    leTitle2: TLabeledEdit;
    leAlbum2: TLabeledEdit;
    leYear2: TLabeledEdit;
    cbGenre2: TComboBox;
    leComment2: TLabeledEdit;
    lbGenre2: TLabel;
    leComposer: TLabeledEdit;
    leOrigArtist: TLabeledEdit;
    leCopyright: TLabeledEdit;
    leURL: TLabeledEdit;
    leEncodedby: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbLyrics3Tag: TLabel;
    lbArL: TLabel;
    lbTiL: TLabel;
    lbAlL: TLabel;
    pkID31: TpkID3;
    cboxCapitalization: TComboBox;
    cbCapitalization: TCheckBox;
    leReplaceThis: TLabeledEdit;
    leReplaceForThis: TLabeledEdit;
    btReplace: TButton;
    imSwap: TImage;
    procedure btCancelClick(Sender: TObject);
    procedure cbID3v1Click(Sender: TObject);
    procedure cbID3v2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure leArtist1Change(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btUpdateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCopyToClick(Sender: TObject);
    procedure btCopyFromClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btUndoClick(Sender: TObject);
    procedure cbCapitalizationClick(Sender: TObject);
    procedure cboxCapitalizationChange(Sender: TObject);
    procedure btReplaceClick(Sender: TObject);
    procedure imSwapClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearAll1;
    procedure ClearAll2;
    procedure SetCaptions;
    function SetCapital(InputString:WideString;CapitalType:Byte):WideString;
  end;

var
  FormEditTag: TFormEditTag;
  Data: TMPEGAudio;
  NeedUpd: Boolean;
  SelectedNode: TTreeNode;
  TagD1: array [1..7] of String;
  TagD2: array [1..12] of String;
//  TagCap
  TagD1Ex,TagD2Ex: Boolean;

implementation

//uses pkID3;
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
function TFormEditTag.SetCapital(InputString:WideString;CapitalType:Byte):WideString;
var B:Byte;
    TempStr:WideString;
//    Bool:Boolean;
    WideChr:WideChar;
begin
  Result := '';
  case CapitalType of
    0:Result := WideLowerCase(InputString); {lowercase}
    1:Result := WideUpperCase(InputString); {uppercase}
    2:begin                                 {every word's first letter in uppercase}
        if InputString = '' then begin
          Result := InputString;
          Exit;
        end;
        InputString := WideLowerCase(InputString);
        WideChr := WideChar(InputString[1]);
        WideChr := WideUpCase(WideChr);
        Result := Result + WideStringOfChar(WideChr,1);
        for b:=2 to Length(InputString) do begin
          WideChr := WideChar(InputString[b]);
          if (WideChar(InputString[b-1])=' ') or (WideChar(InputString[b-1])='_') or (WideChar(InputString[b-1])='.') or (WideChar(InputString[b-1])='(') or (WideChar(InputString[b-1])='[') or (WideChar(InputString[b-1])='-') then begin
            WideChr := WideChar(InputString[b]);
            WideChr := WideUpCase(WideChr);
          end;
            Result := Result + WideStringOfChar(WideChr,1);
        end;
      end;
    3:begin {first letter in uppercase}
        if InputString = '' then begin
          Result := InputString;
          Exit;
        end;
        InputString := WideLowerCase(InputString);
        WideChr := WideChar(InputString[1]);
//        try
//          InputString[1]:= Char(WideUpperCase(InputString)[1]);
//          except on EAccessViolation do
//        end;
//        Result := InputString;
        WideChr := WideUpCase(WideChr);
        Result := WideStringOfChar(WideChr,1) + Copy(InputString,2,Length(InputString)-1);
      end;
    4:begin {random case}
        if InputString = '' then begin
          Result := InputString;
          Exit;
        end;
      Result := '';
        Randomize;
        for b:=1 to Length(InputString) do begin
          WideChr := WideChar(InputString[b]);
          case Random(2) of
           0:WideChr := WideUpCase(WideChr);
           1:WideChr := WideLoCase(WideChr);
          end;
        Result := Result + WideStringOfChar(WideChr,1)
        end;
      end;
    5:begin {invert case}
        if InputString = '' then begin
          Result := InputString;
          Exit;
        end;
        Result := '';
        TempStr := InputString;
        for b:=1 to Length(InputString) do begin
          WideChr := WideChar(TempStr[b]);
          if WideUpCase(WideChr) = WideChar((InputString[b])) then
            WideChr := WideLoCase(WideChr)
          else
            WideChr := WideUpCase(WideChr);
          Result := Result + WideStringOfChar(WideChr,1);
        end;
      end;
    6:Result := InPutString;
  end;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.SetCaptions;
begin
  leTitle1.EditLabel.Caption := GetText(42);
  leArtist1.EditLabel.Caption := GetText(43);
  leAlbum1.EditLabel.Caption := GetText(44);
  leTrack1.EditLabel.Caption := GetText(45)+' #';
  leYear1.EditLabel.Caption := GetText(46);
  leComment1.EditLabel.Caption := GetText(47);
  lbGenre1.Caption := GetText(239);

  leTitle2.EditLabel.Caption := GetText(42);
  leArtist2.EditLabel.Caption := GetText(43);
  leAlbum2.EditLabel.Caption := GetText(44);
  leTrack2.EditLabel.Caption := GetText(45)+' #';
  leYear2.EditLabel.Caption := GetText(46);
  leComment2.EditLabel.Caption := GetText(47);
  lbGenre2.Caption := GetText(239);

  leComposer.EditLabel.Caption := GetText(295);
  leOrigArtist.EditLabel.Caption := GetText(296);
  leCopyright.EditLabel.Caption := GetText(297);
  leEncodedby.EditLabel.Caption := GetText(298);

  leReplaceThis.EditLabel.Caption := GetText(249);
  btUpdate.Caption := GetText(299);
  btCancel.Caption := GetText(057);
  btUndo.Caption := GetText(300);
  btCopyTo.Caption := GetText(301);
  btCopyFrom.Caption := GetText(302);
  btReplace.Caption := GetText(249);

  Label1.Caption := GetText(171); //Size
  Label2.Caption := GetText(172); //Length
  Label3.Caption := GetText(131); //BitRate
  Label4.Caption := GetText(132); //Sample Rate
  Label5.Caption := GetText(303); //CRC
  Label6.Caption := GetText(304); //Copyright
  Label7.Caption := GetText(305); //Original
  Label8.Caption := GetText(306); //Emphasis
  imSwap.Hint    := GetText(329);

  cbCapitalization.Caption := GetText(321);
  cboxCapitalization.Items[0] := GetText(322);
  cboxCapitalization.Items[1] := GetText(323);
  cboxCapitalization.Items[2] := GetText(324);
  cboxCapitalization.Items[3] := GetText(325);
  cboxCapitalization.Items[4] := GetText(326);
  cboxCapitalization.Items[5] := GetText(327);
  cboxCapitalization.Items[6] := GetText(328);
  cboxCapitalization.ItemIndex := 2;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.ClearAll1;
begin
{ Clear all captions }
  cbID3v1.Checked := False;
  leTrack1.Text   := '';
  leArtist1.Text  := '';
  leTitle1.Text   := '';
  leAlbum1.Text   := '';
  leYear1.Text    := '';
  leComment1.Text := '';
  cbGenre1.Text   := '';
  cbGenre1.ItemIndex := 0;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.ClearAll2;
begin
{ Clear all captions }
  cbID3v2.Checked := False;
  leTrack2.Text     := '';
  leArtist2.Text    := '';
  leTitle2.Text     := '';
  leAlbum2.Text     := '';
  leYear2.Text      := '';
  leComment2.Text   := '';
  leComposer.Text   := '';
  leOrigArtist.Text := '';
  leCopyright.Text  := '';
  leURL.Text        := '';
  leEncodedby.Text  := '';
  cbGenre2.Text     := '';
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.FormCreate(Sender: TObject);
var Reg: TRegistry;
begin
  NeedUpd := False;
  ClearAll1;
  ClearAll2;
  cbID3v1.Checked    := False;
  cbID3v2.Checked    := False;
  lbLyrics3Tag.Visible := False;
  leTrack1.Enabled   := False;
  leArtist1.Enabled  := False;
  leTitle1.Enabled   := False;
  leAlbum1.Enabled   := False;
  leYear1.Enabled    := False;
  leComment1.Enabled := False;
  cbGenre1.Enabled   := False;

  leTrack2.Enabled     := False;
  leArtist2.Enabled    := False;
  leTitle2.Enabled     := False;
  leAlbum2.Enabled     := False;
  leYear2.Enabled      := False;
  leComment2.Enabled   := False;
  leComposer.Enabled   := False;
  leOrigArtist.Enabled := False;
  leCopyright.Enabled  := False;
  leURL.Enabled        := False;
  leEncodedby.Enabled  := False;
  cbGenre2.Enabled     := False;
  SetCaptions;

  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  if Reg.OpenKey('\Software\' + AppTitle, false) then try
    cbCapitalization.Checked := Reg.ReadBool('CapitalizationBoxState');
    cboxCapitalization.Enabled := Reg.ReadBool('CapitalizationBoxState');
    cboxCapitalization.ItemIndex := Reg.ReadInteger('CapitalizationBoxIndex');
  except
  end;
  Reg.Free;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.btCancelClick(Sender: TObject);
begin
//  FormActivate(Sender);
  Close;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.cbID3v1Click(Sender: TObject);
begin
  if cbID3v1.Checked = False then //begin
    if Data.ID3v1.Exists then
      NeedUpd := True;

    leTrack1.Enabled     := not leTrack1.Enabled;
    leArtist1.Enabled    := not leArtist1.Enabled;
    leTitle1.Enabled     := not leTitle1.Enabled;
    leAlbum1.Enabled     := not leAlbum1.Enabled;
    leYear1.Enabled      := not leYear1.Enabled;
    leComment1.Enabled   := not leComment1.Enabled;
    cbGenre1.Enabled     := not cbGenre1.Enabled;
    if cbID3v1.Checked then
      lbLyrics3Tag.Font.Color := clWindowText
    else
      lbLyrics3Tag.Font.Color := clInactiveCaptionText;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.cbID3v2Click(Sender: TObject);
begin
  if (cbID3v2.Checked = False) then// begin
    if Data.ID3v2.Exists then
      NeedUpd := True;

    leTrack2.Enabled     := not leTrack2.Enabled;
    leArtist2.Enabled    := not leArtist2.Enabled;
    leTitle2.Enabled     := not leTitle2.Enabled;
    leAlbum2.Enabled     := not leAlbum2.Enabled;
    leYear2.Enabled      := not leYear2.Enabled;
    leComment2.Enabled   := not leComment2.Enabled;
    leComposer.Enabled   := not leComposer.Enabled;
    leOrigArtist.Enabled := not leOrigArtist.Enabled;
    leCopyright.Enabled  := not leCopyright.Enabled;
    leURL.Enabled        := not leURL.Enabled;
    leEncodedby.Enabled  := not leEncodedby.Enabled;
    cbGenre2.Enabled     := not cbGenre2.Enabled;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.FormActivate(Sender: TObject);
var BitRate,m, sec: Integer;
    sDuration: String;
    FileTag: TagArray;
    FileData: DataArray;
begin
  ClearAll1;
  ClearAll2;
  Data := TMPEGAudio.Create;
  edPath.Text := GetFilePath(frmMain.GetSelectedNode);//GetFilePath(SelectedNode);
//  if FileExists(edPath.Text) then begin
  if Data.ReadFromFile( edPath.Text ) then begin
//    if data.Valid then begin
  {    if Data.ID3v1.Exists then begin
      cbID3v1.Checked := True;
      leArtist1.Text  := Data.ID3v1.Artist;
      leTrack1.Text   := IntToStr(Data.ID3v1.Track);
      leTitle1.Text   := Data.ID3v1.Title;
      leAlbum1.Text   := Data.ID3v1.Album;
      leYear1.Text    := Data.ID3v1.Year;
      leComment1.Text := Data.ID3v1.Comment;
      cbGenre1.Text   := Data.ID3v1.Genre;
    end;
}
       frmMain.pkID3.LoadFromFile(edPath.Text);
       if (frmMain.pkID3.UseID3v1) and (frmMain.pkID3.ID3v1.Lyrics3.UseLyrics3v2 = False) then begin
         cbID3v1.Checked := True;
         leArtist1.Text  := frmMain.pkID3.ID3v1.Artist;
         leTrack1.Text   := IntToStr(frmMain.pkID3.ID3v1.TrackNo);
         leTitle1.Text   := frmMain.pkID3.ID3v1.Title;
         leAlbum1.Text   := frmMain.pkID3.ID3v1.Album;
         leYear1.Text    := frmMain.pkID3.ID3v1.Year;
         leComment1.Text := frmMain.pkID3.ID3v1.Comment;
         cbGenre1.Text   := frmMain.pkID3.ID3v1.Genre;
         cbGenre1.ItemIndex := frmMain.pkID3.ID3v1.GenreID+1;
       end;
       if (frmMain.pkID3.UseID3v1) and (frmMain.pkID3.ID3v1.Lyrics3.UseLyrics3v2 = True) then begin
         cbID3v1.Checked := True;
         lbLyrics3Tag.Visible := True;
         if frmMain.pkID3.ID3v1.Lyrics3.Title <> '' then
           leTitle1.Text := frmMain.pkID3.ID3v1.Lyrics3.Title
         else
           leTitle1.Text := frmMain.pkID3.ID3v1.Title;
         if frmMain.pkID3.ID3v1.Lyrics3.Artist <> '' then
           leArtist1.Text := frmMain.pkID3.ID3v1.Lyrics3.Artist
         else
           leArtist1.Text := frmMain.pkID3.ID3v1.Artist;
         if frmMain.pkID3.ID3v1.Lyrics3.Album <> '' then
           leAlbum1.Text := frmMain.pkID3.ID3v1.Lyrics3.Album
         else
           leAlbum1.Text := frmMain.pkID3.ID3v1.Album;
         leTrack1.Text := IntToStr(frmMain.pkID3.ID3v1.TrackNo);
         leYear1.Text := frmMain.pkID3.ID3v1.Year;
         leComment1.Text := frmMain.pkID3.ID3v1.Comment;
         cbGenre1.Text := frmMain.pkID3.ID3v1.Genre;
         cbGenre1.ItemIndex := frmMain.pkID3.ID3v1.GenreID+1;

       end;
      if Data.ID3v2.Exists then begin
        cbID3v2.Checked := True;
        leTrack2.Text     := Data.ID3v2.TrackString;
        leArtist2.Text    := Data.ID3v2.Artist;
        leTitle2.Text     := Data.ID3v2.Title;
        leAlbum2.Text     := Data.ID3v2.Album;
        leYear2.Text      := Data.ID3v2.Year;
        leComment2.Text   := Data.ID3v2.Comment;
        leComposer.Text   := Data.ID3v2.Composer;
        //leOrigArtist.Text := Data.ID3v2.Language;
        leCopyright.Text  := Data.ID3v2.Copyright;
        leURL.Text        := Data.ID3v2.Link;
        leEncodedby.Text  := Data.ID3v2.Encoder;
        cbGenre2.Text     := Data.ID3v2.Genre;
      end;
      Label1.Caption := GetText(171) + ' : ' + Size2Str(Data.FileLength) + ' bytes';
      m := Floor(Data.Duration/60);
      sec := Floor(Data.Duration) - m * 60;
      sDuration := Format('%u',[m]) + ':' + Format('%02.2u',[sec]);
      Label2.Caption := GetText(172) + ' : ' + sDuration;
      Label3.Caption := Data.Version + ' ' + Data.Layer;
      if Data.VBR.Found then
        Label3.Caption := Label3.Caption + ' , VBR ' + IntToStr(Data.BitRate) + ' kbit , ' + IntToStr(Data.Frames)
      else
        Label3.Caption := Label3.Caption + ' , CBR ' + IntToStr(Data.BitRate) + ' kbit , ' + IntToStr(Data.Frames) + ' Frames';
      Label4.Caption := IntToStr(Data.SampleRate) + ' Hz , ' + Data.ChannelMode;
      if Data.Frame.ProtectionBit then
        Label5.Caption := GetText(303) + ' : ' + GetText(055)
      else
        Label5.Caption := GetText(303) + ' : ' + GetText(056);
     if Data.Frame.CopyrightBit then
        Label6.Caption := GetText(304) + ' : ' + GetText(055)
      else
        Label6.Caption := GetText(304) + ' : ' + GetText(056);
      if Data.Frame.OriginalBit then
        Label7.Caption := GetText(305) + ' : ' + GetText(055)
      else
        Label7.Caption := GetText(305) + ' : ' + GetText(055);
      Label8.Caption := GetText(306) + ' : ' + Data.Emphasis;
    end;
  if cbCapitalization.Checked then
    cboxCapitalizationChange(Sender);

//   end;
//   else
    if Data.ReadFromFile( edPath.Text ) = False then begin
      cbID3v1.Enabled := False;
      cbID3v2.Enabled := False;
      MessageBox(Handle, PChar(GetText(310)+#13#10+GetText(311)), PChar('Error'), $00000010);
      FileTag := ExtractTag(TTreeNode(frmMain.GetSelectedNode).Text);
      FileData := ExtractData(TTreeNode(frmMain.GetSelectedNode).Text);
      leTrack2.Text     := FileTag[4];
      leArtist2.Text    := FileTag[2];
      leTitle2.Text     := FileTag[1];
      leAlbum2.Text     := FileTag[3];
      leYear2.Text      := FileTag[5];
      leComment2.Text   := FileTag[6];
      leComposer.Text   := GetText(312);
      leOrigArtist.Text := GetText(312);
      leCopyright.Text  := GetText(312);
      leURL.Text        := GetText(312);
      leEncodedby.Text  := GetText(312);
      cbGenre2.Text     := FileTag[7];
      Label1.Caption := GetText(171) + ' : ' + Size2Str(FileData[1]*1024) + ' bytes';
      Label2.Caption := GetText(172) + ' : ' + DurationToStr(FileData[2]);
      Label3.Caption := GetMPEGType(FileData[5], FileData[6]);
      if FileData[2] <> 0 then
        BitRate := Trunc(FileData[1] * 8 * 1.024 / Abs(FileData[2]))
      else
        BitRate := 0;
      if FileData[2] < 0 then
        Label3.Caption := FormatFloat('000', BitRate) + ' ' + GetText(67) + ' ' + GetText(66)
      else begin
        BitRate := AlignedBitRate(BitRate, FileData[3], FileData[4], FileData[5], FileData[6]);
        Label3.Caption := FormatFloat('000', BitRate) + ' ' + GetText(67) + ' ' + GetText(148);
      end;
      Label4.Caption := IntToStr(FileData[3]*10) + ' Hz , ' + GetChannelMode(FileData[4]);
      Label5.Caption := GetText(303) + ' : ???';
      Label6.Caption := GetText(304) + ' : ???';
      Label7.Caption := GetText(305) + ' : ???';
      Label8.Caption := GetText(306) + ' : ???';
      cbCapitalization.Enabled := False;
      cboxCapitalization.Enabled := False;
      btUpdate.SetFocus;
   end;

//   if Data.ReadFromFile( edPath.Text ) and (not data.Valid) then begin
//     MessageBox(Handle, PChar('File is not valid!'), PChar('Warning'), $00000030);
//     FormEditTag.Close;
// Application.Terminate;
//   end;
//end;
//else
//    MessageBox(Handle, PChar('File not found and you can''t modify tags!'), PChar('Warning'), $00000030);

  //Saving undo data
  TagD1[1] := leTrack1.Text;
  TagD1[2] := leArtist1.Text;
  TagD1[3] := leTitle1.Text;
  TagD1[4] := leAlbum1.Text;
  TagD1[5] := leYear1.Text;
  TagD1[6] := leComment1.Text;
  TagD1[7] := cbGenre1.Text;
  TagD1Ex := cbID3v1.Checked;

  TagD2[1] := leTrack2.Text;
  TagD2[2] := leArtist2.Text;
  TagD2[3] := leTitle2.Text;
  TagD2[4] := leAlbum2.Text;
  TagD2[5] := leYear2.Text;
  TagD2[6] := leComment2.Text;
  TagD2[7] := cbGenre2.Text;
  TagD2[8] := leComposer.Text;
  //TagD2[9] := leOrigArtist.Text;
  TagD2[10] := leCopyright.Text;
  TagD2[11] := leURL.Text;
  TagD2[12] := leEncodedby.Text;
  TagD2Ex := cbID3v2.Checked;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.leArtist1Change(Sender: TObject);
begin
  NeedUpd := True;
  if (Length(leArtist1.Text) > 30) or (Length(leTitle1.Text) > 30) or (Length(leAlbum1.Text) > 30) then
    lbLyrics3Tag.Visible := True
  else
    lbLyrics3Tag.Visible := False;
  lbArL.Caption := IntToStr(Length(leArtist1.Text));
  lbTiL.Caption := IntToStr(Length(leTitle1.Text));
  lbAlL.Caption := IntToStr(Length(leAlbum1.Text));
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.btUpdateClick(Sender: TObject);
var SelectedIndex,Value, Code: Integer;
    x: Byte;
    FileTag: TagArray;
    IText,Artist,Title, Comment,Genre,Album,Track,Year:String;
    Item:TListItem;
    Node:TTreeNode;
    CaseConvertIndex:Byte;
begin
  Close;
  if not ( cbID3v1.Checked ) then begin
//    Data.ID3v1.RemoveFromFile( edPath.Text );
//    Data.ID3v2.ReadFromFile(edPath.Text);
//frmMain.pkID3.AutoSave := true;
//    frmMain.pkID3.ID3v1.Lyrics3.Clear;
//    frmMain.pkID3.UseID3v1 := False;
//    frmMain.pkID3.ID3v1.Lyrics3.UseLyrics3v2 := False;
//    frmMain.pkID3.Clear;
//    frmMain.pkID3.ID3v1.Clear;
//    frmMain.pkID3.ID3v1.Lyrics3.Clear;
//    frmMain.pkID3.UseID3v1 := False;
//    frmMain.pkID3.ID3v1.UseID3v11 := False;
//    frmMain.pkID3.ID3v1.UseID3v11 := False;
//    frmMain.pkID3.ID3v1.SaveToFile;
//    frmMain.pkID3.ID3v1.SaveToFile( edPath.Text );
    frmMain.pkID3.ID3v1.UseLyrics3 := False;
    frmMain.pkID3.ID3v1.Lyrics3.UseLyrics3v2 := False;
    frmMain.pkID3.SaveToFile(edPath.Text);
    Data.ID3v1.RemoveFromFile( edPath.Text );
//frmMain.pkID3.AutoSave := False;
  end;

  if not ( cbID3v2.Checked ) then begin
    Data.ID3v2.RemoveFromFile( edPath.Text );
    Data.ID3v2.ReadFromFile(edPath.Text);
  end;

  if (NeedUpd) and (cbID3v2.Checked) then begin
//SetCapital(FileNameTag[4],cboxCapitalization.ItemIndex);
    if cbCapitalization.Checked = True then
      CaseConvertIndex := cboxCapitalization.ItemIndex;
    if cbCapitalization.Checked = False then
      CaseConvertIndex := 6;

    Data.ID3v2.Title     := SetCapital(leTitle2.Text,CaseConvertIndex);
    Data.ID3v2.Artist    := SetCapital(leArtist2.Text,CaseConvertIndex);
    Data.ID3v2.Album     := SetCapital(leAlbum2.Text,CaseConvertIndex);
    Data.ID3v2.Year      := SetCapital(leYear2.Text,CaseConvertIndex);
    Data.ID3v2.Genre     := SetCapital(cbGenre2.Text,CaseConvertIndex);
    Data.ID3v2.Comment   := SetCapital(leComment2.Text,CaseConvertIndex);
    Data.ID3v2.Composer  := SetCapital(leComposer.Text,CaseConvertIndex);
    Data.ID3v2.Encoder   := SetCapital(leEncodedby.Text,CaseConvertIndex);
    Data.ID3v2.Copyright := SetCapital(leCopyright.Text,CaseConvertIndex);
    Data.ID3v2.Link      := SetCapital(leURL.Text,CaseConvertIndex);
//    Data.ID3v2.Language  := leOrigArtist.Text;
    Val(leTrack2.Text, Value, Code);
    if (Code = 0) and (Value > 0) then
      Data.ID3v2.Track := Value
    else
      Data.ID3v2.Track := 0;
    if (not FileExists(edPath.Text)) or (not Data.ID3v2.SaveToFile(edPath.Text)) then
      MessageBox(Handle, PChar(GetText(307) + edPath.Text), PChar('Error'), $00000010);
    Data.ID3v2.SaveToFile(edPath.Text);
    Data.ID3v2.ReadFromFile(edPath.Text);
  end;
  if ((NeedUpd) and (cbID3v1.Checked)) and ((Length(leArtist1.Text)>30) or (Length(leTitle1.Text)>30) or (Length(leAlbum1.Text)>30)) then begin
    if cbCapitalization.Checked = True then
      CaseConvertIndex := cboxCapitalization.ItemIndex;
    if cbCapitalization.Checked = False then
      CaseConvertIndex := 6;
    frmMain.pkID3.ID3v1.Lyrics3.Title   := SetCapital(leTitle1.Text,CaseConvertIndex);
    frmMain.pkID3.ID3v1.Lyrics3.Artist  := SetCapital(leArtist1.Text,CaseConvertIndex);
    frmMain.pkID3.ID3v1.Lyrics3.Album   := SetCapital(leAlbum1.Text,CaseConvertIndex);
    frmMain.pkID3.ID3v1.Title   := SetCapital(leTitle1.Text,CaseConvertIndex);
    frmMain.pkID3.ID3v1.Artist  := SetCapital(leArtist1.Text,CaseConvertIndex);
    frmMain.pkID3.ID3v1.Album   := SetCapital(leAlbum1.Text,CaseConvertIndex);
    frmMain.pkID3.ID3v1.Year    := SetCapital(leYear1.Text,CaseConvertIndex);
//    Data.ID3v1.GenreID := GetID3v1GenreID(cbGenre1.Text); PinterPeti - removed
    frmMain.pkID3.ID3v1.GenreID := GetID3v1GenreID(cbGenre1.Text); //PinterPeti much nicer than previous

    frmMain.pkID3.ID3v1.Comment := SetCapital(leComment1.Text,CaseConvertIndex);

    Val(leTrack1.Text, Value, Code);
    if (Code = 0) and (Value > 0) then
      frmMain.pkID3.ID3v1.TrackNo := Value
    else
      frmMain.pkID3.ID3v1.TrackNo := 0;
//    if (not FileExists(edPath.Text)) or (not Data.ID3v1.SaveToFile(edPath.Text)) then
//      ShowMessage('Can not save tag to the file: ' + edPath.Text);
    frmMain.pkID3.ID3v1.SaveToFile(edPath.Text);
    frmMain.pkID3.ID3v1.LoadFromFile(edPath.Text);
  end;

  if ((NeedUpd) and (cbID3v1.Checked)) and ((Length(leArtist1.Text)<31) and (Length(leTitle1.Text)<31) and (Length(leAlbum1.Text)<31)) then begin
    if cbCapitalization.Checked = True then
      CaseConvertIndex := cboxCapitalization.ItemIndex;
    if cbCapitalization.Checked = False then
      CaseConvertIndex := 6;

    frmMain.pkID3.ID3v1.UseLyrics3 := False;
    frmMain.pkID3.ID3v1.Lyrics3.UseLyrics3v2 := False;
    frmMain.pkID3.SaveToFile(edPath.Text);

    Data.ID3v1.Title   := SetCapital(leTitle1.Text,CaseConvertIndex);
    Data.ID3v1.Artist  := SetCapital(leArtist1.Text,CaseConvertIndex);
    Data.ID3v1.Album   := SetCapital(leAlbum1.Text,CaseConvertIndex);
    Data.ID3v1.Year    := SetCapital(leYear1.Text,CaseConvertIndex);
    Data.ID3v1.GenreID := GetID3v1GenreID(cbGenre1.Text);
    Data.ID3v1.Comment := SetCapital(leComment1.Text,CaseConvertIndex);

    Val(leTrack1.Text, Value, Code);
    if (Code = 0) and (Value > 0) then
      Data.ID3v1.Track := Value
    else
      Data.ID3v1.Track := 0;
//    if (not FileExists(edPath.Text)) or (not Data.ID3v1.SaveToFile(edPath.Text)) then
//      ShowMessage('Can not save tag to the file: ' + edPath.Text);
    Data.ID3v1.SaveToFile(edPath.Text);
    Data.ID3v1.ReadFromFile(edPath.Text);
  end;

  if (frmMain.ListView1.Selected <> nil) then begin
    if cbCapitalization.Checked = True then
      CaseConvertIndex := cboxCapitalization.ItemIndex;
    if cbCapitalization.Checked = False then
      CaseConvertIndex := 6;

    Item := frmMain.ListView1.Selected;
    Node := Item.Data;
    IText := Node.Text;
    if (not cbID3v1.Checked) and (not cbID3v2.Checked) then begin
      Artist  := '';
      Title   := '';
      Album   := '';
      Track   := '';
      Year    := '';
      Comment := '';
      Genre   := '';
    end;
    if ((cbID3v1.Checked) and (PreferTag = 1)) or ((not cbID3v2.Checked) and (PreferTag = 2)) then begin
      Artist  := SetCapital(leArtist1.Text,CaseConvertIndex);
      Title   := SetCapital(leTitle1.Text,CaseConvertIndex);
      Album   := SetCapital(leAlbum1.Text,CaseConvertIndex);
      Track   := SetCapital(leTrack1.Text,CaseConvertIndex);
      Year    := SetCapital(leYear1.Text,CaseConvertIndex);
      Comment := SetCapital(leComment1.Text,CaseConvertIndex);
      Genre   := cbGenre1.Items[cbGenre1.ItemIndex];
    end;
    if ((cbID3v2.Checked) and (PreferTag = 2)) or ((not cbID3v1.Checked) and (PreferTag = 1)) then begin
      Artist  := SetCapital(leArtist2.Text,CaseConvertIndex);
      Title   := SetCapital(leTitle2.Text,CaseConvertIndex);
      Album   := SetCapital(leAlbum2.Text,CaseConvertIndex);
      Track   := SetCapital(leTrack2.Text,CaseConvertIndex);
      Year    := SetCapital(leYear2.Text,CaseConvertIndex);
      Comment := SetCapital(leComment2.Text,CaseConvertIndex);
    end;
    {Clear Artist,Title,Album...}
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
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ClearAll1;
  ClearAll2;
  Data.Free;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.btUpdateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Close;
end;

procedure TFormEditTag.btCopyToClick(Sender: TObject);
begin
  if cbID3v2.Checked then begin
    cbID3v1.Checked := True;
    leArtist1.Text  := leArtist2.Text;
    leTitle1.Text   := leTitle2.Text;
    leAlbum1.Text   := leAlbum2.Text;
    leTrack1.Text   := leTrack2.Text;
    leYear1.Text    := leYear2.Text;
    leComment1.Text := leComment2.Text;
  end;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.btCopyFromClick(Sender: TObject);
begin
  if cbID3v1.Checked then begin
    cbID3v2.Checked := True;
    leArtist2.Text  := leArtist1.Text;
    leTitle2.Text   := leTitle1.Text;
    leAlbum2.Text   := leAlbum1.Text;
    leTrack2.Text   := leTrack1.Text;
    leYear2.Text    := leYear1.Text;
    leComment2.Text := leComment1.Text;
  end;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var p:Integer;
    FName:String;
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_RETURN then
    btUpdateClick(Sender);
  if (Shift = [ssCtrl]) and (Key = VK_TAB) then
    FormEditTag.SelectNext(FormEditTag.ActiveControl,False,True);
  //  (Sender as (TWinControl)).TabOrder := (Sender as (TWinControl)).TabOrder-1;

  if (Shift = [ssCtrl]) and (Key = VK_UP) then
    imSwapClick(Sender);

  if (Shift = [ssAlt]) and (Key = VK_LEFT) then
    btCopyToClick(Sender);

  if (Shift = [ssAlt]) and (Key = VK_RIGHT) then
    btCopyFromClick(Sender);

  if (Shift = [ssCtrl]) and (Key = VK_DOWN) then
    if Pos( ' - ', edPath.Text ) <> 0 then begin
      if cbID3v1.Checked then begin
        FName := ExtractFileName(edPath.Text);
        p := Pos( ' - ', FName);
        leArtist1.Text := copy(FName, 1, p-1); // PinterPeti p -> p-1
        leTitle1.Text := copy(FName,p+3,Length(FName)-(p+6));
//        leArtist1.Text := copy(ExtractFileName(edPath.Text), 1, Pos( ' - ', ExtractFileName(edPath.Text)));
//        leTitle1.Text := copy(ExtractFileName(edPath.Text),Pos(' - ',ExtractFileName(edPath.Text))+3,Length(ExtractFileName(edPath.Text))-Pos(' - ',edPath.Text)+1);
      end;
      if cbID3v2.Checked then begin
        FName := ExtractFileName(edPath.Text);
        p := Pos( ' - ', FName);
        leArtist2.Text := copy(FName, 1, p);
        leTitle2.Text := copy(FName,p+3,Length(FName)-(p+6));
      end;
    end;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.btUndoClick(Sender: TObject);
begin
  leTrack1.Text   := TagD1[1];
  leArtist1.Text  := TagD1[2];
  leTitle1.Text   := TagD1[3];
  leAlbum1.Text   := TagD1[4];
  leYear1.Text    := TagD1[5];
  leComment1.Text := TagD1[6];
  cbGenre1.ItemIndex := Tageditor.GetID3v1GenreID(TagD1[7])+1;  //TagD1[7];
  cbID3v1.Checked := TagD1Ex;

  leTrack2.Text   := TagD2[1];
  leArtist2.Text  := TagD2[2];
  leTitle2.Text   := TagD2[3];
  leAlbum2.Text   := TagD2[4];
  leYear2.Text    := TagD2[5];
  leComment2.Text := TagD2[6];
  cbGenre2.Text   := TagD2[7];
  leComposer.Text := TagD2[8];
  //leOrigArtist.Text := TagD2[9];
  leCopyright.Text := TagD2[10];
  leURL.Text       := TagD2[11];
  leEncodedby.Text := TagD2[12];
  cbID3v2.Checked  := TagD2Ex;
end;

procedure TFormEditTag.cbCapitalizationClick(Sender: TObject);
begin
  cboxCapitalization.Enabled := cbCapitalization.Checked;
  if cbCapitalization.Checked then
    cboxCapitalizationChange(Sender);
end;

procedure TFormEditTag.cboxCapitalizationChange(Sender: TObject);
begin
  if cboxCapitalization.ItemIndex = 6 then begin
    if (frmMain.pkID3.UseID3v1) and (frmMain.pkID3.ID3v1.Lyrics3.UseLyrics3v2 = False) then begin
      leArtist1.Text  := SetCapital(frmMain.pkID3.ID3v1.Artist,cboxCapitalization.ItemIndex);
      leTitle1.Text   := SetCapital(frmMain.pkID3.ID3v1.Title,cboxCapitalization.ItemIndex);
      leAlbum1.Text   := SetCapital(frmMain.pkID3.ID3v1.Album,cboxCapitalization.ItemIndex);
      leYear1.Text    := SetCapital(frmMain.pkID3.ID3v1.Year,cboxCapitalization.ItemIndex);
      leComment1.Text := SetCapital(frmMain.pkID3.ID3v1.Comment,cboxCapitalization.ItemIndex);
    end;
    if (frmMain.pkID3.UseID3v1) and (frmMain.pkID3.ID3v1.Lyrics3.UseLyrics3v2 = True) then begin
      leArtist1.Text  := SetCapital(frmMain.pkID3.ID3v1.Lyrics3.Artist,cboxCapitalization.ItemIndex);
      leTitle1.Text   := SetCapital(frmMain.pkID3.ID3v1.Lyrics3.Title,cboxCapitalization.ItemIndex);
      leAlbum1.Text   := SetCapital(frmMain.pkID3.ID3v1.Lyrics3.Album,cboxCapitalization.ItemIndex);
      leYear1.Text    := SetCapital(frmMain.pkID3.ID3v1.Year,cboxCapitalization.ItemIndex);
      leComment1.Text := SetCapital(frmMain.pkID3.ID3v1.Comment,cboxCapitalization.ItemIndex);
    end;
    leTrack2.Text     := SetCapital(Data.ID3v2.TrackString,cboxCapitalization.ItemIndex);
    leArtist2.Text    := SetCapital(Data.ID3v2.Artist,cboxCapitalization.ItemIndex);
    leTitle2.Text     := SetCapital(Data.ID3v2.Title,cboxCapitalization.ItemIndex);
    leAlbum2.Text     := SetCapital(Data.ID3v2.Album,cboxCapitalization.ItemIndex);
    leYear2.Text      := SetCapital(Data.ID3v2.Year,cboxCapitalization.ItemIndex);
    leComment2.Text   := SetCapital(Data.ID3v2.Comment,cboxCapitalization.ItemIndex);
    leComposer.Text   := SetCapital(Data.ID3v2.Composer,cboxCapitalization.ItemIndex);
    //leOrigArtist.Text := Data.ID3v2.Language;
    leCopyright.Text  := SetCapital(Data.ID3v2.Copyright,cboxCapitalization.ItemIndex);
    leURL.Text        := SetCapital(Data.ID3v2.Link,cboxCapitalization.ItemIndex);
    leEncodedby.Text  := SetCapital(Data.ID3v2.Encoder,cboxCapitalization.ItemIndex);
    cbGenre2.Text     := SetCapital(Data.ID3v2.Genre,cboxCapitalization.ItemIndex);
  end;
  if cboxCapitalization.ItemIndex <> 6 then begin
    leArtist1.Text  := SetCapital(leArtist1.Text,cboxCapitalization.ItemIndex);
    leTitle1.Text   := SetCapital(leTitle1.Text,cboxCapitalization.ItemIndex);
    leAlbum1.Text   := SetCapital(leAlbum1.Text,cboxCapitalization.ItemIndex);
    leYear1.Text    := SetCapital(leYear1.Text,cboxCapitalization.ItemIndex);
    leComment1.Text := SetCapital(leComment1.Text,cboxCapitalization.ItemIndex);

    leTrack2.Text     := SetCapital(leTrack2.Text,cboxCapitalization.ItemIndex);
    leArtist2.Text    := SetCapital(leArtist2.Text,cboxCapitalization.ItemIndex);
    leTitle2.Text     := SetCapital(leTitle2.Text,cboxCapitalization.ItemIndex);
    leAlbum2.Text     := SetCapital(leAlbum2.Text,cboxCapitalization.ItemIndex);
    leYear2.Text      := SetCapital(leYear2.Text,cboxCapitalization.ItemIndex);
    leComment2.Text   := SetCapital(leComment2.Text,cboxCapitalization.ItemIndex);
    leComposer.Text   := SetCapital(leComposer.Text,cboxCapitalization.ItemIndex);
    //leOrigArtist.Text := Data.ID3v2.Language;
    leCopyright.Text  := SetCapital(leCopyright.Text,cboxCapitalization.ItemIndex);
    leURL.Text        := SetCapital(leURL.Text,cboxCapitalization.ItemIndex);
    leEncodedby.Text  := SetCapital(leEncodedby.Text,cboxCapitalization.ItemIndex);
    cbGenre2.Text     := SetCapital(cbGenre2.Text,cboxCapitalization.ItemIndex);
  end;
end;

procedure TFormEditTag.btReplaceClick(Sender: TObject);
begin
  leArtist1.Text    := StringReplace(leArtist1.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leTitle1.Text     := StringReplace(leTitle1.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leAlbum1.Text     := StringReplace(leAlbum1.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leComment1.Text   := StringReplace(leComment1.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leArtist2.Text    := StringReplace(leArtist2.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leTitle2.Text     := StringReplace(leTitle2.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leAlbum2.Text     := StringReplace(leAlbum2.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leComment2.Text   := StringReplace(leComment2.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leComposer.Text   := StringReplace(leComposer.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leOrigArtist.Text := StringReplace(leOrigArtist.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leCopyright.Text  := StringReplace(leCopyright.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leURL.Text        := StringReplace(leURL.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);
  leEncodedby.Text  := StringReplace(leEncodedby.Text,leReplaceThis.Text,leReplaceForThis.Text,[rfReplaceAll, rfIgnoreCase]);

end;

procedure TFormEditTag.imSwapClick(Sender: TObject);
var TmpStr: String;
begin
  if cbID3v1.Checked then begin
    TmpStr         := leArtist1.Text;
    leArtist1.Text := leTitle1.Text;
    leTitle1.Text  := TmpStr;
  end;
  if cbID3v2.Checked then begin
    TmpStr         := leArtist2.Text;
    leArtist2.Text := leTitle2.Text;
    leTitle2.Text  := TmpStr;
  end;

end;

end.
