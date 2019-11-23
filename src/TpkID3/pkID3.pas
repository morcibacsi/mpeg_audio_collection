(*********************************************************************
*** Projekt:   Auslesen und Schreiben von ID3-Tags in MP3-Dateien
*** Datei:     pkID3.pas
*** Compiler:  Borland Delphi 4.0 SP3
*** Author:    Patrick M. Kolla
*** Datum:     28.09.1999
*** Version:   1.0
**********************************************************************
*** Dieses Projekt dient dem Lesen und Schreiben von ID3-Tags in
*** MP3-Dateien.
*** In der Version 1.0 werden nur ID3v1-und ID3v1.1 Tags unterstützt.
*** ID3v2-Tags werden vielleicht irgendwann folgen.
**********************************************************************
*** COPYRIGHT ********************************************************
*** Diese Komponente darf im "Open Source"-Sinn frei verwendet werden,
*** d.h. alle Projekte, die diese Komponente benutzen, muessen
*** ebenfalls frei als Source erhaeltich sein.
*** Ausnahmen gelten nur fuer mich :-)
*** Selbstverstaendlich uebernehme ich keinerlei Haftung fuer die
*** korrekte Funktion dieser Unit oder fuer Schaeden, die durch ihre
*** Benutzung entstehen koennten.
*********************************************************************)

unit pkID3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

const TGenres : array[0..147] of ShortString =
          ('Blues','Classic Rock','Country','Dance','Disco',
           'Funk','Grunge','Hip-Hop','Jazz','Metal',
           'New Age','Oldies','Other','Pop','R&B',
           'Rap','Reggae','Rock','Techno','Industrial',
           'Alternative','Ska','Death Metal','Pranks','Soundtrack',
           'Euro-Techno','Ambient','Trip-Hop','Vocal','Jazz+Funk',
           'Fusion','Trance','Classical','Instrumental','Acid',
           'House','Game','Sound Clip','Gospel','Noise',
           'AlternRock','Bass','Soul','Punk','Space',
           'Meditative','Instrumental Pop','Instrumental Rock','Ethnic','Gothic',
           'Darkwave','Techno-Industrial','Electronic','Pop-Folk','Eurodance',
           'Dream','Southern Rock','Comedy','Cult','Gangsta',
           'Top 40','Christian Rap','Pop/Funk','Jungle','Native American',
           'Cabaret','New Wave','Psychedelic','Rave','Showtunes',
           'Trailer','Lo-Fi','Tribal','Acid Punk','Acid Jazz',
           'Polka','Retro','Musical','Rock & Roll','Hard Rock',
           'Folk','Folk-Rock','National Folk','Swing','Fast Fusion',
           'Bebob','Latin','Revival','Celtic','Bluegrass',
           'Avantgarde','Gothic Rock','Progressive Rock','Psychedelic Rock','Symphonic Rock',
           'Slow Rock','Big Band','Chorus','Easy Listening','Acoustic',
           'Humour','Speech','Chanson','Opera','Chamber Music',
           'Sonata','Symphony','Booty Bass','Primus','Porn Groove',
           'Satire','Slow Jam','Club','Tango','Samba',
           'Folklore','Ballad','Power Ballad','Rhythmic Soul','Freestyle',
           'Duet','Punk Rock','Drum Solo','Acapella','Euro-House',
           'Dance Hall','Goa','Drum','Club-House','Hardcore',
           'Terror','Indie','Britpop','Negerpunk','Polsk Punk',
           'Beat','Christian Gangsta','Heavy Metal','Black Metal','Crossover',
           'Contemporary Ch?','Christian Rock','Merengue','Salsa','Trash Metal',
           'Anime','JPop','Synthpop');

type
   Char30 = array[0..29] of char;
   Char4 = array[0..3] of char;
   TID3v1Tags = record
      ID: array[0..2] of char;
      Title,Artist,Album: Char30;
      Year: Char4;
      Comment: Char30;
      Genre: byte;
   end;

   TpkID3v1 = class;
   TpkID3 = class;

   TpkID3State = (id3Success,id3NoTags,id3NoSuchFile,id3IOError);

   {*******************************************************************}
   TpkLyrics3 = class(TPersistent)
   private
      FpkID3v1: TpkID3v1;
      FAlbum: ShortString;
      FArtist: ShortString;
      FAuthor: ShortString;
      FImages: TStringList;
      FInfos: TStringList;
      FLyrics: TStringList;
      FTitle: ShortString;
      FOthers: TStringList;
      FUseLyrics3v2: boolean;
      FUseTimestamp: boolean;
      procedure SetTitle(s: ShortString);
      procedure SetArtist(s: ShortString);
      procedure SetAlbum(s: ShortString);
      procedure SetAuthor(s: ShortString);
      procedure SetLyrics(l: TStringList);
      procedure SetInfos(l: TStringList);
      procedure SetImages(l: TStringList);
      procedure SetOthers(l: TStringList);
      procedure SetUseTimestamp(b: boolean);
   protected
      procedure AssignTo(Dest: TPersistent); override;
   public
      procedure Clear;
      procedure Show;
      procedure Edit;
      constructor Create(ApkID3v1: TpkID3v1);
      destructor Destroy; override;
   published
      property Artist: ShortString read FArtist write SetArtist;
      property Album: ShortString read FAlbum write SetAlbum;
      property Author: ShortString read FAuthor write SetAuthor;
      property Images: TStringList read FImages write SetImages;
      property Infos: TStringList read FInfos write SetInfos;
      property Lyrics: TStringList read FLyrics write SetLyrics;
      property Title: ShortString read FTitle write SetTitle;
      property Others: TStringList read FOthers write SetOthers;
      property UseLyrics3v2: boolean read FUseLyrics3v2 write FUseLyrics3v2;
      property UseTimestamp: boolean read FUseTimestamp write SetUseTimestamp;
   end;
   {*******************************************************************}
   TpkID3v1 = class(TPersistent)
   private
      FpkID3: TpkID3;
      FpkLyrics3: TpkLyrics3;
      v1Tag: TID3v1Tags;
      FTitle,FArtist,FAlbum,FComment: ShortString;
      FYear: ShortString;
      FGenre: byte;
      FTrackNo: byte;
      FUseID3v11: boolean;
      FUseLyrics3: boolean;
      procedure SetProps;
      procedure SetTags;
      procedure SetTitle(s: ShortString);
      procedure SetArtist(s: ShortString);
      procedure SetAlbum(s: ShortString);
      procedure SetYear(s: ShortString);
      procedure SetComment(s: ShortString);
      procedure SetGenreID(b: byte);
      procedure SetGenre(s: ShortString);
      function GetGenre: ShortString;
      procedure SetTrackNo(b: byte);
      procedure SetID3v11(b: boolean);
   protected
      procedure AssignTo(Dest: TPersistent); override;
   public
      procedure Clear;
      procedure Show;
      procedure Edit;
      procedure LoadFromFile; overload;
      procedure LoadFromFile(fn: string); overload;
      procedure SaveToFile; overload;
      procedure SaveToFile(fn: string); overload;
      constructor Create(ApkID3: TpkID3);
      destructor Destroy; override;
   published
      property Lyrics3: TpkLyrics3 read FpkLyrics3 write FpkLyrics3;
      property Title: ShortString read FTitle write SetTitle;
      property Artist: ShortString read FArtist write SetArtist;
      property Album: ShortString read FAlbum write SetAlbum;
      property Year: ShortString read FYear write SetYear;
      property Comment: ShortString read FComment write SetComment;
      property GenreID: byte read FGenre write SetGenreID;
      property Genre: ShortString read GetGenre write SetGenre;
      property TrackNo: byte read FTrackNo write SetTrackNo;
      property UseID3v11: boolean read FUseID3v11 write SetID3v11 default false; 
      property UseLyrics3: boolean read FUseLyrics3 write FUseLyrics3 default false;
   end;
   {*******************************************************************}
   TpkID3 = class(TComponent)
   private
      { Private-Deklarationen }
      FpkID3v1: TpkID3v1;
      FFilename: String;
      FSuccess: TpkID3State;
      FAutoLoad: boolean;
      FAutoSave: boolean;
      FUseID3v1: boolean;
      FUseID3v2: boolean;
      procedure SetProps;
      procedure SetTags;
      procedure SetFilename(fn: string);
      procedure SetSuccess(s: TpkID3State);
      procedure SetAutoLoad(b: boolean);
      procedure ShowTags(edit: boolean; f_id3v1,f_l3,f_id3v2: boolean);
   protected
      { Protected-Deklarationen }
   public
      { Public-Deklarationen }
      procedure LoadFromFile; overload;
      procedure LoadFromFile(fn: string); overload;
      procedure SaveToFile; overload;
      procedure SaveToFile(fn: string); overload;
      procedure Clear;
      procedure Show;
      procedure Edit;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
   published
      { Published-Deklarationen }
      property ID3v1: TpkID3v1 read FpkID3v1 write FpkID3v1;
      property AutoLoad: boolean read FAutoLoad write SetAutoLoad default false;
      property AutoSave: boolean read FAutoSave write FAutoSave default false;
      property Success: TpkID3State read FSuccess write SetSuccess default id3Success;
      property Filename: String read FFilename write SetFilename;
      property UseID3v1: boolean read FUseID3v1 write FUseID3v1 default false;
      property UseID3v2: boolean read FUseID3v2 write FUseID3v2 default false;
   end;

procedure Register;

implementation

uses uID3TagsForm;

{**********************************************************************}
{**********************************************************************}

{**********************************************************************}
procedure TpkID3v1.LoadFromFile;
begin
   LoadFromFile(FpkID3.FFilename);
end;

{**********************************************************************}
function PosInArray(substr: string; a: array of char; len: integer): integer;
var ret: integer;
    found: integer;
    i: integer;
    l: integer;
begin
   ret := 0;
   found := 0;
   i := 0;
   l := Length(substr);
   while (i<len) and (ret=0) and (found<l) do begin
      if (a[i] = substr[found+1]) then begin
         Inc(found);
         if found=l then ret := i-l;
      end else found := 0;
      Inc(i);
   end;
   if found=l then Inc(ret,1) else ret := 0; 
   Result := ret;
end;
{**********************************************************************}
function GetBlock(var s: AnsiString; temp: array of char): boolean;
var p: integer;
    i: integer;
begin
   p := PosInArray('LYRICSBEGIN',temp,Length(temp));
   if p>0 then begin
      s := '';
      for i := p+11 to 5119 do s := s + temp[i];
      Result := true;
   end else Result := false;
end;
{**********************************************************************}
function SetBlock(var temp: array of char; s: AnsiString): integer;
var i: integer;
begin
   for i := 1 to Length(s) do temp[i-1] := s[i];
   Result := Length(s);
end;
{**********************************************************************}
function PosInFile(var f: file; tof: string): integer;
var temp: array[0..4095] of char;
    transf,startpos,foundpos: integer;
    v,ec: integer;
begin
   startpos := FileSize(f) - 137;
   foundpos := 0;
   Seek(f,startpos);
   BlockRead(f,temp,9);
   if Copy(temp,1,9) = 'LYRICS200' then begin
      Seek(f,startpos-6);
      BlockRead(f,temp,6);
      Val(Copy(temp,1,6),v,ec);
      if ec=0 then foundpos := startpos - v - 6;
   end;
   if foundpos=0 then begin
      Seek(f,startpos);
      repeat
         if startpos>=4096 then Dec(startpos,4096) else startpos := 0;
         Seek(f,startpos);
         Blockread(f,temp,4096,transf);
         foundpos := PosInArray('LYRICSBEGIN',temp,transf);
      until (startpos<=0) or (foundpos>0);
      if foundpos>0 then Inc(foundpos,startpos);
   end;
   Result := foundpos;
end;
{**********************************************************************}
procedure TpkID3v1.LoadFromFile(fn: string);
const lyrid = 'LYRICSBEGIN';
var f: file; // of byte;
    fs: LongInt;
    s: array[0..8] of char;
    ins: AnsiString;
    transf: integer;
    temp: array[0..5119] of char;
    i,foundpos,ldatasize: integer;
    bs,ts,tds: AnsiString;
    tsl,ec: integer;
begin
   FpkID3.UseID3v1 := false;
   UseID3v11 := false;
   UseLyrics3 := false;
   Album := '';
   Artist := '';
   Comment := '';
   GenreID := 0;
   Title := '';
   TrackNo := 0;
   Year := '';
   Lyrics3.UseLyrics3v2 := false;
   Lyrics3.UseTimestamp := false;
   Lyrics3.Album := '';
   Lyrics3.Artist := '';
   Lyrics3.Author := '';
   Lyrics3.Title := '';
   Lyrics3.Images.Clear;
   Lyrics3.Infos.Clear;
   Lyrics3.Lyrics.Clear;
   Lyrics3.Others.Clear;
   FpkID3.Filename := '';
   if FileExists(fn) then begin
      FpkID3.FFilename := fn;
      FileMode := 0;
      AssignFile(f,FpkID3.FFilename);
      Reset(f,1);
      fs := FileSize(f);
      Seek(f,fs-128);
      Blockread(f,v1Tag,128);
      if (v1Tag.ID = 'TAG') then begin
         FpkID3.FSuccess := id3Success;
         Seek(f,fs-137);
         Blockread(f,s,9,transf);
         FUseLyrics3 := false;
         FpkLyrics3.UseLyrics3v2 := false;
         if s = 'LYRICSEND' then begin
            FUseLyrics3 := true;
         end else if s = 'LYRICS200' then begin
            FUseLyrics3 := true;
            FpkLyrics3.UseLyrics3v2 := true;
         end;
         if FUseLyrics3 or FpkLyrics3.UseLyrics3v2 then begin
            foundpos := PosInFile(f,lyrid);
            if foundpos>0 then begin
               ldatasize := fs-foundpos-128;
               Seek(f,foundpos);
               ins := '';
               while ldatasize>0 do begin
                  if ldatasize>5000 then i := 5000 else i := ldatasize;
                  BlockRead(f,temp,i,transf);
                  if transf>0 then begin
                     ins := ins + Copy(temp,1,transf);
                  end;
                  Dec(ldatasize,5000);
               end;
               ins := Copy(ins,12,Length(ins)-20);
               if FpkLyrics3.UseLyrics3v2 then begin
                  //auswerten
                  i := 0;   ec := 0;
                  while (Length(ins)>0) and (ec=0) do begin
                     if Length(ins)>8 then begin
                        bs := Copy(ins,1,3);
                        ts := Copy(ins,4,5);
                        Val(ts,tsl,ec);
                        if (ec=0) then begin
                           if Length(ins)>tsl+7 then begin
                              tds := Copy(ins,9,tsl);
                              ins := Copy(ins,9+tsl,Length(ins)-8-tsl);
                              if bs = 'IND' then begin
                                 FpkLyrics3.FUseTimestamp := (tds[2] = '1');
                              end;
                              if bs = 'LYR' then begin
                                 FpkLyrics3.Lyrics.Text := tds;
                              end else if bs = 'INF' then begin
                                 FpkLyrics3.Infos.Text := tds;
                              end else if bs = 'AUT' then begin
                                 FpkLyrics3.Author := tds;
                              end else if bs = 'EAL' then begin
                                 FpkLyrics3.Album := tds;
                              end else if bs = 'EAR' then begin
                                 FpkLyrics3.Artist := tds;
                              end else if bs = 'ETT' then begin
                                 FpkLyrics3.Title := tds;
                              end else if bs = 'IMG' then begin
                                 FpkLyrics3.Images.Text := tds;
                              end;
                           end else ec := -1;
                        end else ec := -1;
                     end else ec := -1;
                  end;
               end else begin
                  FpkLyrics3.Lyrics.Text := ins;
               end;
            end else begin
               FUseLyrics3 := false;
               FpkLyrics3.UseLyrics3v2 := false;
            end;
         end;
         if not UseLyrics3 then begin
            Lyrics3.FLyrics.Clear;
         end;
         if not Lyrics3.UseLyrics3v2 then begin
            Lyrics3.FImages.Clear;
            Lyrics3.FInfos.Clear;
            Lyrics3.Artist := '';
            Lyrics3.Album := '';
            Lyrics3.Author := '';
            Lyrics3.Title := '';
         end;
      end else FpkID3.FSuccess := id3NoTags;
      CloseFile(f);
   end else begin
      FpkID3.FSuccess := id3NoSuchFile;
   end;
   if FpkID3.FSuccess = id3Success then SetProps
   else Clear;
end;

{**********************************************************************}
procedure TpkID3v1.SaveToFile;
begin
   SaveToFile(FpkID3.FFilename);
end;

{**********************************************************************}
procedure TpkID3v1.SaveToFile(fn: string);
function FillZeros(i,l: integer): ShortString;
var s: string;
begin
   Str(i,s);
   if length(s)>l then s := Copy(s,Length(s)-l+1,l) else
   while length(s)<l do s := '0'+s;
   Result := s;
end;
const lyrid = 'LYRICSBEGIN';
var f: file;
    fs: LongInt;
    transf: integer;
    temp: array[0..5119] of char;
    ret: boolean;
    bt: integer;
    st: TpkID3State;
    temptag: TID3v1Tags;
    bL3,bL3v2: boolean;
    //l3v2size: integer;
    startpos,foundpos: integer;
    outs: AnsiString;
begin
   SetTags;
   st := id3NoSuchFile;
   if FileExists(fn) and (v1Tag.ID='TAG') then begin
      if FpkID3.FUseID3v1 then begin
         bL3 := FUseLyrics3;
         bL3v2 := FpkLyrics3.FUseLyrics3v2;
         FpkID3.FFilename := fn;
         FileMode := 2;
         AssignFile(f,FpkID3.FFilename);
         Reset(f,1);
         fs := FileSize(f);
         Seek(f,fs-128);
         Blockread(f,temptag,128);
         ret := (temptag.ID = 'TAG');
         if ret then begin
            foundpos := PosInFile(f,lyrid);
            if foundpos=0 then startpos := fs-128 else startpos := foundpos;
         end else startpos := fs;
         Seek(f,startpos);
         if bL3 then begin
            //FpkLyrics3.lyricstag := '';
            if bL3v2 then begin
               outs := 'LYRICSBEGININD00002';
               if Length(FpkLyrics3.Lyrics.Text)>0 then outs := outs + '1'
               else outs := outs + '0';
               if FpkLyrics3.FUseTimestamp then outs := outs + '1'
               else outs := outs + '0';
               if Length(FpkLyrics3.Lyrics.Text)>0 then outs := outs + 'LYR'+FillZeros(Length(FpkLyrics3.Lyrics.Text),5)+FpkLyrics3.Lyrics.Text;
               if Length(FpkLyrics3.Author)>0 then outs := outs + 'AUT'+FillZeros(Length(FpkLyrics3.Author),5)+FpkLyrics3.Author;
               if Length(FpkLyrics3.Album)>0  then outs := outs + 'EAL'+FillZeros(Length(FpkLyrics3.Album),5) +FpkLyrics3.Album;
               if Length(FpkLyrics3.Artist)>0 then outs := outs + 'EAR'+FillZeros(Length(FpkLyrics3.Artist),5)+FpkLyrics3.Artist;
               if Length(FpkLyrics3.Title)>0  then outs := outs + 'ETT'+FillZeros(Length(FpkLyrics3.Title),5) +FpkLyrics3.Title;
               if Length(FpkLyrics3.Infos.Text)>0  then outs := outs + 'INF'+FillZeros(Length(FpkLyrics3.Infos.Text),5) +FpkLyrics3.Infos.Text;
               if Length(FpkLyrics3.Images.Text)>0 then outs := outs + 'IMG'+FillZeros(Length(FpkLyrics3.Images.Text),5)+FpkLyrics3.Images.Text;
               if Length(FpkLyrics3.Others.Text)>0 then outs := outs + FpkLyrics3.Others.Text;
               outs := outs + FillZeros(Length(outs),6) + 'LYRICS200';
            end else begin
               outs := 'LYRICSBEGIN'+FpkLyrics3.Lyrics.Text+'LYRICSEND';
            end;
            bt := SetBlock(temp,outs);
            BlockWrite(f,temp,bt,transf);
            ret := (bt=transf);
         end else ret := true;
         if ret then begin
            BlockWrite(f,v1Tag,128,bt);
            ret := (bt=128);
            if ret then st := id3Success
            else st := id3IOError;
         end else st := id3IOError;
         Truncate(f);
         CloseFile(f);
         // schreiben
         //truncate
      end;
   end else begin
      if FileExists(fn) then st := id3NoTags
      else st := id3NoSuchFile;
   end;
   FpkID3.Success := st;
   //MessageDlg(IntToStr(startpos)+' - '+IntToStr(fs)+' | '+IntToStr(fs-startpos),mtInformation,[mbOK],0);
end;

{**********************************************************************}
function TpkID3v1.GetGenre: ShortString;
begin
   if FGenre in [0..147] then Result := TGenres[FGenre] else Result := '';
end;

{**********************************************************************}
procedure TpkID3v1.SetTitle(s: ShortString);
begin
   if Length(s)<31 then FTitle := s else FTitle := Copy(s,1,30);
   FpkID3.UseID3v1 := true;
   if FpkID3.AutoSave then FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkID3v1.SetArtist(s: ShortString);
begin
   if Length(s)<31 then FArtist := s else FArtist := Copy(s,1,30);
   FpkID3.UseID3v1 := true;
   if FpkID3.AutoSave then FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkID3v1.SetAlbum(s: ShortString);
begin
   if Length(s)<31 then FAlbum := s else FAlbum := Copy(s,1,30);
   FpkID3.UseID3v1 := true;
   if FpkID3.AutoSave then FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkID3v1.SetYear(s: ShortString);
begin
   if Length(s)<5 then FYear := s else FYear := Copy(s,1,4);
   FpkID3.UseID3v1 := true;
   if FpkID3.AutoSave then FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkID3v1.SetComment(s: ShortString);
begin
   if Length(s)<31 then FComment := s else FComment := Copy(s,1,30);
   FpkID3.UseID3v1 := true;
   if FpkID3.AutoSave then FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkID3v1.SetGenreID(b: byte);
begin
   if (b in [0..147]) or (b=255) then FGenre := b; // PinterPeti added: 255
   FpkID3.UseID3v1 := true;
   if FpkID3.AutoSave then FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkID3v1.SetGenre(s: ShortString);
begin
end;

{**********************************************************************}
procedure TpkID3v1.SetTrackNo(b: byte);
begin
   FUseID3v11 := true;
   FTrackNo := b;
   if Length(FComment)>28 then FComment := Copy(FComment,1,28);
   FpkID3.UseID3v1 := true;
   if FpkID3.AutoSave then FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkID3v1.SetID3v11(b: boolean);
begin
   FUseID3v11 := b;
   FpkID3.UseID3v1 := true;
   if FpkID3.AutoSave then FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkID3v1.AssignTo(Dest: TPersistent);
begin
   if Dest is TpkID3v1 then begin
      with TpkID3v1(Dest) do begin
         FAlbum     := Self.FAlbum;
         FArtist    := Self.FArtist;
         FComment   := Self.FComment;
         FGenre     := Self.FGenre;
         FTitle     := Self.FTitle;
         FYear      := Self.FYear;
         FTrackNo   := Self.FTrackNo;
         FUseID3v11 := Self.FUseID3v11;
         FUseLyrics3   := Self.FUseLyrics3;
         v1Tag      := Self.v1Tag;
         FpkID3     := Self.FpkID3;
      end;
   end else inherited AssignTo(Dest);
end;

{**********************************************************************}
procedure TpkID3v1.Show;
begin
   FpkID3.ShowTags(false,true,false,false);
end;

{**********************************************************************}
procedure TpkID3v1.Edit;
begin
   FpkID3.ShowTags(true,true,false,false);
   if FpkID3.FAutoSave then FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkID3v1.Clear;
var i: integer;
begin
   v1Tag.ID := 'TAG';
   for i := 0 to 29 do v1Tag.title[i] := #32;
   for i := 0 to 29 do v1Tag.artist[i] := #32;
   for i := 0 to 29 do v1Tag.album[i] := #32;
   for i := 0 to  3 do v1Tag.year[i] := #32;
   for i := 0 to 29 do v1Tag.comment[i] := #32;
   v1Tag.genre := 0;
   SetProps;
end;

{**********************************************************************}
constructor TpkID3v1.Create(ApkID3: TpkID3);
begin
   inherited Create;
   FpkID3 := ApkID3;
   FpkLyrics3 := TpkLyrics3.Create(self);
end;

{**********************************************************************}
destructor TpkID3v1.Destroy;
begin
   FpkLyrics3.Free;
   inherited Destroy;
end;

{**********************************************************************}
procedure TpkID3v1.SetProps;
procedure CopyToString(var z: array of char; var s: ShortString);
var i: integer;
begin
   s := '';
   for i := Low(z) to High(z) do s := s + z[i];
   while ((s[Length(s)]=#32) or (s[Length(s)]=#0)) and (Length(s)>0) do s := Copy(s,1,Length(s)-1);
end;
begin
   CopyToString(v1Tag.title,FTitle);
   CopyToString(v1Tag.artist,FArtist);
   CopyToString(v1Tag.album,FAlbum);
   CopyToString(v1Tag.year,FYear);
   CopyToString(v1Tag.comment,FComment);
   FUseID3v11 := (v1Tag.Comment[28] = #0);
   if FUseID3v11 then FTrackNo := Ord(v1Tag.Comment[29])
   else FTrackNo := 0;
   FGenre := v1Tag.genre;
end;

{**********************************************************************}
procedure TpkID3v1.SetTags;
procedure CopyNCut(var s: ShortString; var z: array of char);
var i: integer;
    ts: string;
begin
   if Length(s)>Length(z) then s := Copy(s,1,Length(z));
   ts := s;
   while Length(ts)<Length(z) do ts := ts + #0;
   for i := Low(z) to High(z) do z[i] := ts[i+1];
end;
begin
   CopyNCut(FTitle,v1Tag.title);
   CopyNCut(FArtist,v1Tag.artist);
   CopyNCut(FAlbum,v1Tag.album);
   CopyNCut(FComment,v1Tag.comment);
   if FUseID3v11 then begin
      v1Tag.Comment[28] := #0;
      v1Tag.Comment[29] := Chr(FTrackNo);
   end;
   CopyNCut(FYear,v1Tag.year);
   v1Tag.genre := FGenre;
end;

{**********************************************************************}
{**********************************************************************}
procedure TpkLyrics3.SetTitle(s: ShortString);
begin
   if Length(s)<251 then FTitle := s else FTitle := Copy(s,1,250);
   if Length(s)>0 then begin
      FpkID3v1.FpkID3.UseID3v1 := true;
      FpkID3v1.UseLyrics3 := true;
      UseLyrics3v2 := true;
   end;
   if FpkID3v1.FpkID3.AutoSave then FpkID3v1.FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkLyrics3.SetArtist(s: ShortString);
begin
   if Length(s)<250 then FArtist := s else FArtist := Copy(s,1,250);
   if Length(s)>0 then begin
      FpkID3v1.FpkID3.UseID3v1 := true;
      FpkID3v1.UseLyrics3 := true;
      UseLyrics3v2 := true;
   end;
   if FpkID3v1.FpkID3.AutoSave then FpkID3v1.FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkLyrics3.SetAlbum(s: ShortString);
begin
   if Length(s)<251 then FAlbum := s else FAlbum := Copy(s,1,250);
   if Length(s)>0 then begin
      FpkID3v1.FpkID3.UseID3v1 := true;
      FpkID3v1.UseLyrics3 := true;
      UseLyrics3v2 := true;
   end;
   if FpkID3v1.FpkID3.AutoSave then FpkID3v1.FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkLyrics3.SetAuthor(s: ShortString);
begin
   if Length(s)<251 then FAuthor := s else FAuthor := Copy(s,1,250);
   if Length(s)>0 then begin
      FpkID3v1.FpkID3.UseID3v1 := true;
      FpkID3v1.UseLyrics3 := true;
      UseLyrics3v2 := true;
   end;
   if FpkID3v1.FpkID3.AutoSave then FpkID3v1.FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkLyrics3.SetLyrics(l: TStringList);
begin
   FLyrics.Text := l.Text;
   if l.count>0 then begin
      FpkID3v1.FpkID3.UseID3v1 := true;
      FpkID3v1.UseLyrics3 := true;
   end;
   if FpkID3v1.FpkID3.AutoSave then FpkID3v1.FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkLyrics3.SetInfos(l: TStringList);
begin
   FInfos.Text := l.Text;
   if l.count>0 then begin
      UseLyrics3v2 := true;
      FpkID3v1.FpkID3.UseID3v1 := true;
      FpkID3v1.UseLyrics3 := true;
   end;
   if FpkID3v1.FpkID3.AutoSave then FpkID3v1.FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkLyrics3.SetImages(l: TStringList);
begin
   FImages.Text := l.Text;
   if l.count>0 then begin
      UseLyrics3v2 := true;
      FpkID3v1.FpkID3.UseID3v1 := true;
      FpkID3v1.UseLyrics3 := true;
   end;
   if FpkID3v1.FpkID3.AutoSave then FpkID3v1.FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkLyrics3.SetOthers(l: TStringList);
begin
   FOthers.Text := l.Text;
   if l.count>0 then begin
      UseLyrics3v2 := true;
      FpkID3v1.FpkID3.UseID3v1 := true;
      FpkID3v1.UseLyrics3 := true;
   end;
   if FpkID3v1.FpkID3.AutoSave then FpkID3v1.FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkLyrics3.SetUseTimestamp(b: boolean);
begin
   FUseTimestamp := b;
   if b then begin
      FpkID3v1.FpkID3.UseID3v1 := true;
      FpkID3v1.UseLyrics3 := true;
      UseLyrics3v2 := true;
   end;
   if FpkID3v1.FpkID3.AutoSave then FpkID3v1.FpkID3.SaveToFile; 
end;

{**********************************************************************}
procedure TpkLyrics3.AssignTo(Dest: TPersistent);
begin
   if Dest is TpkLyrics3 then begin
      with TpkLyrics3(Dest) do begin
         FAlbum     := Self.FAlbum;
         FArtist    := Self.FArtist;
         FAuthor    := Self.FAuthor;
         FTitle     := Self.FTitle;
         FUseLyrics3v2 := Self.FUseLyrics3v2;
         //:::lyricsTag  := Self.lyricsTag;
         FLyrics.Text := Self.FLyrics.Text;
         FInfos.Text := Self.FInfos.Text;
         FImages.Text := Self.FImages.Text;
         FOthers.Text := Self.FOthers.Text;
         FUseTimestamp := Self.FUseTimestamp;
         FpkID3v1   := Self.FpkID3v1;
      end;
   end else inherited AssignTo(Dest);
end;

{**********************************************************************}
procedure TpkLyrics3.Show;
begin
   FpkID3v1.FpkID3.ShowTags(false,false,true,false);
end;

{**********************************************************************}
procedure TpkLyrics3.Edit;
begin
   FpkID3v1.FpkID3.ShowTags(true,false,true,false);
   if FpkID3v1.FpkID3.FAutoSave then FpkID3v1.FpkID3.SaveToFile;
end;

{**********************************************************************}
procedure TpkLyrics3.Clear;
begin
   FLyrics.Clear;
end;

{**********************************************************************}
constructor TpkLyrics3.Create(ApkID3v1: TpkID3v1);
begin
   FpkID3v1 := ApkID3v1;
   FImages := TStringList.Create;
   FInfos := TStringList.Create;
   FLyrics := TStringList.Create;
   FOthers := TStringList.Create;
end;

{**********************************************************************}
destructor TpkLyrics3.Destroy;
begin
   FImages.Free;
   FInfos.Free;
   FLyrics.Free;
   FOthers.Free;
   inherited Destroy;
end;

{**********************************************************************}
{**********************************************************************}
constructor TpkID3.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   FpkID3v1 := TpkID3v1.Create(self);
end;

{**********************************************************************}
destructor TpkID3.Destroy;
begin
   FpkID3v1.Free;
   inherited Destroy;
end;

{**********************************************************************}
procedure TpkID3.SetProps;
begin
   FpkID3v1.SetProps;
end;

{**********************************************************************}
procedure TpkID3.SetTags;
begin
   FpkID3v1.SetTags;
end;

{**********************************************************************}
procedure TpkID3.LoadFromFile;
begin
   LoadFromFile(FFilename);
end;

{**********************************************************************}
procedure TpkID3.LoadFromFile(fn: string);
begin
   if FileExists(fn) then begin
      FFilename := fn;
      FpkID3v1.LoadFromFile(FFilename);
      FUseID3v1 := (Success = id3Success);  
   end else begin
      FSuccess := id3NoSuchFile;
   end;
   SetProps;
end;

{**********************************************************************}
procedure TpkID3.SaveToFile;
begin
   SaveToFile(FFilename);
end;

{**********************************************************************}
procedure TpkID3.SaveToFile(fn: string);
begin
   SetTags;
   if FileExists(fn) and (FpkID3v1.v1Tag.ID='TAG') then begin
      FFilename := fn;
      FpkID3v1.SaveToFile(FFilename);
      FUseID3v1 := (Success = id3Success);
   end else begin
      if FileExists(fn) then FSuccess := id3NoTags
      else FSuccess := id3NoSuchFile;
   end;
end;

{**********************************************************************}
procedure TpkID3.Clear;
begin
   FpkID3v1.Clear;
end;

{**********************************************************************}
procedure TpkID3.ShowTags(edit: boolean; f_id3v1,f_l3,f_id3v2: boolean);
var i,v: integer;
    pos: ^integer;
    cl: integer;
begin
   with TfTags.Create(nil) do begin
      tsID3v1.TabVisible := f_id3v1;
      tsLyrics.TabVisible := f_l3;
      tsLyrics3v2.TabVisible := f_l3;
      tsID3v2.TabVisible := f_id3v2;
      if f_id3v1 then pcTags.ActivePage := tsID3v1
      else if f_l3 then pcTags.ActivePage := tsLyrics
      else if f_id3v2 then pcTags.ActivePage := tsID3v2;
      tsID3v2.TabVisible := f_id3v2;
      if edit then cl := clWindow else cl := clBtnFace;
      Caption := Filename;
      eTitle.Text   := ID3v1.Title;    eTitle.ReadOnly   := not edit;  eTitle.Color   := cl;
      eArtist.Text  := ID3v1.Artist;   eArtist.ReadOnly  := not edit;   eArtist.Color  := cl;
      eAlbum.Text   := ID3v1.Album;    eAlbum.ReadOnly   := not edit;   eAlbum.Color   := cl;
      eYear.Text    := ID3v1.Year;     eYear.ReadOnly    := not edit;   eYear.Color    := cl;
      eComment.Text := ID3v1.Comment;  eComment.ReadOnly := not edit;   eComment.Color := cl;
      eTrackNo.Text := IntToStr(ID3v1.TrackNo); eTrackNo.ReadOnly := not edit; eTrackNo.Color := cl;
      for i := Low(TGenres) to High(TGenres) do begin
         GetMem(pos,SizeOf(Integer)); pos^ := i;
         cbGenre.Items.AddObject(TGenres[i],Pointer(i));
      end;
      //### Genre := ID3v1.FGenre;
      cbGenre.ItemIndex := ID3v1.GenreID;          cbGenre.Color := cl;
      cbID3v11.Checked := ID3v1.UseID3v11;         cbID3v11.Enabled := edit;
      if f_l3 then begin
         mLyrics3.Lines := ID3v1.Lyrics3.Lyrics; mLyrics3.ReadOnly := not edit; mLyrics3.Color := cl;
         mInfos.Lines   := ID3v1.Lyrics3.Infos;  mInfos.ReadOnly   := not edit;  mInfos.Color  := cl;
         mImages.Lines  := ID3v1.Lyrics3.Images; mImages.ReadOnly  := not edit; mImages.Color  := cl;
         eL3v2Title.Text   := ID3v1.Lyrics3.Title;    eL3v2Title.ReadOnly   := not edit;  eL3v2Title.Color   := cl;
         eL3v2Artist.Text  := ID3v1.Lyrics3.Artist;   eL3v2Artist.ReadOnly  := not edit;   eL3v2Artist.Color  := cl;
         eL3v2Album.Text   := ID3v1.Lyrics3.Album;    eL3v2Album.ReadOnly   := not edit;   eL3v2Album.Color   := cl;
         eL3v2Author.Text  := ID3v1.Lyrics3.Author;   eL3v2Author.ReadOnly  := not edit;   eL3v2Author.Color  := cl;
      end else begin
         mLyrics3.Lines.Clear;
         mInfos.Lines.Clear;
         mImages.Lines.Clear;
         eL3v2Title.Text   := '';
         eL3v2Artist.Text  := '';
         eL3v2Album.Text   := '';
         eL3v2Author.Text  := '';
      end;
      ShowModal;
      if edit then with ID3v1 do begin
         Title := eTitle.Text;
         Artist := eArtist.Text;
         Album := eAlbum.Text;
         Year := eYear.Text;
         GenreID := cbGenre.ItemIndex;
         Comment := eComment.Text;
         Val(eTrackNo.Text,v,i);
         if i<>0 then TrackNo := 0 else TrackNo := v;
         if f_l3 then begin
            Lyrics3.Title := eL3v2Title.Text;
            Lyrics3.Album := eL3v2Album.Text;
            Lyrics3.Artist := eL3v2Artist.Text;
            Lyrics3.Author := eL3v2Author.Text;
            //Lyrics3.lyricsTag := mLyrics3.Lines.Text;
            Lyrics3.Lyrics.Text := mLyrics3.Lines.Text;
            //Lyrics3.infosTag := mInfos.Lines.Text;
            Lyrics3.Infos.Text := mInfos.Lines.Text;
            //Lyrics3.imagesTag := mImages.Lines.Text;
            Lyrics3.Images.Text := mImages.Lines.Text;
         end;
      end;
      Release; //Free;
   end;
end;

{**********************************************************************}
procedure TpkID3.Show;
begin
   ShowTags(false,true,true,true);
end;

{**********************************************************************}
procedure TpkID3.Edit;
begin
   ShowTags(true,true,true,true);
   if FAutoSave then SaveToFile;
end;

{**********************************************************************}
procedure TpkID3.SetSuccess(s: TpkID3State);
begin
end;

{**********************************************************************}
procedure TpkID3.SetAutoLoad(b: boolean);
begin
   FAutoLoad := b;
   if b then if FileExists(FFilename) then LoadFromFile;
end;

{**********************************************************************}
procedure TpkID3.SetFilename(fn: string);
begin
   FFilename := fn;
   if FAutoLoad then LoadFromFile;
end;

{**********************************************************************}
procedure Register;
begin
  RegisterComponents('MP3', [TpkID3]);
end;

end.
