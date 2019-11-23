unit EditOggTag;

interface

uses
  ComCtrls, SysUtils, Windows, Forms,
  Controls, StdCtrls, ExtCtrls, Classes, StrUtils,
  Main, Global, OggVorbis, Helpers, Math, Graphics;

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
    btCancel: TButton;
    gbCapitalization: TGroupBox;
    lbWordDelimiters: TLabel;
    cbCapitalization: TCheckBox;
    cboxCapitalization: TComboBox;
    edDelimiters: TEdit;
    gbMisc: TGroupBox;
    lbFileNameFormat: TLabel;
    leReplaceThis: TLabeledEdit;
    leReplaceForThis: TLabeledEdit;
    btReplace: TButton;
    edFileFormat: TEdit;
    cbDeleteIfNotEmpty: TCheckBox;
    btUndo: TButton;
    imSwap: TImage;
    procedure btCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
    procedure leArtistChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemoEnter(Sender: TObject);
    procedure cboxCapitalizationChange(Sender: TObject);
    procedure cbCapitalizationClick(Sender: TObject);
    procedure btUndoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imSwapClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearAll;
    procedure SetCaptions;
    procedure DisableAll;
    procedure EnableAll;
//    function GetTagFromFileName(FileName,Options:String):FTagArray;

  end;

var
  FormEditOggTag: TFormEditOggTag;
  Data: TOggVorbis;
  NeedUpd: Boolean;
  SelectedNode: TTreeNode;
  TagD: array [1..7] of String;

implementation


{$R *.dfm}

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
        TagA[j].Delim := '.ogg';
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
procedure TFormEditOggTag.DisableAll;
var i: Integer;
begin
  for i := 0 to ComponentCount-1 do try
    TControl(Components[i]).Enabled := False;
    except
  end;
  try
    btCancel.Enabled := True;
    except
  end;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.EnableAll;
var i: Integer;
begin
  for i := 0 to ComponentCount-1 do try
    TControl(Components[i]).Enabled := True;
    except
  end;
  try
    btCancel.Enabled := True;
    except
  end;
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
procedure TFormEditOggTag.btCancelClick(Sender: TObject);
begin
  ClearAll;
  FormEditOggTag.Close;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.FormCreate(Sender: TObject);
begin
  NeedUpd := False;
  ClearAll;
  SetCaptions;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.FormActivate(Sender: TObject);
var BitRate,m, sec: Integer;
    sDuration:String;
    FileTag: TagArray;
    FileData: DataArray;

begin
  ClearAll;
  DisableAll;

  Data := TOggVorbis.Create;
  lePath.Text := GetFilePath(frmMain.GetSelectedNode);//GetFilePath(SelectedNode);

  if FileExists(GetFilePath(frmMain.GetSelectedNode)) then begin
    EnableAll;
    if Data.ReadFromFile( lePath.Text ) = True then begin
      cbCapitalization.Enabled := True;
      cboxCapitalization.Enabled := True;
      edDelimiters.Enabled := True;
      leArtist.SetFocus;
      cbCapitalizationClick(Sender);

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

        TagD[1] := IntToStr(Data.Track);
        TagD[2] := Data.Artist;
        TagD[3] := Data.Title;
        TagD[4] := Data.Album;
        TagD[5] := Data.Date;
        TagD[6] := Data.Comment;
        TagD[7] := Data.Genre;
      end;
      if cbCapitalization.Checked then
        cboxCapitalizationChange(Sender);
    end;
  end else begin
//  if Data.ReadFromFile( lePath.Text ) = False then begin
    MessageBox(Handle, PChar(GetText(310)+#13#10+GetText(311)), PChar('Error'), $00000010);
    FileTag := ExtractTag(TTreeNode(frmMain.GetSelectedNode).Text);
    FileData := ExtractData(TTreeNode(frmMain.GetSelectedNode).Text);
    leTrack.Text     := FileTag[4];
    leArtist.Text    := FileTag[2];
    leTitle.Text     := FileTag[1];
    leAlbum.Text     := FileTag[3];
    leDate.Text      := FileTag[5];
    Memo.Text   := FileTag[6];
    cbGenre.Text     := FileTag[7];
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
//    leArtist.Enabled := False;

    cbCapitalization.Enabled := False;
    cboxCapitalization.Enabled := False;
    edDelimiters.Enabled := False;
    btCancel.SetFocus;
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
var
  FName:String;
  FTags: FTagArray;

begin
  if Key=VK_ESCAPE then
    FormEditOggTag.btCancelClick(Sender);

  if Key=VK_RETURN then
    FormEditOggTag.btUpdateClick(Sender);

  if (Shift = [ssCtrl]) and (Key = VK_TAB) then
    FormEditOggTag.SelectNext(FormEditOggTag.ActiveControl,False,True);

  if (Shift = [ssCtrl]) and (Key = Ord('Z')) then
    btUndoClick(Sender);

  if (Shift = [ssAlt])  and (Key = Ord('S')) then
    cbCapitalizationClick(Sender);

  if (Shift = [ssCtrl]) and (Key = VK_UP) then
    imSwapClick(Sender);

  if (Shift = [ssCtrl]) and (Key = VK_DOWN) then begin
    FTags := GetTagFromFileName(ExtractFileName(lePath.Text),edFileFormat.Text);
    if cbDeleteIfNotEmpty.Checked then begin  //delete content of the fields if there were data in them
      if (leArtist.Text<>'')  and (FTags[1]='') then
        leArtist.Text := FTags[1];
      if (leTitle.Text<>'')   and (FTags[2]='') then
        leTitle.Text  := FTags[2];
      if (leAlbum.Text<>'')   and (FTags[3]='') then
        leAlbum.Text  := FTags[3];
      if (leDate.Text<>'')    and (FTags[4]='') then
        leDate.Text   := FTags[4];
      if (leTrack.Text<>'')   and (FTags[5]='') then
        leTrack.Text  := FTags[5];
      if (cbGenre.ItemIndex<>0) and (FTags[7]='') then
        cbGenre.Text := FTags[6];
      if (Memo.Text<>'') and (FTags[7]='') then
        Memo.Text := FTags[7];
    end;
      //fill the fields if they were empty
//    if (leArtist.Text='')  and (FTags[1]<>'') then
      leArtist.Text := FTags[1];
//    if (leTitle.Text='')   and (FTags[2]<>'') then
      leTitle.Text  := FTags[2];
//    if (leAlbum.Text='')   and (FTags[3]<>'') then
      leAlbum.Text  := FTags[3];
//    if (leDate.Text='')    and (FTags[4]<>'') then
      leDate.Text   := FTags[4];
//    if (leTrack.Text='')   and (FTags[5]<>'') then
      leTrack.Text  := FTags[5];
//    if (cbGenre.ItemIndex=0) and (FTags[6]<>'') then
      cbGenre.Text := FTags[6];
//    if (Memo.Text='') and (FTags[7]<>'') then
      Memo.Text := FTags[7];
  end;
end;
{ --------------------------------------------------------------------------- }
procedure TFormEditOggTag.SetCaptions;
var i:Integer;
    TempStr: WideString;
begin
  leArtist.EditLabel.Caption := GetText(043);
  leTitle.EditLabel.Caption := GetText(042);
  leAlbum.EditLabel.Caption := GetText(044);
  leTrack.EditLabel.Caption := GetText(045) + '#';
  leDate.EditLabel.Caption := GetText(174);
  lePath.EditLabel.Caption := GetText(217);
  lbGenre.Caption := GetText(239);
  lbComment.Caption := GetText(047);
  btCancel.Caption := GetText(093);
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

  leReplaceThis.EditLabel.Caption := GetText(249);
  btUpdate.Caption                := GetText(299);
  btCancel.Caption                := GetText(057);
  btUndo.Caption                  := GetText(300);

  lbFileNameFormat.Caption        := GetText(333);
  gbMisc.Caption                  := GetText(205);
  cbDeleteIfNotEmpty.Caption      := GetText(334);
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
  imSwap.Hint                     := GetText(329);

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
procedure TFormEditOggTag.MemoEnter(Sender: TObject);
begin
  Memo.SelectAll;
end;

procedure TFormEditOggTag.cboxCapitalizationChange(Sender: TObject);
begin
  if cboxCapitalization.ItemIndex = 6 then begin
    leArtist.Text  := SetCapital(Data.Artist,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leTitle.Text   := SetCapital(Data.Title,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leAlbum.Text   := SetCapital(Data.Album,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leDate.Text    := SetCapital(Data.Date,cboxCapitalization.ItemIndex,edDelimiters.Text);
    cbGenre.Text   := SetCapital(Data.Genre,cboxCapitalization.ItemIndex,edDelimiters.Text);
    Memo.Text      := SetCapital(Data.Comment,cboxCapitalization.ItemIndex,edDelimiters.Text);
  end else if cboxCapitalization.ItemIndex <> 6 then begin
    leArtist.Text  := SetCapital(leArtist.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leTitle.Text   := SetCapital(leTitle.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leAlbum.Text   := SetCapital(leAlbum.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    leDate.Text    := SetCapital(leDate.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    cbGenre.Text   := SetCapital(cbGenre.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
    Memo.Text      := SetCapital(Memo.Text,cboxCapitalization.ItemIndex,edDelimiters.Text);
 end;

end;

procedure TFormEditOggTag.cbCapitalizationClick(Sender: TObject);
begin
  cboxCapitalization.Enabled := cbCapitalization.Checked;
  edDelimiters.Enabled := cbCapitalization.Checked;
  if cbCapitalization.Checked then
    cboxCapitalizationChange(Sender);
end;

procedure TFormEditOggTag.btUndoClick(Sender: TObject);
begin
  leTrack.Text  := TagD[1];
  leArtist.Text := TagD[2];
  leTitle.Text  := TagD[3];
  leAlbum.Text  := TagD[4];
  leDate.Text   := TagD[5];
  Memo.Text     := TagD[6];
  cbGenre.Text  := TagD[7];
end;

procedure TFormEditOggTag.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i: Byte;
begin
  ClearAll;
  Data.Free;
  for i := 1 to 7 do
    TagD[i] := '';
end;

procedure TFormEditOggTag.imSwapClick(Sender: TObject);
var TmpStr: String;
begin
  TmpStr         := leArtist.Text;
  leArtist.Text := leTitle.Text;
  leTitle.Text  := TmpStr;
end;

end.
