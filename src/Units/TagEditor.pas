unit TagEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FileCtrl, ComCtrls, FolderTree, Global,
  MessageDialog, WaitWindow, ID3v1, ID3v2, APEtag, FLACfile, OggVorbis, Filter, FilenameToTag,
  AutoNumber, TagPreview, RemTags, StrUtils, ImgList, Freedb, RepTagDialog;

type
  TfrmTagger = class(TForm)
    gbSearch: TGroupBox;
    gbTag: TGroupBox;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    cbTitle: TComboBox;
    lTitle: TLabel;
    cbArtist: TComboBox;
    cbAlbum: TComboBox;
    cbTrack: TComboBox;
    cbYear: TComboBox;
    cbComment: TComboBox;
    lArtist: TLabel;
    lAlbum: TLabel;
    lTrack: TLabel;
    lYear: TLabel;
    lComment: TLabel;
    gbCapitalize: TGroupBox;
    cbCapitalize: TComboBox;
    gbWizards: TGroupBox;
    gbReplace: TGroupBox;
    cbGenre: TComboBox;
    lGenre: TLabel;
    ListView1: TListView;
    bFile2Tag: TButton;
    cbUseReplacement: TCheckBox;
    bFilter: TButton;
    FolderTree1: TFolderTree;
    FileListBox1: TFileListBox;
    ListView2: TListView;
    bOK: TButton;
    bCancel: TButton;
    bNumberation: TButton;
    ListBox1: TListBox;
    cbSecify: TCheckBox;
    cbCapsTitle: TCheckBox;
    cbCapsArtist: TCheckBox;
    cbCapsAlbum: TCheckBox;
    cbCapsComment: TCheckBox;
    cbOnlyExisting: TCheckBox;
    bClear: TButton;
    bRemTags: TButton;
    Image8: TImage;
    bFreedb: TButton;
    ImageList1: TImageList;
    bExceptions: TButton;
    procedure FormCreate(Sender: TObject);
    procedure WriteAPE (Filename: String);
    procedure WriteID3v1(Filename: String);
    procedure WriteID3v2(Filename: String);
    procedure WriteVorbis(Filename: String);

    procedure bOKClick(Sender: TObject);

    procedure CheckExt;
    procedure bFilterClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FolderTree1Change(Sender: TObject; Node: TTreeNode);
    procedure cbUseReplacementClick(Sender: TObject);
    procedure SelectTagVersion(Extention, TheFile: String);
    procedure bFile2TagClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function UpperCaseWords(InString: String): String;
    function UpperCaseFirstWord(InString: String): String;
    procedure StartFilename2Tag;
    procedure cbSecifyClick(Sender: TObject);
    procedure cbOnlyExistingClick(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure cbCapitalizeChange(Sender: TObject);
    procedure bNumberationClick(Sender: TObject);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bRemTagsClick(Sender: TObject);
    procedure RemoveTags(ThisFile: String);
    function GetOggTag(const FileName: string; LengthLimit: integer): TagArray;
    procedure bFreedbClick(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure ListView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure bExceptionsClick(Sender: TObject);
    procedure LoadCaseExceptions;
    function GoCaseException(Check: String): String;

  private
     procedure UpdateFolder;
     function SaveFilter (Filename: String):boolean;
     function LoadFilterOK (Filename: String):boolean;
  public
     
  end;

     procedure ShowTagEditor; overload;
     procedure ShowTagEditor (Folder: String);  overload;
     function GetID3v1GenreID(Genre: String): Byte;

implementation
{$R *.dfm}
var ID3v1: TID3v1;
    ID3v2: TID3v2;
    APEtag: TAPEtag;
    VorbisTag: TOggVorbis;
    FromTagArray, UseOnlyExistingTags, Testmode: Boolean;
    FilenameTag: TagArray;
    FilterFile2: string = 'tag.flt';
    CaseExceptions: TStrings;

procedure TfrmTagger.FormCreate(Sender: TObject);
begin
        FromTagArray:=false;
        UseOnlyExistingTags:=false;
        Caption := GetText(29);
        gbSearch.Caption := GetText(89);
        gbTag.Caption := GetText(90);
        lTitle.Caption := GetText(42);
        lArtist.Caption := GetText(43);
        lAlbum.Caption := GetText(44);
        lTrack.Caption := GetText(45);
        lYear.Caption := GetText(46);
        lComment.Caption := GetText(47);
        lGenre.Caption := GetText(239);
        bOK.Caption := GetText(54);
        bCancel.Caption := GetText(57);
        gbCapitalize.Caption := GetText(243);
        cbCapitalize.Items[0] := GetText(244);
        cbCapitalize.Items[1] := GetText(245);
        cbCapitalize.Items[2] := GetText(246);
        cbCapitalize.Items[3] := GetText(247);
        cbCapitalize.Items[4] := GetText(248);
        cbCapitalize.ItemIndex:= 0;
        gbReplace.Caption := GetText(249);
        cbUseReplacement.Caption := GetText(250);
        gbWizards.Caption := GetText(251);
        bFile2Tag.Caption := GetText(252);
        bNumberation.Caption := GetText(253);
        bRemTags.Caption := GetText(254);
        bFreedb.Caption := GetText(293);
        cbOnlyExisting.Caption := GetText(255);
        cbSecify.Caption := GetText(276);
        bExceptions.Caption := GetText(256);
        bFilter.Caption := GetText(229);
        ListView1.Columns[0].Caption := GetText(105);
        ListView1.Columns[1].Caption := GetText(42);
        ListView1.Columns[2].Caption := GetText(43);
        ListView1.Columns[3].Caption := GetText(44);
        ListView1.Columns[4].Caption := GetText(45);
        ListView1.Columns[5].Caption := GetText(46);
        ListView1.Columns[6].Caption := GetText(47);
        ListView1.Columns[7].Caption := GetText(239);
        cbTitle.Items[0] := GetText(257);
        cbArtist.Items[0] := GetText(257);
        cbAlbum.Items[0] := GetText(257);
        cbTrack.Items[0] := GetText(257);
        cbYear.Items[0] := GetText(257);
        cbGenre.Items[0] := GetText(257);
        cbComment.Items[0] := GetText(257);
        bClear.Caption := GetText(258);
        FileListBox1.Mask := FileMask + ';' + MPPFileMask + ';*.ogg;' + MonkeyMask;
        FolderTree1.Anchors:=[akLeft,akTop,akBottom];
        FolderTree1.SetDirectory(LastEditDir);
        LoadFilterOK(RootD + FilterFile2);
        LoadCaseExceptions;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	if not SaveFilter(RootD + FilterFile2) then
		Dialog(GetText(77) + ': ' + RootD + FilterFile2, GetText(51), GetText(54), '', '', 1, 2);
end;

{ ********************* Writing Tags ******************** }

procedure TfrmTagger.WriteAPE(Filename: String);
var Index: Integer;
begin
     APEtag.ResetData;
     APEtag.ReadFromFile(Filename);
     if not FromTagArray then
     begin
      if cbTitle.Text<>'' then if cbTitle.ItemIndex=0 then APEtag.Title:='' else APEtag.Title:=cbTitle.Text;
      if cbArtist.Text<>'' then if cbArtist.ItemIndex=0 then APEtag.Artist:='' else APEtag.Artist:=cbArtist.Text;
      if cbAlbum.Text<>'' then if cbAlbum.ItemIndex=0 then APEtag.Album:='' else APEtag.Album:=cbAlbum.Text;
      if cbYear.Text<>'' then if cbYear.ItemIndex=0 then APEtag.Year:='' else APEtag.Year:=cbYear.Text;
      if cbGenre.Text<>'' then if cbGenre.ItemIndex=0 then APEtag.Genre:='' else APEtag.Genre:=cbGenre.Text;
      if cbComment.Text<>'' then if cbComment.ItemIndex=0 then APEtag.Comment:='' else APEtag.Comment:=cbComment.Text;
      if cbTrack.Text<>'' then if cbTrack.ItemIndex=0 then APEtag.Track:=0 else
        try APETag.Track:=StrToInt(cbTrack.Text);
        except
        end;
     end
     else
     begin
        if FilenameTag[1]<>'' then APETag.Title:=FilenameTag[1];
        if FilenameTag[2]<>'' then APETag.Artist:=FilenameTag[2];
        if FilenameTag[3]<>'' then APETag.Album:=FilenameTag[3];
        if FilenameTag[4]<>'' then APETag.Track:=StrToInt(FilenameTag[4]);
        if FilenameTag[5]<>'' then APETag.Year:=FilenameTag[5];
        if FilenameTag[6]<>'' then APETag.Comment:=FilenameTag[6];
        if FilenameTag[7]<>'' then APETag.Genre:=FilenameTag[7];
     end;
      if cbCapitalize.ItemIndex>0 then
      begin
        Case cbCapitalize.ItemIndex of
         1: begin
              if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then APETag.Title:=UpperCaseWords(APETag.Title);
              if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then APETag.Artist:=UpperCaseWords(APETag.Artist);
              if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then APETag.Album:=UpperCaseWords(APETag.Album);
              if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then APETag.Comment:=UpperCaseWords(APETag.Comment);
            end;
         2: begin
              if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then APETag.Title:=UpperCaseFirstWord(APETag.Title);
              if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then APETag.Artist:=UpperCaseFirstWord(APETag.Artist);
              if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then APETag.Album:=UpperCaseFirstWord(APETag.Album);
              if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then APETag.Comment:=UpperCaseFirstWord(APETag.Comment);
            end;
         3: begin
             if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then APETag.Title:=WideLowerCase(APETag.Title);
             if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then APETag.Artist:=WideLowerCase(APETag.Artist);
             if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then APETag.Album:=WideLowerCase(APETag.Album);
             if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then APETag.Comment:=WideLowerCase(APETag.Comment);
            end;
         4: begin
             if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then APETag.Title:=WideUpperCase(APETag.Title);
             if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then APETag.Artist:=WideUpperCase(APETag.Artist);
             if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then APETag.Album:=WideUpperCase(APETag.Album);
             if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then APETag.Comment:=WideUpperCase(APETag.Comment);
            end;
        end;

       if cbCapitalize.ItemIndex<>0 then
       begin
        APETag.Title := GoCaseException(APETag.Title);
        APETag.Artist := GoCaseException(APETag.Artist);
        APETag.Album := GoCaseException(APETag.Album);
        APETag.Comment := GoCaseException(APETag.Comment);
       end;

      end;
      if cbUseReplacement.checked then
      begin
        for Index := 1 to ListView2.Items.Count do
         begin
          APETag.Title:=AnsiReplaceStr(APETag.Title,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          APETag.Artist:=AnsiReplaceStr(APETag.Artist,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          APETag.Album:=AnsiReplaceStr(APETag.Album,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          APETag.Comment:=AnsiReplaceStr(APETag.Comment,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
         end;
      end;
     if Testmode then
      begin
        FilenameTag[1]:=APETag.Title;
        FilenameTag[2]:=APETag.Artist;
        FilenameTag[3]:=APETag.Album;
        FilenameTag[4]:=IntToStr(APETag.Track);
        FilenameTag[5]:=APETag.Year;
        FilenameTag[6]:=APETag.Comment;
        FilenameTag[7]:=APETag.Genre;
        frmPreview.AddTagEntry(FilenameTag,Filename,'APE 1');
      end
     else
     APEtag.SaveToFile(Filename);
     APEtag.ResetData;
end;

procedure TfrmTagger.WriteID3v1(Filename: String);
var Index: Integer;
begin
     ID3v1.ReadFromFile(Filename);
     if not FromTagArray then
     begin
       if cbTitle.Text<>'' then if cbTitle.ItemIndex=0 then ID3v1.Title:='' else ID3v1.Title:=cbTitle.Text;
       if cbArtist.Text<>'' then if cbArtist.ItemIndex=0 then ID3v1.Artist:='' else ID3v1.Artist:=cbArtist.Text;
       if cbAlbum.Text<>'' then if cbAlbum.ItemIndex=0 then ID3v1.Album:='' else ID3v1.Album:=cbAlbum.Text;
       if cbYear.Text<>'' then if cbYear.ItemIndex=0 then ID3v1.Year:='' else ID3v1.Year:=cbYear.Text;
       if cbGenre.Text<>'' then if cbGenre.ItemIndex=0 then ID3v1.GenreID:=null else ID3v1.GenreID:= GetID3v1GenreID(cbGenre.Text);
       if cbComment.Text<>'' then if cbComment.ItemIndex=0 then ID3v1.Comment:='' else ID3v1.Comment:=cbComment.Text;
       if cbTrack.Text<>'' then if cbTrack.ItemIndex=0 then ID3v1.Track:=0 else
        try ID3v1.Track:=StrToInt(cbTrack.Text);
        except
        end;
     end
      else
      begin
        if FilenameTag[1]<>'' then ID3v1.Title:=FilenameTag[1];
        if FilenameTag[2]<>'' then ID3v1.Artist:=FilenameTag[2];
        if FilenameTag[3]<>'' then ID3v1.Album:=FilenameTag[3];
        if FilenameTag[4]<>'' then ID3v1.Track:=StrToInt(FilenameTag[4]);
        if FilenameTag[5]<>'' then ID3v1.Year:=FilenameTag[5];
        if FilenameTag[6]<>'' then ID3v1.Comment:=FilenameTag[6];
        if FilenameTag[7]<>'' then ID3v1.GenreID:=GetID3v1GenreID(FilenameTag[7]);
      end;
      if cbCapitalize.ItemIndex>0 then
      begin
        Case cbCapitalize.ItemIndex of
         1: begin
              if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then ID3v1.Title:=UpperCaseWords(ID3v1.Title);
              if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then ID3v1.Artist:=UpperCaseWords(ID3v1.Artist);
              if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then ID3v1.Album:=UpperCaseWords(ID3v1.Album);
              if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then ID3v1.Comment:=UpperCaseWords(ID3v1.Comment);
            end;
         2: begin
              if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then ID3v1.Title:=UpperCaseFirstWord(ID3v1.Title);
              if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then ID3v1.Artist:=UpperCaseFirstWord(ID3v1.Artist);
              if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then ID3v1.Album:=UpperCaseFirstWord(ID3v1.Album);
              if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then ID3v1.Comment:=UpperCaseFirstWord(ID3v1.Comment);
            end;
         3: begin
             if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then ID3v1.Title:=WideLowerCase(ID3v1.Title);
             if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then ID3v1.Artist:=WideLowerCase(ID3v1.Artist);
             if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then ID3v1.Album:=WideLowerCase(ID3v1.Album);
             if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then ID3v1.Comment:=WideLowerCase(ID3v1.Comment);
            end;
         4: begin
             if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then ID3v1.Title:=WideUpperCase(ID3v1.Title);
             if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then ID3v1.Artist:=WideUpperCase(ID3v1.Artist);
             if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then ID3v1.Album:=WideUpperCase(ID3v1.Album);
             if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then ID3v1.Comment:=WideUpperCase(ID3v1.Comment);
            end;
        end;
       if cbCapitalize.ItemIndex<>0 then
       begin
        ID3v1.Title:=GoCaseException(ID3v1.Title);
        ID3v1.Artist:=GoCaseException(ID3v1.Artist);
        ID3v1.Album:=GoCaseException(ID3v1.Album);
        ID3v1.Comment:= GoCaseException(ID3v1.Comment);
       end;
      end;
      if cbUseReplacement.checked then
      begin
        for Index := 1 to ListView2.Items.Count do
         begin
          ID3v1.Title:=AnsiReplaceStr(APETag.Title,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          ID3v1.Artist:=AnsiReplaceStr(APETag.Artist,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          ID3v1.Album:=AnsiReplaceStr(APETag.Album,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          ID3v1.Comment:=AnsiReplaceStr(APETag.Comment,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
         end;
      end;
     if Testmode then
      begin
        FilenameTag[1]:=ID3v1.Title;
        FilenameTag[2]:=ID3v1.Artist;
        FilenameTag[3]:=ID3v1.Album;
        FilenameTag[4]:=IntToStr(ID3v1.Track);
        FilenameTag[5]:=ID3v1.Year;
        FilenameTag[6]:=ID3v1.Comment;
        FilenameTag[7]:=ID3v1.Genre;
        frmPreview.AddTagEntry(FilenameTag,Filename,'ID3v1');
      end
     else
     if not ID3v1.SaveToFile(Filename) then raise Exception.Create('');
     ID3v1.ResetData;
end;

procedure TfrmTagger.WriteID3v2(Filename: String);
var Index: Integer;
begin
     ID3v2.ReadFromFile(Filename);
     if not FromTagArray then
     begin
       if cbTitle.Text<>'' then if cbTitle.ItemIndex=0 then ID3v2.Title:='' else ID3v2.Title:=cbTitle.Text;
       if cbArtist.Text<>'' then if cbArtist.ItemIndex=0 then ID3v2.Artist:='' else ID3v2.Artist:=cbArtist.Text;
       if cbAlbum.Text<>'' then if cbAlbum.ItemIndex=0 then ID3v2.Album:='' else ID3v2.Album:=cbAlbum.Text;
       if cbYear.Text<>'' then if cbYear.ItemIndex=0 then ID3v2.Year:='' else ID3v2.Year:=cbYear.Text;
       if cbGenre.Text<>'' then if cbGenre.ItemIndex=0 then ID3v2.Genre:='' else ID3v2.Genre:=cbGenre.Text;
       if cbComment.Text<>'' then if cbComment.ItemIndex=0 then ID3v2.Comment:='' else ID3v2.Comment:=cbComment.Text;
       if cbTrack.Text<>'' then if cbTrack.ItemIndex=0 then ID3v2.Track:=0 else
        try ID3v2.Track:=StrToInt(cbTrack.Text);
        except
        end;
      end
      else
      begin
        if FilenameTag[1]<>'' then ID3v2.Title:=FilenameTag[1];
        if FilenameTag[2]<>'' then ID3v2.Artist:=FilenameTag[2];
        if FilenameTag[3]<>'' then ID3v2.Album:=FilenameTag[3];
        if FilenameTag[4]<>'' then ID3v2.Track:=StrToInt(FilenameTag[4]);
        if FilenameTag[5]<>'' then ID3v2.Year:=FilenameTag[5];
        if FilenameTag[6]<>'' then ID3v2.Comment:=FilenameTag[6];
        if FilenameTag[7]<>'' then ID3v2.Genre:=FilenameTag[7];
      end;
      if cbCapitalize.ItemIndex>0 then
      begin
        Case cbCapitalize.ItemIndex of
         1: begin
              if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then ID3v2.Title:=UpperCaseWords(ID3v2.Title);
              if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then ID3v2.Artist:=UpperCaseWords(ID3v2.Artist);
              if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then ID3v2.Album:=UpperCaseWords(ID3v2.Album);
              if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then ID3v2.Comment:=UpperCaseWords(ID3v2.Comment);
            end;
         2: begin
              if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then ID3v2.Title:=UpperCaseFirstWord(ID3v2.Title);
              if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then ID3v2.Artist:=UpperCaseFirstWord(ID3v2.Artist);
              if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then ID3v2.Album:=UpperCaseFirstWord(ID3v2.Album);
              if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then ID3v2.Comment:=UpperCaseFirstWord(ID3v2.Comment);
            end;
         3: begin
             if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then ID3v2.Title:=WideLowerCase(ID3v2.Title);
             if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then ID3v2.Artist:=WideLowerCase(ID3v2.Artist);
             if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then ID3v2.Album:=WideLowerCase(ID3v2.Album);
             if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then ID3v2.Comment:=WideLowerCase(ID3v2.Comment);
            end;
         4: begin
             if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then ID3v2.Title:=WideUpperCase(ID3v2.Title);
             if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then ID3v2.Artist:=WideUpperCase(ID3v2.Artist);
             if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then ID3v2.Album:=WideUpperCase(ID3v2.Album);
             if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then ID3v2.Comment:=WideUpperCase(ID3v2.Comment);
            end;
        end;
       if cbCapitalize.ItemIndex<>0 then
       begin
        ID3v2.Title := GoCaseException(ID3v2.Title);
        ID3v2.Artist := GoCaseException(ID3v2.Artist);
        ID3v2.Album := GoCaseException(ID3v2.Album);
        ID3v2.Comment := GoCaseException(ID3v2.Comment);
       end;
      end;
      if cbUseReplacement.checked then
      begin
        for Index := 1 to ListView2.Items.Count do
         begin
          ID3v2.Title:=AnsiReplaceStr(ID3v2.Title,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          ID3v2.Artist:=AnsiReplaceStr(ID3v2.Artist,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          ID3v2.Album:=AnsiReplaceStr(ID3v2.Album,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          ID3v2.Comment:=AnsiReplaceStr(ID3v2.Comment,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
         end;
      end;
     if Testmode then
      begin
        FilenameTag[1]:=ID3v2.Title;
        FilenameTag[2]:=ID3v2.Artist;
        FilenameTag[3]:=ID3v2.Album;
        FilenameTag[4]:=IntToStr(ID3v2.Track);
        FilenameTag[5]:=ID3v2.Year;
        FilenameTag[6]:=ID3v2.Comment;
        FilenameTag[7]:=ID3v2.Genre;
        frmPreview.AddTagEntry(FilenameTag,Filename,'ID3v2');
      end
     else
     if not ID3v2.SaveToFile(Filename) then raise Exception.Create('');
     ID3v2.ResetData;
end;

procedure TfrmTagger.WriteVorbis(Filename: String);
var Index: Integer;
begin
     VorbisTag.ReadFromFile(Filename);
     if not FromTagArray then
     begin
         if cbTitle.Text<>'' then if cbTitle.ItemIndex=0 then VorbisTag.Title:='' else VorbisTag.Title:=cbTitle.Text;
         if cbArtist.Text<>'' then if cbArtist.ItemIndex=0 then VorbisTag.Artist:='' else VorbisTag.Artist:=cbArtist.Text;
         if cbAlbum.Text<>'' then if cbAlbum.ItemIndex=0 then VorbisTag.Album:='' else VorbisTag.Album:=cbAlbum.Text;
         if cbYear.Text<>'' then if cbYear.ItemIndex=0 then VorbisTag.Date:='' else VorbisTag.Date:=cbYear.Text;
         if cbGenre.Text<>'' then if cbGenre.ItemIndex=0 then VorbisTag.Genre:='' else VorbisTag.Genre:=cbGenre.Text;
         if cbComment.Text<>'' then if cbComment.ItemIndex=0 then VorbisTag.Comment:='' else VorbisTag.Comment:=cbComment.Text;
         if cbTrack.Text<>'' then if cbTrack.ItemIndex=0 then VorbisTag.Track:=0 else
        try VorbisTag.SaveTag(Filename);
        except
        end;
      end
      else
       begin
        if FilenameTag[1]<>'' then VorbisTag.Title:=FilenameTag[1];
        if FilenameTag[2]<>'' then VorbisTag.Artist:=FilenameTag[2];
        if FilenameTag[3]<>'' then VorbisTag.Album:=FilenameTag[3];
        if FilenameTag[4]<>'' then VorbisTag.Track:=StrToInt(FilenameTag[4]);
        if FilenameTag[5]<>'' then VorbisTag.Date:=FilenameTag[5];
        if FilenameTag[6]<>'' then VorbisTag.Comment:=FilenameTag[6];
        if FilenameTag[7]<>'' then VorbisTag.Genre:=FilenameTag[7];
       end;
       if cbCapitalize.ItemIndex>0 then
       begin
        Case cbCapitalize.ItemIndex of
         1: begin
              if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then VorbisTag.Title:=UpperCaseWords(VorbisTag.Title);
              if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then VorbisTag.Artist:=UpperCaseWords(VorbisTag.Artist);
              if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then VorbisTag.Album:=UpperCaseWords(VorbisTag.Album);
              if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then VorbisTag.Comment:=UpperCaseWords(VorbisTag.Comment);
            end;
         2: begin
              if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then VorbisTag.Title:=UpperCaseFirstWord(VorbisTag.Title);
              if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then VorbisTag.Artist:=UpperCaseFirstWord(VorbisTag.Artist);
              if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then VorbisTag.Album:=UpperCaseFirstWord(VorbisTag.Album);
              if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then VorbisTag.Comment:=UpperCaseFirstWord(VorbisTag.Comment);
            end;
         3: begin
             if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then VorbisTag.Title:=WideLowerCase(VorbisTag.Title);
             if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then VorbisTag.Artist:=WideLowerCase(VorbisTag.Artist);
             if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then VorbisTag.Album:=WideLowerCase(VorbisTag.Album);
             if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then VorbisTag.Comment:=WideLowerCase(VorbisTag.Comment);
            end;
         4: begin
             if ((not cbSecify.Checked)or(cbCapsTitle.Checked)) then VorbisTag.Title:=WideUpperCase(VorbisTag.Title);
             if ((not cbSecify.Checked)or(cbCapsArtist.Checked)) then VorbisTag.Artist:=WideUpperCase(VorbisTag.Artist);
             if ((not cbSecify.Checked)or(cbCapsAlbum.Checked)) then VorbisTag.Album:=WideUpperCase(VorbisTag.Album);
             if ((not cbSecify.Checked)or(cbCapsComment.Checked)) then VorbisTag.Comment:=WideUpperCase(VorbisTag.Comment);
            end;
         end;
       if cbCapitalize.ItemIndex<>0 then
       begin
        VorbisTag.Title := GoCaseException(VorbisTag.Title);
        VorbisTag.Artist := GoCaseException(VorbisTag.Artist);
        VorbisTag.Album := GoCaseException(VorbisTag.Album);
        VorbisTag.Comment := GoCaseException(VorbisTag.Comment);
       end;
      end;
      if cbUseReplacement.checked then
      begin
        for Index := 1 to ListView2.Items.Count do
         begin
          VorbisTag.Title:=AnsiReplaceStr(VorbisTag.Title,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          VorbisTag.Artist:=AnsiReplaceStr(VorbisTag.Artist,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          VorbisTag.Album:=AnsiReplaceStr(VorbisTag.Album,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
          VorbisTag.Comment:=AnsiReplaceStr(VorbisTag.Comment,ListView2.Items[Index - 1].Caption,ListView2.Items[Index - 1].SubItems.Strings[0]);
         end;
      end;
     if Testmode then
      begin
        FilenameTag[1]:=VorbisTag.Title;
        FilenameTag[2]:=VorbisTag.Artist;
        FilenameTag[3]:=VorbisTag.Album;
        FilenameTag[4]:=IntToStr(VorbisTag.Track);
        FilenameTag[5]:=VorbisTag.Date;
        FilenameTag[6]:=VorbisTag.Comment;
        FilenameTag[7]:=VorbisTag.Genre;
        frmPreview.AddTagEntry(FilenameTag,Filename,'Vorbis');
      end   
     else
     if not VorbisTag.SaveTag(Filename) then raise Exception.Create('');
end;


// -----------------------------------------------------------------------------

procedure TfrmTagger.UpdateFolder;
var
	Index, Index2: integer;
  Item: TListItem;
  Path: string;
  FileTag: TagArray;
begin
	try
  	if not DirectoryExists(FolderTree1.Directory) then raise Exception.Create('');
		FileListBox1.Directory := FolderTree1.Directory;
    FileListBox1.Update;

		if Length(FileListBox1.Directory) = 3 then Path := FileListBox1.Directory
		else Path := FileListBox1.Directory + '\';

		if FileListBox1.Items.Count > 0 then
    begin
			ListView1.Items.BeginUpdate;
			ShowWaitWindow(GetText(58));
			SetWaitWindowText(GetText(79) + '...');
      ListView1.Items.Clear;

	    for Index := 1 to FileListBox1.Items.Count do
  	  begin
    		Item := ListView1.Items.Add;
      	Item.Caption := FileListBox1.Items.Strings[Index - 1];
        FileTag := GetFileTag(Path + Item.Caption, 0, -1);
        if WidelowerCase(ExtractFileExt(Item.Caption))='.ogg' then FileTag := GetOggTag(Path + Item.Caption, 0);
        for Index2 := 1 to 7 do Item.SubItems.Add(FileTag[Index2]);
        Item.SubItems.Add(Path + Item.Caption);
        Item.SubItems.Add('');
        Item.SubItems.Add(Chr(Index));
	    end;

    	Tag := 0;
      ListView1.AlphaSort;
      CloseWaitWindow;
      ListView1.Items.EndUpdate;

	    ListView1.Enabled := true;
  	  ListView1.Items[0].Focused := true;
    end
    else
    begin
    	ListView1.Items.Clear;
    	ListView1.Enabled := false;
    end;
  except
  	ListView1.Items.Clear;
    ListView1.Enabled := false;
  end;

end;

// -----------------------------------------------------------------------------

procedure ShowTagEditor;
begin
	with TfrmTagger.Create(Application) do
		try ShowModal;
		finally Release;
	end;
end;

procedure ShowTagEditor(Folder: String);
begin
	with TfrmTagger.Create(Application) do
		try FolderTree1.SetDirectory(Folder);
        ShowModal;
		finally Release;
	end;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.bOKClick(Sender: TObject);
begin
        ShowWaitWindow(GetText(259));
        SetWaitWindowText(GetText(79) + '...');
        CheckExt;
        CloseWaitWindow;
        UpdateFolder;
        LastEditDir:=FolderTree1.Directory;
end;


procedure TfrmTagger.CheckExt;
var Index: integer;
    Path: String;
begin

  for Index:=0 to ListView1.Items.Count-1 do
    begin
      if ListView1.Items[Index].Selected then
       begin
         Path:=ListView1.Items[Index].SubItems[7];
         if FileExists(Path) then
          begin
           SelectTagVersion(WidelowerCase(ExtractFileExt(Path)),Path);
          end;
       end;
    end;

end;

procedure TfrmTagger.SelectTagVersion(Extention, TheFile: String);
begin
  ID3v1:=TID3v1.Create;
  ID3v2:=TID3v2.Create;
  APEtag:=TAPEtag.Create;
  VorbisTag:=TOggVorbis.Create;
 if UseOnlyExistingTags then
  begin
     if (ID3v1.ReadFromFile(TheFile))and(ID3v1.Exists) then WriteID3v1(TheFile);
     if (ID3v2.ReadFromFile(TheFile))and(ID3v2.Exists) then WriteID3v2(TheFile);
     if (APEtag.ReadFromFile(TheFile))and(APEtag.Exists) then WriteAPE(TheFile);
     if (VorbisTag.ReadFromFile(TheFile))and(VorbisTag.Valid) then WriteVorbis(TheFile);
  end
 else
  begin
  
    MP3TagWrite := 1;
    if Extention='.mp3' then
    case MP3TagWrite of
     1: WriteID3v1(TheFile);
     2: WriteID3v2(TheFile);
     3: begin
         WriteID3v1(TheFile);
         WriteID3v2(TheFile);
        end;
     4: WriteAPE(TheFile);
     5: begin
         WriteID3v1(TheFile);
         WriteAPE(TheFile);
        end;
     6: begin
         WriteAPE(TheFile);
         WriteID3v2(TheFile);
        end;
     7: begin
         WriteAPE(TheFile);
         WriteID3v1(TheFile);
         WriteID3v2(TheFile);
        end;
    end;

    if (Extention='.mpc')or(Extention='.mp+')or(Extention='.ape') then WriteAPE(TheFile);
    if Extention='.ogg' then WriteVorbis(TheFile);
  end;

    ID3v1.Free;
    ID3v2.Free;
    APEtag.Free;
    VorbisTag.Free;
end;



// -----------------------------------------------------------------------------


procedure TfrmTagger.bFilterClick(Sender: TObject);
begin
  SetFilter(ListView2);
end;

// -----------------------------------------------------------------------------


procedure TfrmTagger.bCancelClick(Sender: TObject);
begin
      Close;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
  var    TagContent: String;
begin
if not Selected then
   begin
      TagContent:=Item.SubItems.Strings[0];
    	if (TagContent<>'')and(cbTitle.Items.IndexOf(TagContent)>0) then cbTitle.Items.Delete(cbTitle.Items.IndexOf(TagContent));
      TagContent:=Item.SubItems.Strings[1];
    	if (TagContent<>'')and(cbArtist.Items.IndexOf(TagContent)>0) then cbArtist.Items.Delete(cbArtist.Items.IndexOf(TagContent));
      TagContent:=Item.SubItems.Strings[2];
    	if (TagContent<>'')and(cbAlbum.Items.IndexOf(TagContent)>0) then cbAlbum.Items.Delete(cbAlbum.Items.IndexOf(TagContent));
      TagContent:=Item.SubItems.Strings[3];
    	if (TagContent<>'')and(cbTrack.Items.IndexOf(TagContent)>0) then cbTrack.Items.Delete(cbTrack.Items.IndexOf(TagContent));
      TagContent:=Item.SubItems.Strings[4];
    	if (TagContent<>'')and(cbYear.Items.IndexOf(TagContent)>0) then cbYear.Items.Delete(cbYear.Items.IndexOf(TagContent));
      TagContent:=Item.SubItems.Strings[5];
    	if (TagContent<>'')and(cbComment.Items.IndexOf(TagContent)>0) then cbComment.Items.Delete(cbComment.Items.IndexOf(TagContent));
   end
else
   begin
      TagContent:=Item.SubItems.Strings[0];
    	if (TagContent<>'')and(cbTitle.Items.IndexOf(TagContent)<0) then cbTitle.Items.Append(TagContent);
      TagContent:=Item.SubItems.Strings[1];
    	if (TagContent<>'')and(cbArtist.Items.IndexOf(TagContent)<0) then cbArtist.Items.Append(TagContent);
      TagContent:=Item.SubItems.Strings[2];
    	if (TagContent<>'')and(cbAlbum.Items.IndexOf(TagContent)<0) then cbAlbum.Items.Append(TagContent);
      TagContent:=Item.SubItems.Strings[3];
    	if (TagContent<>'')and(cbTrack.Items.IndexOf(TagContent)<0) then cbTrack.Items.Append(TagContent);
      TagContent:=Item.SubItems.Strings[4];
    	if (TagContent<>'')and(cbYear.Items.IndexOf(TagContent)<0) then cbYear.Items.Append(TagContent);
      TagContent:=Item.SubItems.Strings[5];
    	if (TagContent<>'')and(cbComment.Items.IndexOf(TagContent)<0) then cbComment.Items.Append(TagContent);
   end;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.FolderTree1Change(Sender: TObject; Node: TTreeNode);
begin
  UpdateFolder;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.cbUseReplacementClick(Sender: TObject);
begin
 if cbUseReplacement.Checked then bFilter.Enabled:=true
 else bFilter.Enabled:=false;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.bFile2TagClick(Sender: TObject);
begin
 FromTagArray:=true;
 StartFilename2Tag;
 FromTagArray:=false;
end;

procedure TfrmTagger.StartFilename2Tag;
var Filename, Options: String;
    Finish: boolean;
    Index: Integer;
begin
 if not GetFilenameToTagOptions(Options,Testmode) then
  begin
    FromTagArray:=false;
    exit;
  end;

 if Testmode then frmPreview:=TfrmPreview.Create(Application);

  repeat

  if Testmode then frmPreview.ListView1.Items.Clear;
  for Index:=0 to ListView1.Items.Count-1 do
   begin
    if ListView1.Items[Index].Selected then
     begin
      Filename:=ListView1.Items[Index].SubItems[7];
      FilenameTag:=GetTagsFromName(Filename,Options);
      SelectTagVersion(WidelowerCase(ExtractFileExt(Filename)),Filename);
      if not Testmode then Finish:=true;
      FilenameTag[1]:='';
      FilenameTag[2]:='';
      FilenameTag[3]:='';
      FilenameTag[4]:='';
      FilenameTag[5]:='';
      FilenameTag[6]:='';
      FilenameTag[7]:='';
     end;
  end;

  

  if (Testmode)and(frmPreview.ShowModal<>mrOK) then
   begin
    frmPreview.Free;
    Testmode:=false;
    exit;
   end;

  Testmode:=false;

  until Finish;

  if frmPreview<>nil then frmPreview.Free;
  UpdateFolder;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.bNumberationClick(Sender: TObject);
var BeginNumber, Index, Index2, LastTime: Integer;
    Skip,Filename: String;
    Finish: boolean;
    SkipSeperated: Set of Byte;
begin
  if GetAutoNumberOptions(BeginNumber,Skip,Testmode) then
  begin
    FromTagArray:=true;
    LastTime:=0;
    SkipSeperated:=[];
    if length(Skip)>0 then
    begin
    for Index:=1 to length(Skip)-1 do
     begin
      if Skip[Index]=';' then
       begin
        SkipSeperated:=SkipSeperated+[StrToInt(copy(Skip,LastTime+1,Index-LastTime-1))];
        LastTime:=Index;
       end;
     end;
     if Skip[length(Skip)]=';' then dec(Index);
     SkipSeperated:=SkipSeperated+[StrToInt(copy(Skip,LastTime+1,Index-LastTime))];
    end;


   if Testmode then frmPreview:=TfrmPreview.Create(Application);
   Finish:=false;
   repeat
    if Testmode then frmPreview.ListView1.Items.Clear;

    Index2:=BeginNumber;

    for Index:=0 to ListView1.Items.Count-1 do
     begin
      if ListView1.Items[Index].Selected then
       begin
        FilenameTag[1]:='';
        FilenameTag[2]:='';
        FilenameTag[3]:='';
        FilenameTag[4]:='';
        FilenameTag[5]:='';
        FilenameTag[6]:='';
        FilenameTag[7]:='';
        Filename:=ListView1.Items[Index].SubItems[7];
        while(Index2 in SkipSeperated) do inc(Index2);
        FilenameTag[4]:=IntToStr(Index2);
        SelectTagVersion(WidelowerCase(ExtractFileExt(Filename)),Filename);
        inc(Index2);
       end;
     end;

    if not Testmode then Finish:=true;

    if (Testmode)and(frmPreview.ShowModal<>mrOK) then
     begin
      frmPreview.Free;
      Testmode:=false;
      FromTagArray:=false;
      exit;
     end;

    Testmode:=false;

   until Finish;
   if frmPreview<>nil then frmPreview.Free;
   UpdateFolder;
   FromTagArray:=false;
   end;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.bRemTagsClick(Sender: TObject);
var Index: Integer;
begin
 frmRemTags:=TfrmRemTags.Create(Application);
 ID3v1:=TID3v1.Create;
 ID3v2:=TID3v2.Create;
 APETag:=TAPETag.Create;
 VorbisTag:=TOggVorbis.Create;
 
 if frmRemTags.ShowModal=mrOK then
  begin
   for Index:=0 to ListView1.Items.Count-1 do
    begin
     if ListView1.Items[Index].Selected then
      begin
       RemoveTags(ListView1.Items[Index].SubItems[7]);
      end;
    end;
   UpdateFolder; 
  end;
 ID3v1.Free;
 ID3v2.Free;
 APETag.Free;
 VorbisTag.Free;
 frmRemTags.Free;
end;

procedure TfrmTagger.RemoveTags(ThisFile: String);
begin
  if (frmRemTags.rbRemAll.Checked)or(frmRemTags.cbID3v1.Checked) then ID3v1.RemoveFromFile(ThisFile);
  if (frmRemTags.rbRemAll.Checked)or(frmRemTags.cbID3v2.Checked) then ID3v2.RemoveFromFile(ThisFile);
  if (frmRemTags.rbRemAll.Checked)or(frmRemTags.cbAPE.Checked) then APETag.RemoveFromFile(ThisFile);
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.bExceptionsClick(Sender: TObject);
begin
 	with TfrmReplTag.Create(Application) do
		try ShowModal;
		finally Release;
	end;
  LoadCaseExceptions;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.bClearClick(Sender: TObject);
begin
cbArtist.Clear;
cbTitle.Clear;
cbAlbum.Clear;
cbYear.Clear;
cbGenre.Clear;
cbTrack.Clear;
cbComment.Clear;
end;

// -----------------------------------------------------------------------------

procedure TfrmTagger.cbOnlyExistingClick(Sender: TObject);
begin
  if cbOnlyExisting.Checked then UseOnlyExistingTags:=true
  else UseOnlyExistingTags:=false;
end;

// -----------------------------------------------------------------------------

function GetID3v1GenreID(Genre: String): Byte;
begin
 if WideLowerCase(Genre) = 'blues' then result:=0
 else
 if WideLowerCase(Genre) = 'classic rock' then result:=1
 else
 if WideLowerCase(Genre) = 'country' then result:=2
 else
 if WideLowerCase(Genre) = 'dance' then result:=3
 else
 if WideLowerCase(Genre) = 'disco' then result:=4
 else
 if WideLowerCase(Genre) = 'funk' then result:=5
 else
 if WideLowerCase(Genre) = 'grunge' then result:=6
 else
 if WideLowerCase(Genre) = 'hip-hop' then result:=7
 else
 if Genre = 'jazz' then result:=8
 else
 if WideLowerCase(Genre) = 'metal' then result:=9
 else
 if WideLowerCase(Genre) = 'new age' then result:=10
 else
 if WideLowerCase(Genre) = 'oldies' then result:=11
 else
 if WideLowerCase(Genre) = 'other' then result:=12
 else
 if WideLowerCase(Genre) = 'pop' then result:=13
 else
 if WideLowerCase(Genre) = 'r&b' then result:=14
 else
 if WideLowerCase(Genre) = 'rap' then result:=15
 else
 if WideLowerCase(Genre) = 'reggae' then result:=16
 else
 if WideLowerCase(Genre) = 'rock' then result:=17
 else
 if WideLowerCase(Genre) = 'techno' then result:=18
 else
 if WideLowerCase(Genre) = 'industrial' then result:=19
 else
 if WideLowerCase(Genre) = 'alternative' then result:=20
 else
 if WideLowerCase(Genre) = 'ska' then result:=21
 else
 if WideLowerCase(Genre) = 'death metal' then result:=22
 else
 if WideLowerCase(Genre) = 'pranks' then result:=23
 else
 if WideLowerCase(Genre) = 'soundtrack' then result:=24
 else
 if WideLowerCase(Genre) = 'euro-techno' then result:=25
 else
 if WideLowerCase(Genre) = 'ambient' then result:=26
 else
 if WideLowerCase(Genre) = 'trip-hop' then result:=27
 else
 if WideLowerCase(Genre) = 'vocal' then result:=28
 else
 if WideLowerCase(Genre) = 'jazz+funk' then result:=29
 else
 if WideLowerCase(Genre) = 'fusion' then result:=30
 else
 if WideLowerCase(Genre) = 'trance' then result:=31
 else
 if WideLowerCase(Genre) = 'classical' then result:=32
 else
 if WideLowerCase(Genre) = 'instrumental' then result:=33
 else
 if WideLowerCase(Genre) = 'acid' then result:=34
 else
 if WideLowerCase(Genre) = 'house' then result:=35
 else
 if WideLowerCase(Genre) = 'game' then result:=36
 else
 if WideLowerCase(Genre) = 'sound clip' then result:=37
 else
 if WideLowerCase(Genre) = 'gospel' then result:=38
 else
 if WideLowerCase(Genre) = 'noise' then result:=39
 else
 if WideLowerCase(Genre) = 'alternrock' then result:=40
 else
 if WideLowerCase(Genre) = 'bass' then result:=41
 else
 if WideLowerCase(Genre) = 'soul' then result:=42
 else
 if WideLowerCase(Genre) = 'punk' then result:=43
 else
 if WideLowerCase(Genre) = 'space' then result:=44
 else
 if WideLowerCase(Genre) = 'meditative' then result:=45
 else
 if WideLowerCase(Genre) = 'instrumental pop' then result:=46
 else
 if WideLowerCase(Genre) = 'instrumental rock' then result:=47
 else
 if WideLowerCase(Genre) = 'ethnic' then result:=48
 else
 if WideLowerCase(Genre) = 'gothic' then result:=49
 else
 if WideLowerCase(Genre) = 'darkwave' then result:=50
 else
 if WideLowerCase(Genre) = 'techno-industrial' then result:=51
 else
 if WideLowerCase(Genre) = 'electronic' then result:=52
 else
 if WideLowerCase(Genre) = 'pop-folk' then result:=53
 else
 if WideLowerCase(Genre) = 'eurodance' then result:=54
 else
 if WideLowerCase(Genre) = 'dream' then result:=55
 else
 if WideLowerCase(Genre) = 'southern rock' then result:=56
 else
 if WideLowerCase(Genre) = 'comedy' then result:=57
 else
 if WideLowerCase(Genre) = 'cult' then result:=58
 else
 if WideLowerCase(Genre) = 'gangsta' then result:=59
 else
 if WideLowerCase(Genre) = 'top 40' then result:=60
 else
 if WideLowerCase(Genre) = 'christian rap' then result:=61
 else
 if WideLowerCase(Genre) = 'pop/funk' then result:=62
 else
 if WideLowerCase(Genre) = 'jungle' then result:=63
 else
 if WideLowerCase(Genre) = 'native american' then result:=64
 else
 if WideLowerCase(Genre) = 'cabaret' then result:=65
 else
 if WideLowerCase(Genre) = 'new wave' then result:=66
 else
 if WideLowerCase(Genre) = 'psychadelic' then result:=67
 else
 if WideLowerCase(Genre) = 'rave' then result:=68
 else
 if WideLowerCase(Genre) = 'showtunes' then result:=69
 else
 if WideLowerCase(Genre) = 'trailer' then result:=70
 else
 if WideLowerCase(Genre) = 'lo-fi' then result:=71
 else
 if WideLowerCase(Genre) = 'tribal' then result:=72
 else
 if WideLowerCase(Genre) = 'acid punk' then result:=73
 else
 if WideLowerCase(Genre) = 'acid jazz' then result:=74
 else
 if WideLowerCase(Genre) = 'polka' then result:=75
 else
 if WideLowerCase(Genre) = 'retro' then result:=76
 else
 if WideLowerCase(Genre) = 'musical' then result:=77
 else
 if WideLowerCase(Genre) = 'rock & roll' then result:=78
 else
 if WideLowerCase(Genre) = 'hard rock' then result:=79
 else
 if WideLowerCase(Genre) = 'folk' then result:=80
 else
 if WideLowerCase(Genre) = 'folk-rock' then result:=81
 else
 if WideLowerCase(Genre) = 'national folk' then result:=82
 else
 if WideLowerCase(Genre) = 'swing' then result:=83
 else
 if WideLowerCase(Genre) = 'fast fusion' then result:=84
 else
 if WideLowerCase(Genre) = 'bebob' then result:=85
 else
 if WideLowerCase(Genre) = 'latin' then result:=86
 else
 if WideLowerCase(Genre) = 'revival' then result:=87
 else
 if WideLowerCase(Genre) = 'celtic' then result:=88
 else
 if WideLowerCase(Genre) = 'bluegrass' then result:=89
 else
 if WideLowerCase(Genre) = 'avantgarde' then result:=90
 else
 if WideLowerCase(Genre) = 'gothic rock' then result:=91
 else
 if WideLowerCase(Genre) = 'progessive rock' then result:=92
 else
 if WideLowerCase(Genre) = 'psychedelic rock' then result:=93
 else
 if WideLowerCase(Genre) = 'symphonic rock' then result:=94
 else
 if WideLowerCase(Genre) = 'slow rock' then result:=95
 else
 if WideLowerCase(Genre) = 'big band' then result:=96
 else
 if WideLowerCase(Genre) = 'chorus' then result:=97
 else
 if WideLowerCase(Genre) = 'easy listening' then result:=98
 else
 if WideLowerCase(Genre) = 'acoustic' then result:=99
 else
 if WideLowerCase(Genre) = 'humour' then result:=100
 else
 if WideLowerCase(Genre) = 'speech' then result:=101
 else
 if WideLowerCase(Genre) = 'chanson' then result:=102
 else
 if WideLowerCase(Genre) = 'opera' then result:=103
 else
 if WideLowerCase(Genre) = 'chamber music' then result:=104
 else
 if WideLowerCase(Genre) = 'sonata' then result:=105
 else
 if WideLowerCase(Genre) = 'symphony' then result:=106
 else
 if WideLowerCase(Genre) = 'booty bass' then result:=107
 else
 if WideLowerCase(Genre) = 'primus' then result:=108
 else
 if WideLowerCase(Genre) = 'porn groove' then result:=109
 else
 if WideLowerCase(Genre) = 'satire' then result:=110
 else
 if WideLowerCase(Genre) = 'slow jam' then result:=111
 else
 if WideLowerCase(Genre) = 'club' then result:=112
 else
 if WideLowerCase(Genre) = 'tango' then result:=113
 else
 if WideLowerCase(Genre) = 'samba' then result:=114
 else
 if WideLowerCase(Genre) = 'folklore' then result:=115
 else
 if WideLowerCase(Genre) = 'ballad' then result:=116
 else
 if WideLowerCase(Genre) = 'power ballad' then result:=117
 else
 if WideLowerCase(Genre) = 'rhythmic soul' then result:=118
 else
 if WideLowerCase(Genre) = 'freestyle' then result:=119
 else
 if WideLowerCase(Genre) = 'duet' then result:=120
 else
 if WideLowerCase(Genre) = 'punk rock' then result:=121
 else
 if WideLowerCase(Genre) = 'drum solo' then result:=122
 else
 if WideLowerCase(Genre) = 'a capella' then result:=123
 else
 if WideLowerCase(Genre) = 'euro-house' then result:=124
 else
 if WideLowerCase(Genre) = 'dance hall' then result:=125
 else
 if WideLowerCase(Genre) = 'goa' then result:=126
 else
 if WideLowerCase(Genre) = 'drum & bass' then result:=127
 else
 if WideLowerCase(Genre) = 'club-house' then result:=128
 else
 if WideLowerCase(Genre) = 'hardcore' then result:=129
 else
 if WideLowerCase(Genre) = 'terror' then result:=130
 else
 if WideLowerCase(Genre) = 'indie' then result:=131
 else
 if WideLowerCase(Genre) = 'britpop' then result:=132
 else
 if WideLowerCase(Genre) = 'negerpunk' then result:=133
 else
 if WideLowerCase(Genre) = 'polsk punk' then result:=134
 else
 if WideLowerCase(Genre) = 'beat' then result:=135
 else
 if WideLowerCase(Genre) = 'christian gangsta rap' then result:=136
 else
 if WideLowerCase(Genre) = 'heavy metal' then result:=137
 else
 if WideLowerCase(Genre) = 'black metal' then result:=138
 else
 if WideLowerCase(Genre) = 'crossover' then result:=139
 else
 if WideLowerCase(Genre) = 'contemporary christian' then result:=140
 else
 if WideLowerCase(Genre) = 'christian rock' then result:=141
 else
 if WideLowerCase(Genre) = 'merengue' then result:=142
 else
 if WideLowerCase(Genre) = 'salsa' then result:=143
 else
 if WideLowerCase(Genre) = 'trash metal' then result:=144
 else
 if WideLowerCase(Genre) = 'anime' then result:=145
 else
 if WideLowerCase(Genre) = 'jpop' then result:=146
 else
 if WideLowerCase(Genre) = 'synthpop' then result:= 147
 else
 result:=255;
end;


{ ********************* Filter functions ******************** }

function TfrmTagger.SaveFilter(Filename: String): boolean;
var
	Index: integer;
begin
	ListBox1.Items.Clear;

  for Index := 1 to ListView2.Items.Count do
  begin
		ListBox1.Items.Add(#1 + ListView2.Items[Index - 1].Caption + #2 +
    	ListView2.Items[Index - 1].SubItems.Strings[0] + #3);
  end;

  try
  	FileSetAttr(FileName, 0);
    ListBox1.Items.SaveToFile(FileName);
  	Result := true;
  except
  	Result := false;
  end;
end;

// -----------------------------------------------------------------------------

function TfrmTagger.LoadFilterOK(Filename: String): boolean;
var
	Index: integer;
  Line, First, Second: string;
  Item: TListItem;
begin
	Result := false;

 	if FileExists(FileName) then
		try
			ListBox1.Items.LoadFromFile(FileName);
  	  ListView2.Items.Clear;

		  for Index := 1 to ListBox1.Items.Count do
  		begin
    		Line := ListBox1.Items.Strings[Index - 1];
      	First := Copy(Line, Pos(#1, Line) + 1, Pos(#2, Line) - Pos(#1, Line) - 1);
	      Second := Copy(Line, Pos(#2, Line) + 1, Pos(#3, Line) - Pos(#2, Line) - 1);

  	    if First <> '' then
    	  begin
					Item := ListView2.Items.Add;
  		  	Item.Caption := First;
					Item.SubItems.Add(Second);
  	    end;
	  	end;

      Result := true;
	  except
	  end;
end;

{ ********************* Case conversions ******************** }
procedure TfrmTagger.LoadCaseExceptions;
begin
  if CaseExceptions=nil
  then CaseExceptions:=TStringList.Create;
  if FileExists(RootD + ReplaceFile) then CaseExceptions.LoadFromFile(RootD + ReplaceFile);
end;

procedure TfrmTagger.cbSecifyClick(Sender: TObject);
begin
if cbSecify.Checked then
 begin
  cbCapsTitle.Visible:=true;
  cbCapsArtist.Visible:=true;
  cbCapsAlbum.Visible:=true;
  cbCapsComment.Visible:=true;
 end
else
 begin
  cbCapsTitle.Visible:=false;
  cbCapsArtist.Visible:=false;
  cbCapsAlbum.Visible:=false;
  cbCapsComment.Visible:=false;
 end;
end;

function TfrmTagger.UpperCaseWords(InString: String): String;
var Index,LastTime:Integer;
begin
   if InString='' then exit;
   Index:=1;
   LastTime:=0;
   repeat
    if (InString[Index]=' ') then
    begin
     result:=result+UpperCaseFirstWord(copy(InString,LastTime+1,Index-LastTime));
     LastTime:=Index;
    end;
   inc(Index);
   until Index>length(InString);
   result:=result+UpperCaseFirstWord(copy(InString,LastTime+1,length(InString)-LastTime));
end;

function TfrmTagger.UpperCaseFirstWord(InString: String): String;
var Index:Integer;
    NotFromBegin: Boolean;
    const MySet :set of Char=[' ','(','\','''','[','#','-','.','<','+','~',';','{'];
begin
   if InString='' then exit;
   NotFromBegin:=false;
   Index:=1;
   while (Char(Instring[Index]) in MySet) do
   begin
    Result:=Result+Instring[Index];
    inc(Index);
    NotFromBegin:=true;
   end;
   if NotFromBegin then Result:=Result+WideUpperCase(InString[Index])+copy(InString,Index+1,length(Instring)-Index)
   else Result:=WideUpperCase(InString[1])+copy(InString,2,length(Instring));
end;

function TfrmTagger.GoCaseException(Check: String): String;
var Index,Index2, Index3 :integer;
    LowerInstring: String;
begin
 Result := Check;
 LowerInstring := WideLowerCase(Check);
 for Index := 0 to CaseExceptions.Count-1 do
 begin
 Index2:=0;
 if (length(Check)>0)and(length(Check)>length(CaseExceptions[Index]))
 then
  repeat
    inc(Index2);
    if copy(LowerInstring,Index2,length(CaseExceptions[Index])) = WideLowerCase(CaseExceptions[Index]) then
     begin
       Result:=copy(Check,1,Index2)+CaseExceptions[Index]+copy(Check,Index2+length(CaseExceptions[Index]),length(Check)-(Index2+length(CaseExceptions[Index]))+1);
       inc(Index2,length(CaseExceptions[Index]))
     end;
  until Index2+length(CaseExceptions[Index])>=length(Check);
 end;
end;

procedure TfrmTagger.cbCapitalizeChange(Sender: TObject);
begin
 if cbCapitalize.ItemIndex>0 then
  begin
   cbSecify.Enabled:=true;
   cbCapsTitle.Enabled:=true;
   cbCapsArtist.Enabled:=true;
   cbCapsAlbum.Enabled:=true;
   cbCapsComment.Enabled:=true;
   bExceptions.Enabled:=true;
  end
 else
  begin
   cbSecify.Enabled:=false;
   cbCapsTitle.Enabled:=false;
   cbCapsArtist.Enabled:=false;
   cbCapsAlbum.Enabled:=false;
   cbCapsComment.Enabled:=false;
   bExceptions.Enabled:=false;
  end
end;

procedure TfrmTagger.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	Index: integer;
begin
	if (ssCtrl in Shift) and (Key = Ord('A')) then
  	for Index := 0 to ListView1.Items.Count - 1 do
    	ListView1.Items[Index].Selected := true;
end;


function TfrmTagger.GetOggTag(const FileName: string;
  LengthLimit: integer): TagArray;
  var OggFile : TOggVorbis;
      Index : Integer;
begin
      OggFile := TOggVorbis.Create;
      for Index := 1 to numTag do	Result[Index] := '';
      if OggFile.ReadFromFile(FileName) then
      if OggFile.Valid then
       begin
         Result[1] := TextFilter(OggFile.Title, LengthLimit);
         Result[2] := TextFilter(OggFile.Artist, LengthLimit);
         Result[3] := TextFilter(OggFile.Album, LengthLimit);
         if OggFile.Track in [1..9] then Result[4] := '0' + IntToStr(OggFile.Track)
         else Result[4] := IntToStr(OggFile.Track);
         Result[5] := TextFilter(OggFile.Date, LengthLimit);
         Result[6] := TextFilter(OggFile.Comment, LengthLimit);
         Result[7] := TextFilter(OggFile.Genre, LengthLimit);
       end;
      OggFile.Free;
end;

procedure TfrmTagger.bFreedbClick(Sender: TObject);
var Index: Integer;
begin
 FromTagArray:=true;
 frmFreedb:=TfrmFreedb.Create(Application);
 frmFreedb.FileDir:=FileListBox1.Directory+'\';
 for Index:=0 to ListView1.Items.Count-1 do
 if ListView1.Items[Index].Selected then
 begin
  if frmFreedb.StringGrid2.Cells[0,1]='' then frmFreedb.StringGrid2.Cells[0,1]:=ListView1.Items[Index].Caption
  else
   begin
    frmFreedb.StringGrid2.RowCount:=frmFreedb.StringGrid2.RowCount+1;
    frmFreedb.StringGrid2.Cells[0,frmFreedb.StringGrid2.RowCount-1]:=ListView1.Items[Index].Caption;
   end;
 end;

 if frmFreedb.ShowModal=mrOK then
   begin
     with frmFreedb.StringGrid1 do
     for Index := 1 to RowCount do
     if (frmFreedb.StringGrid2.Cells[0,Index] <>'Dummy')and(Cells[0,Index]<>'X')and(Cells[1,Index]<>'<Dummy>')then
     begin
        FilenameTag[1]:='';
        FilenameTag[2]:='';
        FilenameTag[3]:='';
        FilenameTag[4]:='';
        FilenameTag[5]:='';
        FilenameTag[6]:='';
        FilenameTag[7]:='';

        FilenameTag[1]:=Cells[1,Index];
        FilenameTag[2]:=Cells[2,Index];
        FilenameTag[3]:=Cells[3,Index];
        FilenameTag[4]:=Cells[0,Index];
        FilenameTag[5]:=Cells[4,Index];
        FilenameTag[6]:=Cells[6,Index];
        FilenameTag[7]:=Cells[5,Index];
        SelectTagVersion(WidelowerCase(ExtractFileExt(frmFreedb.StringGrid2.Cells[0,Index])),FileListBox1.Directory+'\'+frmFreedb.StringGrid2.Cells[0,Index]);
     end;
    UpdateFolder; 
   end;
 frmFreedb.Free;
 FromTagArray:=false;
end;

procedure TfrmTagger.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
	var Value: integer;
begin
	Value := Abs(Tag) - 1;
  Tag := Column.Index + 1;
  if ListView1.Columns[Column.Index].ImageIndex = 1 then Tag := -Tag;

  if Value >= 0 then ListView1.Columns[Value].ImageIndex := -1;
  ListView1.AlphaSort;

  if Tag < 0 then ListView1.Columns[Column.Index].ImageIndex := 2
  else ListView1.Columns[Column.Index].ImageIndex := 1;
end;

procedure TfrmTagger.ListView1Compare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
	Compare := 0;
	if Tag = 0 then exit;

	if Abs(Tag) = 1 then Compare := WideCompareText(Item1.Caption,Item2.Caption)
  else Compare := WideCompareText(Item1.SubItems.Strings[Abs(Tag) - 2],
  	Item2.SubItems.Strings[Abs(Tag) - 2]);

  if Tag < 0 then Compare := -Compare;
end;

procedure TfrmTagger.ListView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Sender is TListView;
end;

procedure TfrmTagger.ListView1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  iTemp, Input, Index: Integer;
  TempStrs: TStrings;
  S: String;
begin

  TempStrs:=TStringlist.Create;

  iTemp := 0;
  Try
  Input:=TListView(Sender).GetItemAt(x,y).Index;
  except
  end;

  while iTemp < TListView(Source).Items.Count do
  begin

    if TListView(Source).Items[iTemp].Selected then
    begin
      with Sender as TListView do
      begin

        if Input=iTemp then break;
        if (Input>-1) and (Input < TListView(Source).Items.Count) then
         begin
          S := TListView(Source).Items[iTemp].Caption;
          TempStrs.AddStrings(TListView(Source).Items[iTemp].SubItems);
          TListView(Source).Items.Delete(iTemp);
          Items.Insert(Input);
          Items[Input].SubItems.AddStrings(TempStrs);
          Items[Input].Caption := S;

          TempStrs.Clear;
          if iTemp>Input then inc(Input);
          dec(iTemp);
          for Index := 0 to ListView1.Columns.Count-1 do ListView1.Columns[Index].ImageIndex := -1;
         end;

      end;
    end; 
    inc(iTemp);
  end;
  
end;

procedure TfrmTagger.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   with ListView1 do
    begin
      if (Y<Top)then perform(WM_VSCROLL, SB_LINEUP, 0);
      if (Y>Height+Top)then perform(WM_VSCROLL, SB_LINEDOWN	, 0);
    end;
end;


end.
