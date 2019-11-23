unit uID3TagsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons;

type
  TfTags = class(TForm)
    pcTags: TPageControl;
    tsID3v1: TTabSheet;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    eTitle: TEdit;
    eArtist: TEdit;
    eAlbum: TEdit;
    eComment: TEdit;
    eYear: TEdit;
    cbGenre: TComboBox;
    StaticText7: TStaticText;
    eTrackNo: TEdit;
    cbID3v11: TCheckBox;
    tsLyrics: TTabSheet;
    mLyrics3: TMemo;
    tsLyrics3v2: TTabSheet;
    eL3v2Title: TEdit;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    eL3v2Artist: TEdit;
    eL3v2Album: TEdit;
    StaticText10: TStaticText;
    eL3v2Author: TEdit;
    StaticText11: TStaticText;
    tsLyrics3v2more: TTabSheet;
    mImages: TMemo;
    mInfos: TMemo;
    bnMore: TBitBtn;
    tsID3v2: TTabSheet;
    StaticText12: TStaticText;
    procedure cbGenreChange(Sender: TObject);
    procedure bnMoreClick(Sender: TObject);
    procedure eTitleExit(Sender: TObject);
  private
    { Private-Deklarationen
  public
    { Public-Deklarationen }
    Genre: byte;
  end;

var
  fTags: TfTags;

implementation

{$R *.DFM}

procedure TfTags.cbGenreChange(Sender: TObject);
begin
   if eTitle.ReadOnly then cbGenre.ItemIndex := Genre;
end;

procedure TfTags.bnMoreClick(Sender: TObject);
begin
   pcTags.ActivePage := tsLyrics3v2more;
end;

procedure TfTags.eTitleExit(Sender: TObject);
begin
   if Length(Self.Text)>30 then Self.Text := Copy(Self.Text,1,30);
end;

end.
