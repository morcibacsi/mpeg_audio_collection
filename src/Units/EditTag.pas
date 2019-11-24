unit EditTag;

interface
uses
  ComCtrls, SysUtils, Windows, Forms,
  Controls, StdCtrls, Classes,
  Main, Global, TagEditor, MPEGAudio, Helpers,
  Graphics, Math, StrUtils, ExtCtrls;

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
    imSwap: TImage;
    gbCapitalization: TGroupBox;
    cbCapitalization: TCheckBox;
    cboxCapitalization: TComboBox;
    edDelimiters: TEdit;
    lbWordDelimiters: TLabel;
    gbMisc: TGroupBox;
    leReplaceThis: TLabeledEdit;
    leReplaceForThis: TLabeledEdit;
    btReplace: TButton;
    edFileFormat: TEdit;
    lbFileNameFormat: TLabel;
    cbDeleteIfNotEmpty: TCheckBox;
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
    procedure EnableAll;
    procedure DisableAll;
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

{$R *.dfm}
{ --------------------------------------------------------------------------- }
function GetTagFromFileName(FileName,Options:String):FTagArray;
type Tag = record
       Typo:Char;
       Delim:String;
     end;
var i,j:byte;
    TagA: array [1..7] of Tag;
    TheTags: FTagArray;
    TempStr:String;
begin
  if Options = '' then
    Options := '%a - %b';
  TempStr := WideLowerCase(FileName);
  for i:=1 to 7 do begin
    TagA[i].Typo := #0;
    TagA[i].Delim :='';
  end;
  j := 1;
  for i:=1 to Length(Options) do begin
    if Options[i] = '%' then begin
      case UpCase(Options[i+1]) of
        'A':TagA[j].Typo := UpCase(Options[i+1]);
        'B':TagA[j].Typo := UpCase(Options[i+1]);
        'C':TagA[j].Typo := UpCase(Options[i+1]);
        'D':TagA[j].Typo := UpCase(Options[i+1]);
        'E':TagA[j].Typo := UpCase(Options[i+1]);
        'F':TagA[j].Typo := UpCase(Options[i+1]);
        'G':TagA[j].Typo := UpCase(Options[i+1]);
        'H':TagA[j].Typo := UpCase(Options[i+1]);
        'I':TagA[j].Typo := UpCase(Options[i+1]);
        'J':TagA[j].Typo := UpCase(Options[i+1]);
        'K':TagA[j].Typo := UpCase(Options[i+1]);
        'L':TagA[j].Typo := UpCase(Options[i+1]);
      end;

      if copy(Options,i+2,PosEx('%',Options,PosEx('%',Options,i+1))-(i+2)) <> '' then
        TagA[j].Delim := WideLowerCase(copy(Options,i+2,PosEx('%',Options,PosEx('%',Options,i+1))-(i+2)))
      else
        TagA[j].Delim := '.mp3';
      inc(j);
    end;
  end;
  i:=1;
  while i<>8 do begin
    case TagA[i].Typo of
      'A':begin
            TheTags[1]:= copy(TempStr,1,Pos(TagA[i].Delim,TempStr)-1);
            delete(TempStr,1,Pos(TagA[i].Delim,TempStr)+Length(TagA[i].Delim)-1);
          end;
      'B':begin
            TheTags[2]:= copy(TempStr,1,Pos(TagA[i].Delim,TempStr)-1);
            delete(TempStr,1,Pos(TagA[i].Delim,TempStr)+Length(TagA[i].Delim)-1);
          end;
      'C':begin
            TheTags[3]:= copy(TempStr,1,Pos(TagA[i].Delim,TempStr)-1);
            delete(TempStr,1,Pos(TagA[i].Delim,TempStr)+Length(TagA[i].Delim)-1);
          end;
      'D':begin
            TheTags[4]:= copy(TempStr,1,Pos(TagA[i].Delim,TempStr)-1);
            delete(TempStr,1,Pos(TagA[i].Delim,TempStr)+Length(TagA[i].Delim)-1);
          end;
      'E':begin
            TheTags[5]:= copy(TempStr,1,Pos(TagA[i].Delim,TempStr)-1);
            delete(TempStr,1,Pos(TagA[i].Delim,TempStr)+Length(TagA[i].Delim)-1);
          end;
      'F':begin
            TheTags[6]:= copy(TempStr,1,Pos(TagA[i].Delim,TempStr)-1);
            delete(TempStr,1,Pos(TagA[i].Delim,TempStr)+Length(TagA[i].Delim)-1);
          end;
      'G':begin
            TheTags[7]:= copy(TempStr,1,Pos(TagA[i].Delim,TempStr)-1);
            delete(TempStr,1,Pos(TagA[i].Delim,TempStr)+Length(TagA[i].Delim)-1);
          end;
    end;
    inc(i);
  end;
  TempStr := WideLowerCase(FileName);
  for i := 1 to 7 do begin
    if (Pos(TagA[i].Delim,TempStr)=0) and (TagA[i].Delim<>'') then
      TheTags[i] := ''
    else if Length(TheTags[i])>30 then
//      TagBiggerThanLimit := True;
  end;
  Result := TheTags;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.DisableAll;
var i: Integer;
begin
  for i := 0 to ComponentCount-1 do try
    TControl(Components[i]).Enabled := False;
    except
  end;
  try
    btCancel.Enabled := True;
//    cbID3v1Click(Self);
//    cbID3v2Click(Self);
    except
  end;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.EnableAll;
var i: Integer;
begin
  for i := 0 to ComponentCount-1 do try
    TControl(Components[i]).Enabled := True;
    except
  end;
  try
    btCancel.Enabled := True;
    cbID3v1Click(Self);
    cbID3v2Click(Self);
    except
  end;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.SetCaptions;
var TempStr: WideString;
    i: Integer;
begin
  leTitle1.EditLabel.Caption   := GetText(042);
  leArtist1.EditLabel.Caption  := GetText(043);
  leAlbum1.EditLabel.Caption   := GetText(044);
  leTrack1.EditLabel.Caption   := GetText(045)+' #';
  leYear1.EditLabel.Caption    := GetText(046);
  leComment1.EditLabel.Caption := GetText(047);
  lbGenre1.Caption             := GetText(239);

  leTitle2.EditLabel.Caption   := GetText(042);
  leArtist2.EditLabel.Caption  := GetText(043);
  leAlbum2.EditLabel.Caption   := GetText(044);
  leTrack2.EditLabel.Caption   := GetText(045)+' #';
  leYear2.EditLabel.Caption    := GetText(046);
  leComment2.EditLabel.Caption := GetText(047);
  lbGenre2.Caption             := GetText(239);

  leComposer.EditLabel.Caption   := GetText(295);
  leOrigArtist.EditLabel.Caption := GetText(296);
  leCopyright.EditLabel.Caption  := GetText(297);
  leEncodedby.EditLabel.Caption  := GetText(298);

  leReplaceThis.EditLabel.Caption := GetText(249);
  btUpdate.Caption                := GetText(299);
  btCancel.Caption                := GetText(057);
  btUndo.Caption                  := GetText(300);
  btCopyTo.Caption                := GetText(301);
  btCopyFrom.Caption              := GetText(302);
  lbFileNameFormat.Caption        := GetText(333);
  gbMisc.Caption                  := GetText(205);
  cbDeleteIfNotEmpty.Caption      := GetText(334);
//  btReplace.Caption := GetText(249);
  TempStr                         := GetText(335); // edFileFormat.Hint before line-breaking
  i := 1;
  while i <= Length(TempStr) do begin
    if TempStr[i] = '%' then begin
      Insert(''#13#10'',TempStr,i);
      inc(i,3)
    end else
     inc(i);
  end;
  edFileFormat.Hint               := TempStr;
  lbFileNameFormat.Hint           := TempStr;

  Label1.Caption := GetText(171); //Size
  Label2.Caption := GetText(172); //Length
  Label3.Caption := GetText(131); //BitRate
  Label4.Caption := GetText(132); //Sample Rate
  Label5.Caption := GetText(303); //CRC
  Label6.Caption := GetText(304); //Copyright
  Label7.Caption := GetText(305); //Original
  Label8.Caption := GetText(306); //Emphasis
  imSwap.Hint    := GetText(329);

  gbCapitalization.Caption := GetText(321);
  lbWordDelimiters.Caption := GetText(332);
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
begin
  NeedUpd := False;
  ClearAll1;
  ClearAll2;
  DisableAll;

  SetCaptions;
  cbCapitalization.Checked := CapitalizationBoxState;
  cboxCapitalization.Enabled := CapitalizationBoxState;
  edDelimiters.Enabled := CapitalizationBoxState;
  cboxCapitalization.ItemIndex := CapitalizationBoxIndex;
  edDelimiters.Text := WordDelimiterChars;
  edFileFormat.Text := FileFormat;
  cbDeleteIfNotEmpty.Checked := DeleteIfNotEmpty;

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
  if cbID3v1.Checked = False then
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
  if (cbID3v2.Checked = False) then
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
  if FileExists(edPath.Text) then begin
    EnableAll;
    if Data.ReadFromFile( edPath.Text ) then begin

       if Data.ID3v1.Exists then begin
         cbID3v1.Checked := True;
         leArtist1.Text  := Data.ID3v1.Artist;
         leTrack1.Text   := IntToStr(Data.ID3v1.Track);
         leTitle1.Text   := Data.ID3v1.Title;
         leAlbum1.Text   := Data.ID3v1.Album;
         leYear1.Text    := Data.ID3v1.Year;
         leComment1.Text := Data.ID3v1.Comment;
         cbGenre1.Text   := Data.ID3v1.Genre;
         cbGenre1.ItemIndex := Data.ID3v1.GenreID+1;
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

      if cbCapitalization.Checked then
        cboxCapitalizationChange(Sender);

    end;
  end else begin
//    if Data.ReadFromFile( edPath.Text ) = False then begin
      DisableAll;
//      cbID3v1.Enabled := False;
//      cbID3v2.Enabled := False;
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
      edDelimiters.Enabled := False;
      btCancel.SetFocus;
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
    Data.ID3v1.RemoveFromFile( edPath.Text );
    Data.ID3v1.ReadFromFile( edPath.Text );

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

    Data.ID3v2.Title     := SetCapital(leTitle2.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v2.Artist    := SetCapital(leArtist2.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v2.Album     := SetCapital(leAlbum2.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v2.Year      := SetCapital(leYear2.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v2.Genre     := SetCapital(cbGenre2.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v2.Comment   := SetCapital(leComment2.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v2.Composer  := SetCapital(leComposer.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v2.Encoder   := SetCapital(leEncodedby.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v2.Copyright := SetCapital(leCopyright.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v2.Link      := SetCapital(leURL.Text,CaseConvertIndex,edDelimiters.Text);
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
      Data.ID3v1.Title   := SetCapital(leTitle1.Text,CaseConvertIndex,edDelimiters.Text);
      Data.ID3v1.Artist  := SetCapital(leArtist1.Text,CaseConvertIndex,edDelimiters.Text);
      Data.ID3v1.Album   := SetCapital(leAlbum1.Text,CaseConvertIndex,edDelimiters.Text);
      Data.ID3v1.Year    := SetCapital(leYear1.Text,CaseConvertIndex,edDelimiters.Text);
      Data.ID3v1.GenreID := GetID3v1GenreID(cbGenre1.Text);
      Data.ID3v1.Comment := SetCapital(leComment1.Text,CaseConvertIndex,edDelimiters.Text);
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

  if ((NeedUpd) and (cbID3v1.Checked)) and ((Length(leArtist1.Text)<31) and (Length(leTitle1.Text)<31) and (Length(leAlbum1.Text)<31)) then begin
    if cbCapitalization.Checked = True then
      CaseConvertIndex := cboxCapitalization.ItemIndex;
    if cbCapitalization.Checked = False then
      CaseConvertIndex := 6;

    Data.ID3v1.Title   := SetCapital(leTitle1.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v1.Artist  := SetCapital(leArtist1.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v1.Album   := SetCapital(leAlbum1.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v1.Year    := SetCapital(leYear1.Text,CaseConvertIndex,edDelimiters.Text);
    Data.ID3v1.GenreID := GetID3v1GenreID(cbGenre1.Text);
    Data.ID3v1.Comment := SetCapital(leComment1.Text,CaseConvertIndex,edDelimiters.Text);

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
      Artist  := SetCapital(leArtist1.Text,CaseConvertIndex,edDelimiters.Text);
      Title   := SetCapital(leTitle1.Text,CaseConvertIndex,edDelimiters.Text);
      Album   := SetCapital(leAlbum1.Text,CaseConvertIndex,edDelimiters.Text);
      Track   := SetCapital(leTrack1.Text,CaseConvertIndex,edDelimiters.Text);
      Year    := SetCapital(leYear1.Text,CaseConvertIndex,edDelimiters.Text);
      Comment := SetCapital(leComment1.Text,CaseConvertIndex,edDelimiters.Text);
      Genre   := cbGenre1.Items[cbGenre1.ItemIndex];
    end;
    if ((cbID3v2.Checked) and (PreferTag = 2)) or ((not cbID3v1.Checked) and (PreferTag = 1)) then begin
      Artist  := SetCapital(leArtist2.Text,CaseConvertIndex,edDelimiters.Text);
      Title   := SetCapital(leTitle2.Text,CaseConvertIndex,edDelimiters.Text);
      Album   := SetCapital(leAlbum2.Text,CaseConvertIndex,edDelimiters.Text);
      Track   := SetCapital(leTrack2.Text,CaseConvertIndex,edDelimiters.Text);
      Year    := SetCapital(leYear2.Text,CaseConvertIndex,edDelimiters.Text);
      Comment := SetCapital(leComment2.Text,CaseConvertIndex,edDelimiters.Text);
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
    with frmMain do begin
      UpdateControls;
      UpdateListView;
      ListView1.Items[SelectedIndex].Selected := true;
      ListView1.Items[SelectedIndex].Focused := True;
      ListView1.Items[SelectedIndex].MakeVisible(False);
    end;
  end;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditTag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ClearAll1;
  ClearAll2;
  Data.Free;
  
  CapitalizationBoxState := cbCapitalization.Checked;
  CapitalizationBoxIndex := cboxCapitalization.ItemIndex;
  WordDelimiterChars := edDelimiters.Text;
  FileFormat := edFileFormat.Text;
  DeleteIfNotEmpty := cbDeleteIfNotEmpty.Checked;

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
var //p:Integer;
    FName:String;
    FTags: FTagArray;
begin
  if Key = VK_ESCAPE then
    Close;

  if Key = VK_RETURN then
    btUpdateClick(Sender);

  if (Shift = [ssCtrl]) and (Key = VK_TAB) then
    FormEditTag.SelectNext(FormEditTag.ActiveControl,False,True);

  if (Shift = [ssCtrl]) and (Key = Ord('Z')) then
    btUndoClick(imSwap);

  if (Shift = [ssAlt])  and (Key = Ord('S')) then
    cbCapitalizationClick(Sender);

  if (Shift = [ssCtrl]) and (Key = VK_UP) then
    imSwapClick(Sender);

  if (Shift = [ssAlt]) and (Key = VK_LEFT) then
    btCopyToClick(Sender);

  if (Shift = [ssAlt]) and (Key = VK_RIGHT) then
    btCopyFromClick(Sender);

  if (Shift = [ssCtrl]) and (Key = VK_DOWN) then begin
    FTags := GetTagFromFileName(ExtractFileName(edPath.Text),edFileFormat.Text);
    if cbID3v1.Checked then begin
      if cbDeleteIfNotEmpty.Checked then begin  //delete content of the fields if there were data in them
        if (leArtist1.Text<>'')  and (FTags[1]='') then
          leArtist1.Text := FTags[1];
        if (leTitle1.Text<>'')   and (FTags[2]='') then
          leTitle1.Text  := FTags[2];
        if (leAlbum1.Text<>'')   and (FTags[3]='') then
          leAlbum1.Text  := FTags[3];
        if (leYear1.Text<>'')    and (FTags[4]='') then
          leYear1.Text   := FTags[4];
        if (leTrack1.Text<>'')   and (FTags[5]='') then
          leTrack1.Text  := FTags[5];
        if (cbGenre1.ItemIndex<>0) and (FTags[7]='') then
          cbGenre1.ItemIndex := GetID3v1GenreID(FTags[6]);
        if (leComment1.Text<>'') and (FTags[7]='') then
          leComment1.Text := FTags[7];
      end;
      //fill the fields if they were empty
//      if (leArtist1.Text='')  and (FTags[1]<>'') then
        leArtist1.Text := FTags[1];
//      if (leTitle1.Text='')   and (FTags[2]<>'') then
        leTitle1.Text  := FTags[2];
//      if (leAlbum1.Text='')   and (FTags[3]<>'') then
        leAlbum1.Text  := FTags[3];
//      if (leYear1.Text='')    and (FTags[4]<>'') then
        leYear1.Text   := FTags[4];
//      if (leTrack1.Text='')   and (FTags[5]<>'') then
        leTrack1.Text  := FTags[5];
//      if (cbGenre1.ItemIndex=0) and (FTags[6]<>'') then
        cbGenre1.ItemIndex := GetID3v1GenreID(FTags[6]);
//      if (leComment1.Text='') and (FTags[7]<>'') then
        leComment1.Text := FTags[7];
    end;


    if cbID3v2.Checked then begin
      if cbDeleteIfNotEmpty.Checked then begin
        if (leArtist2.Text<>'')  and (FTags[1]='') then
          leArtist2.Text := FTags[1];
        if (leTitle2.Text<>'')   and (FTags[2]='') then
          leTitle2.Text  := FTags[2];
        if (leAlbum2.Text<>'')   and (FTags[3]='') then
          leAlbum2.Text  := FTags[3];
        if (leYear2.Text<>'')    and (FTags[4]='') then
          leYear2.Text   := FTags[4];
        if (leTrack2.Text<>'')   and (FTags[5]='') then
          leTrack2.Text  := FTags[5];
        if (cbGenre2.Text<>'') and (FTags[6]='') then
          cbGenre2.Text := FTags[6];
        if (leComment2.Text<>'') and (FTags[7]='') then
          leComment2.Text := FTags[7];
      end;

//      if (leArtist2.Text='')  and (FTags[1]<>'') then
        leArtist2.Text := FTags[1];
//      if (leTitle2.Text='')   and (FTags[2]<>'') then
        leTitle2.Text  := FTags[2];
//      if (leAlbum2.Text='')   and (FTags[3]<>'') then
        leAlbum2.Text  := FTags[3];
//      if (leYear2.Text='')    and (FTags[4]<>'') then
        leYear2.Text   := FTags[4];
//      if (leTrack2.Text='')   and (FTags[5]<>'') then
        leTrack2.Text  := FTags[5];
//      if (cbGenre1.Text='') and (FTags[6]<>'') then
        cbGenre1.Text := FTags[6];
//      if (leComment2.Text='') and (FTags[7]<>'') then
        leComment2.Text := FTags[7];
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
//  if (Sender as TImage).Name = imSwap.Name then
//    cbCapitalization.Checked := not cbCapitalization.Checked;
  cboxCapitalization.Enabled := cbCapitalization.Checked;
  edDelimiters.Enabled := cbCapitalization.Checked;
  if cbCapitalization.Checked then
    cboxCapitalizationChange(Sender);
end;

procedure TFormEditTag.cboxCapitalizationChange(Sender: TObject);
begin
  if cboxCapitalization.ItemIndex = 6 then begin
    leArtist1.Text  := SetCapital(Data.ID3v1.Artist,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leTitle1.Text   := SetCapital(Data.ID3v1.Title,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leAlbum1.Text   := SetCapital(Data.ID3v1.Album,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leYear1.Text    := SetCapital(Data.ID3v1.Year,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leComment1.Text := SetCapital(Data.ID3v1.Comment,cboxCapitalization.ItemIndex,edDelimiters.Text);

    leTrack2.Text     := SetCapital(Data.ID3v2.TrackString,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leArtist2.Text    := SetCapital(Data.ID3v2.Artist,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leTitle2.Text     := SetCapital(Data.ID3v2.Title,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leAlbum2.Text     := SetCapital(Data.ID3v2.Album,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leYear2.Text      := SetCapital(Data.ID3v2.Year,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leComment2.Text   := SetCapital(Data.ID3v2.Comment,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leComposer.Text   := SetCapital(Data.ID3v2.Composer,cboxCapitalization.ItemIndex,edDelimiters.Text);
    //leOrigArtist.Text := Data.ID3v2.Language;
    leCopyright.Text  := SetCapital(Data.ID3v2.Copyright,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leURL.Text        := SetCapital(Data.ID3v2.Link,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leEncodedby.Text  := SetCapital(Data.ID3v2.Encoder,cboxCapitalization.ItemIndex,edDelimiters.Text);
    cbGenre2.Text     := SetCapital(Data.ID3v2.Genre,cboxCapitalization.ItemIndex,edDelimiters.Text);
  end else if cboxCapitalization.ItemIndex <> 6 then begin
    leArtist1.Text  := SetCapital(leArtist1.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leTitle1.Text   := SetCapital(leTitle1.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leAlbum1.Text   := SetCapital(leAlbum1.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leYear1.Text    := SetCapital(leYear1.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leComment1.Text := SetCapital(leComment1.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);

    leTrack2.Text     := SetCapital(leTrack2.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leArtist2.Text    := SetCapital(leArtist2.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leTitle2.Text     := SetCapital(leTitle2.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leAlbum2.Text     := SetCapital(leAlbum2.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leYear2.Text      := SetCapital(leYear2.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leComment2.Text   := SetCapital(leComment2.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leComposer.Text   := SetCapital(leComposer.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    //leOrigArtist.Text := Data.ID3v2.Language;
    leCopyright.Text  := SetCapital(leCopyright.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leURL.Text        := SetCapital(leURL.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leEncodedby.Text  := SetCapital(leEncodedby.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    cbGenre2.Text     := SetCapital(cbGenre2.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
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
