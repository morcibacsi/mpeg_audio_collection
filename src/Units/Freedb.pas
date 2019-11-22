unit Freedb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, IdComponent, IdTCPConnection, IdTCPClient,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, ExtCtrls, ImgList, Grids,
  StrUtils, OggVorbis, MPEGplus, MPEGaudio, Monkey, WaitWindow, URLMon, Global, AspiCD;

{type
  TTOC = record
    S : Integer;
    F : Byte;
    AudioTrack : BOOL; // indicates if the track is an audio or data track
  end;

  TCdToc = record
    TracksOnCD : Byte;
    Tracks : array[0..99] of TTOC;
  end; }

type
  TStringGridHack = class(TStringGrid)
  public
    procedure MoveRow(FromIndex, ToIndex: Longint);
  end;

type
  TfrmFreedb = class(TForm)
    gbSource: TGroupBox;
    gbSearchIn: TGroupBox;
    cbTrack: TCheckBox;
    cbRest: TCheckBox;
    cbArtist: TCheckBox;
    cbTitle: TCheckBox;
    eSearch: TEdit;
    rbSearch: TRadioButton;
    rbManually: TRadioButton;
    eID: TEdit;
    cbGenre: TComboBox;
    rbCalculate: TRadioButton;
    rbFromCD: TRadioButton;
    cbDrives: TComboBox;
    gbAlbum: TGroupBox;
    gbSetInfo: TGroupBox;
    bSearch: TButton;
    bSelect: TButton;
    bOK: TButton;
    bCancel: TButton;
    ListView1: TListView;
    IdAntiFreeze1: TIdAntiFreeze;
    TCP: TIdTCPClient;
    cbVarious: TCheckBox;
    cbEdit: TComboBox;
    bSetValue: TButton;
    StringGrid1: TStringGrid;
    cbEditmode: TCheckBox;
    StringGrid2: TStringGrid;
    ImageList1: TImageList;
    bMoveUp: TButton;
    bMoveDown: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bSearchClick(Sender: TObject);
    procedure bSetValueClick(Sender: TObject);
    procedure GetFreedbEntry(Genre,FreedbID:String);
    procedure CheckResultCodeStr(S: String);
    function GetCddbReturnCode(S: String): Integer;
    procedure CheckResultCode(Code: Integer);
    procedure InterpretFreedbResult(FreedbResult: TStringList);
    procedure InterpretQueryResult(Result: TStringList);
    procedure InterpretSiteResult;
    procedure CalculateFromFiles;
    procedure CalculateFromCD;
    procedure StartInternetSearch;
    procedure PrepareQuery(aFilelengths: array of Double);
    function CreateQuery(TOC: TCdToc): String;
    procedure SendQuery(Command: String);
    function CalcDiscID(CdToc: TCdToc): Cardinal;
    function cddb_sum(n: Cardinal): Cardinal;
    procedure bSelectClick(Sender: TObject);
    procedure cbVariousClick(Sender: TObject);
    procedure cbEditmodeClick(Sender: TObject);
    procedure CreateDummys;
    procedure DeleteDummys;
    procedure ClearGrid;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    function GetSubstr(InString, SeparatorStr: String; SubStrNr: Integer):string;
    function GetSubstrToRightEnd(InString, SeparatorStr: String; SubStrNr: Integer):string;
    procedure rbManuallyClick(Sender: TObject);
    procedure rbSearchClick(Sender: TObject);
    procedure rbCalculateClick(Sender: TObject);
    procedure rbFromCDClick(Sender: TObject);
    procedure AutoSizeGridColumn(Grid: TStringGrid; column, min, max: Integer);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure StringGrid2RowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure bMoveUpClick(Sender: TObject);
    procedure bMoveDownClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FileDir: String;
  end;

var
  frmFreedb: TfrmFreedb;

implementation
{$R *.dfm}
var
      MyCDRoms:TCDRoms;
      MyInterface:TCDInterface;

procedure TfrmFreedb.FormCreate(Sender: TObject);
var Index: Integer;
begin
//TCP.Host:=FreedbHost;
//TCP.Port:=FreedbPort;
TCP.Host:='freedb.freedb.org';
TCP.Port:=8880;
StringGrid1.Cells[0,0] := GetText(45);
StringGrid1.Cells[1,0] := GetText(43);
StringGrid1.Cells[2,0] := GetText(42);
StringGrid1.Cells[3,0] := GetText(44);
StringGrid1.Cells[4,0] := GetText(46);
StringGrid1.Cells[5,0] := GetText(239);
StringGrid1.Cells[6,0] := GetText(47);
StringGrid2.Cells[0,0] := GetText(105);
bSearch.Caption := GetText(15);
bSelect.Caption := GetText(277);
ListView1.Columns[0].Caption := GetText(239);
ListView1.Columns[1].Caption := GetText(44);
ListView1.Columns[2].Caption := GetText(292);
cbVarious.Caption := GetText(278);
cbEditmode.Caption := GetText(279);
bSetValue.Caption := GetText(280);
bMoveUp.Caption := GetText(281);
bMoveDown.Caption := GetText(291);
gbSource.Caption := GetText(282);
gbAlbum.Caption := GetText(283);
gbSetInfo.Caption := GetText(284);
rbFromCD.Caption := GetText(285);
rbCalculate.Caption := GetText(286);
rbManually.Caption := GetText(287);
rbSearch.Caption := GetText(288);
gbSearchIn.Caption := GetText(289);
cbArtist.Caption := GetText(43);
cbTitle.Caption := GetText(42);
cbTrack.Caption := GetText(45);
cbRest.Caption := GetText(290);
bOK.Caption := GetText(54);
bCancel.Caption := GetText(57);
Caption := GetText(293);

MyInterface := cdiAutoDetect;
if GetCdRomDrives(MyCDRoms,MyInterface) then
begin
 for Index:=0 to MyCDRoms.CdRomCount-1 do
  cbDrives.Items.Append(MyCDRoms.CdRom[Index].Description+' ('+MyCDRoms.CdRom[Index].DriveLetter+')');
end else
begin
 rbFromCD.Enabled:=false;
 cbDrives.Enabled:=false;
end;

end;

procedure TfrmFreedb.bSearchClick(Sender: TObject);
begin
 ShowWaitWindow('Freedb');
 //Preform a Query, if Manually directly ask for result

 if rbFromCD.checked then
  begin
    CalculateFromCD;
  end;

 if rbCalculate.checked then
  begin
    CalculateFromFiles;
  end;

 if rbSearch.checked then
  begin
   StartInternetSearch;
  end;

 if rbManually.checked then
  begin
    GetFreedbEntry(cbGenre.Text,eID.Text);
  end;
 CloseWaitWindow;
 
end;

procedure TfrmFreedb.bSetValueClick(Sender: TObject);
var Index, Index2: Integer;
begin
  //ListView3.Items[Index].Selected
  if StringGrid1.Selection.Top < 1 then exit;
  if (StringGrid1.RowCount=2)and(StringGrid1.Cells[0,1]='')and(StringGrid1.Cells[1,1]='')and(StringGrid1.Cells[2,1]='') then exit;
  for Index:=StringGrid1.Selection.Top to StringGrid1.Selection.Bottom do
  for Index2:=StringGrid1.Selection.Left to StringGrid1.Selection.Right do
  StringGrid1.Cells[Index2,Index]:=cbEdit.Text;
  for Index:=0 to StringGrid1.Colcount-1 do AutoSizeGridColumn(StringGrid1,Index,20,500);
end;

procedure TfrmFreedb.GetFreedbEntry(Genre, FreedbID: String);
var Str: String;
    AlbumList: TStringList;
begin
  SetWaitWindowText('Try to get album-information');
  AlbumList:=TStringList.Create;
   try
   TCP.Connect;
   except
    showmessage('Could not connect to internet.'); //MAC ERROR
    exit;
   end;

   Str := TCP.ReadLn;
   CheckResultCodeStr(Str);
   TCP.WriteLn('cddb hello '+ {e-mail before @)}'boereck'+' '+ 'mac.de'{e-mail after @)}+' MPEGAudioCollection 2.92');
   Str := TCP.ReadLn;
   CheckResultCodeStr(Str);
   TCP.WriteLn('cddb read ' + Genre + ' ' + FreedbID);
   Str := TCP.ReadLn;
   if GetCddbReturnCode(Str) = 210 then
      begin
        while Str <> '.' do
        begin
          AlbumList.Append(Str);
          Str := TCP.ReadLn;
        end;
      end
   else
      begin
        Showmessage(Str); //<- MAC Errormessage
      end;
   TCP.WriteLn('quit');
   TCP.Disconnect;
   if AlbumList.Count>0 then InterpretFreedbResult(AlbumList);
end;

procedure TfrmFreedb.CheckResultCodeStr(S: String);
begin
  CheckResultCode(GetCddbReturnCode(S));
end;

function TfrmFreedb.GetCddbReturnCode(S: String): Integer;
begin
  Result := StrToInt(Copy(S, 1, 3));
end;


procedure TfrmFreedb.CheckResultCode(Code: Integer);
begin
  if Code div 100 = 4 then
  raise Exception.Create('CDDB Error'); //<- MAC Errormessage
end;


procedure TfrmFreedb.StartInternetSearch;
var TmpStr: String;
begin
  SetWaitWindowText('Downloading website');
  TmpStr:='http://www.freedb.org/freedb_search.php?words='+AnsiReplaceStr(eSearch.Text, ' ', '+')+'&allfields=NO';
  if cbArtist.Checked then TmpStr:=TmpStr+'&fields=artist';
  if cbTitle.Checked then TmpStr:=TmpStr+'&fields=title';
  if cbTrack.Checked then TmpStr:=TmpStr+'&fields=track';
  if cbRest.Checked then TmpStr:=TmpStr+'&fields=rest';
  TmpStr:=TmpStr+'&allcats=YES&grouping=none';
  UrlDownloadToFile(nil, PChar(TmpStr), PChar(RootD+'freedbsearch.txt'), 0, nil);
  InterpretSiteResult;
end;


procedure TfrmFreedb.CalculateFromFiles;
 var Ext: String;
     Index: Integer;
     aFilelengths: array of Double;
     VorbisFile: TOggVOrbis;
     MPCFile: TMPEGplus;
     MP3File: TMPEGaudio;
     MonkeyFile: TMonkey;
begin
  VorbisFile := TOggVorbis.Create;
  MPCFile := TMPEGplus.Create;
  MP3File := TMPEGaudio.Create;
  MonkeyFile := TMonkey.Create;
  
  for Index:=1 to Stringgrid2.RowCount-1 do
  if Stringgrid2.Cells[0,Index]<>'<Dummy>' then
   begin
    Ext := ExtractFileExt(Stringgrid2.Cells[0,Index]);
    setlength(aFilelengths,length(aFilelengths)+1);

    if Ext='.ogg' then
     begin
       VorbisFile.ReadFromFile(FileDir+Stringgrid2.Cells[0,Index]);
       aFilelengths[length(aFilelengths)-1]:=VorbisFile.Duration;
     end;

    if (Ext='.mpc')or(Ext='.mp+') then
     begin
       MPCFile.ReadFromFile(FileDir+Stringgrid2.Cells[0,Index]);
       aFilelengths[length(aFilelengths)-1]:=MPCFile.Duration;
     end;

    if (Ext='.mp3')or(Ext='.mpa')or(Ext='.mp1')or(Ext='.mp2') then
     begin
       MP3File.ReadFromFile(FileDir+Stringgrid2.Cells[0,Index]);
       aFilelengths[length(aFilelengths)-1]:=MP3File.Duration;
     end;

    if Ext='.ape' then
     begin
       MonkeyFile.ReadFromFile(FileDir+Stringgrid2.Cells[0,Index]);
       aFilelengths[length(aFilelengths)-1]:=MonkeyFile.Duration;
     end;

   end;

  VorbisFile.Free;
  MPCFile.Free;
  MP3File.Free;
  MonkeyFile.Free;

  PrepareQuery(aFilelengths);
end;

procedure TfrmFreedb.PrepareQuery(aFilelengths: array of Double);
var
  I, N, Sum: Integer;
  Query: String;
  CdToc :TCdToc;
begin
  N := length(aFilelengths);
  if N = 0 then Exit;
  with CdToc do begin
    Sum := 75*2;
    TracksOnCD := N;

    for I := 0 to N-1 do begin
      Tracks[I].S := Sum div 75;
      Tracks[I].F := Sum mod 75;
      Tracks[N].AudioTrack := True;
      Sum := Sum + Round(75 * aFilelengths[i]);
    end;
    Tracks[N].S := Sum div 75;
    Tracks[N].F := Sum mod 75;
    Tracks[N].AudioTrack := False; //leadout
  end;
 Query:=CreateQuery(CdToc);
 SendQuery(Query);
end;

procedure TfrmFreedb.SendQuery(Command: String);
var Result: TStringList;
    Str: String;
    Exact: Boolean;
begin
 if Command='00000001 1 0 0' then
   begin
    showmessage('No Disk in Drive'); //<- MAC ERROR
    exit;
   end;
   SetWaitWindowText('Try to get album-information');
  Exact:=false;

   try
   TCP.Connect;
   except
    showmessage('Could not connect to internet.'); //<- MAC ERROR
    Exit;
   end;
   Result:=TStringlist.Create;
   Str := TCP.ReadLn;
   CheckResultCodeStr(Str);
   TCP.WriteLn('cddb hello '+ 'boereck' {before @}+' '+'mac.de'+' MPEGAudioCollection 2.92');
   Str := TCP.ReadLn;
   if GetCddbReturnCode(Str) div 100 = 4 then
   begin
    Showmessage(Str);
    Exit;
   end;
   TCP.WriteLn('proto 5');
   Str := TCP.ReadLn;
   CheckResultCodeStr(Str);
   TCP.WriteLn('cddb query ' + Command);
   Str := TCP.ReadLn;
    if (GetCddbReturnCode(Str) div 10 = 21) then
     begin
      Str := TCP.ReadLn;
      while Str <> '.' do begin
        Result.Append(Str);
        Str := TCP.ReadLn;
      end;
     end
    else
     if GetCddbReturnCode(Str)=200 then Exact:=true
    else Showmessage(Str); //<- MAC Error
    TCP.WriteLn('quit');
    TCP.Disconnect;

    if Exact then
     begin
        ListView1.Clear;
        ListView1.Items.Add;
        ListView1.Items[0].Caption:=GetSubstr(Str,' ',2);
        ListView1.Items[0].SubItems.Append(GetSubstrToRightEnd(Str,' ',4));
        ListView1.Items[0].SubItems.Append(GetSubstr(Str,' ',3));
        ListView1.Items[0].Selected:=true;
        GetFreedbEntry(GetSubstr(Str,' ',2),GetSubstr(Str,' ',3));
     end
    else
     InterpretQueryResult(Result);
end;

function TfrmFreedb.CreateQuery(TOC: TCdToc): String;
var
  I: Integer;
begin
  Result := LowerCase(IntToHex(CalcDiscID(Toc), 8));
  Result := Result + ' ' + IntToStr(Toc.TracksOnCD);
  for I := 0 to Toc.TracksOnCD - 1 do
  Result := Result + ' ' + IntToStr(Toc.Tracks[I].S*75 + Toc.Tracks[I].F);
  Result := Result + ' ' + IntToStr(Toc.Tracks[Toc.TracksOnCD].S);
// -Toc.Tracks[0].S);
end;

function TfrmFreedb.CalcDiscID(CdToc: TCdToc): Cardinal;
var
  n, i, t : Cardinal;
begin
  with CdToc do begin
    i := 0;
    n := 0;
    while i < TracksOnCD do
    begin
      n := n + cddb_sum(Tracks[i].S);
      i := i + 1;
    end;
    t := Tracks[TracksOnCD].S - Tracks[0].S;
    Result := ((n and $FF) shl 24) or ((t and $FFFF) shl 8) or (TracksOnCD and $FF);
  end;
end;

function TfrmFreedb.cddb_sum(n: Cardinal): Cardinal;
begin
  Result := 0;
  while (n > 0) do
  begin
    Result := Result + n mod 10;
    n := n div 10
  end
end;


procedure TfrmFreedb.CalculateFromCD;
var Query: String;
    CdToc: TCdToc;
begin
   if not ReadCdTOC(MyCDRoms,cbDrives.ItemIndex,CdToc,MyInterface)then
   begin
    showmessage('Reading CD failed'); //MAC-Error
    exit;
   end;
   Query:=CreateQuery(CdToc);
   SendQuery(Query);
end;

procedure TfrmFreedb.InterpretFreedbResult(FreedbResult: TStringList);
 var Index: integer;
     Field, Value, Album, AlbumArtist, Year, Genre, Comment: String;
begin
SetWaitWindowText('Freedb');
DeleteDummys;
ClearGrid;
cbVarious.Checked:=false;
for Index:=0 to FreedbResult.Count-1 do
  begin
    Field:=copy(FreedbResult[Index],1,Pos('=',FreedbResult[Index])-1);
    Value:=Trim(copy(FreedbResult[Index],Pos('=',FreedbResult[Index])+1,length(FreedbResult[Index])-Pos('=',FreedbResult[Index])+1));
    if Field='DTITLE' then
        begin
        if AnsiContainsText(Value,' / ') then
          begin
          AlbumArtist:=copy(Value,1,Pos(' / ',Value)-1);
          Album:=Trim(copy(Value,Pos(' / ',Value)+3,length(Value)-Pos('=',Value)+4));
          if (AlbumArtist='VA')or(AnsiLowerCase(AlbumArtist)='various artists') then cbVarious.checked:=true;
          end
        else Album:=Value;
      end;
    if Field='DYEAR' then
      begin
        Year:=Value;
      end;
    if Field='DGENRE' then
      begin
        Genre:=Value;
      end;
    if Field='EXTD' then
      begin
        Comment:=Value;
      end;
    if copy(Field,1,6)='TTITLE' then
    begin
      if StringGrid1.Cells[2,1]<>'' then StringGrid1.RowCount:=StringGrid1.RowCount+1;
      if (cbVarious.checked) and (AnsiContainsText(Value,' / ')) then
        begin
          StringGrid1.Cells[1,StringGrid1.RowCount-1]:=copy(Value,1,Pos(' / ',Value)-1);
          StringGrid1.Cells[2,StringGrid1.RowCount-1]:=Trim(copy(Value,Pos(' / ',Value)+3,length(Value)-Pos('=',Value)+3));
        end
      else
      StringGrid1.Cells[2,StringGrid1.RowCount-1]:=Value;
    end;
    if Copy(Field,1,4)='EXTT' then
      begin
        try
         StringGrid1.Cells[5,StrToInt(Copy(Field,5,length(Field)))+1]:=Value;
        except
        end;
      end;
  end;

  for Index:=1 to StringGrid1.Rowcount-1 do
    begin
      StringGrid1.Cells[0,Index]:=IntToStr(Index);
      if not cbVarious.checked then StringGrid1.Cells[1,Index]:=AlbumArtist;
      StringGrid1.Cells[3,Index]:=Album;
      StringGrid1.Cells[4,Index]:=Year;
      StringGrid1.Cells[5,Index]:=Genre;
      StringGrid1.Cells[6,Index]:=StringGrid1.Cells[5,Index]+Comment;
    end;

  for Index:=0 to StringGrid1.Colcount-1 do AutoSizeGridColumn(StringGrid1,Index,20,500);

  CreateDummys;
end;

procedure TfrmFreedb.InterpretQueryResult(Result: TStringList);
var Index: integer;
begin
  ListView1.Clear;

   for Index := 0 to Result.Count-1 do
    begin
      ListView1.Items.Add;
      ListView1.Items[ListView1.Items.Count-1].Caption:=GetSubstr(Result[Index],' ',1);
      ListView1.Items[ListView1.Items.Count-1].SubItems.Append(GetSubstrToRightEnd(Result[Index],' ',3));
      ListView1.Items[ListView1.Items.Count-1].SubItems.Append(GetSubstr(Result[Index],' ',2));
    end;

   if ListView1.Items.Count=1 then
    begin
        ListView1.Items[0].Selected:=true;
        GetFreedbEntry(ListView1.Items[0].Caption,ListView1.Items[0].SubItems[1]);
    end;
end;

procedure TfrmFreedb.InterpretSiteResult;
var TmpStr,TmpStr2: String;
    ResultFile: TextFile;
    I,J,C: Integer;
    Filethrough: boolean;
begin
  SetWaitWindowText('Interpreting website');
  Assignfile(ResultFile,RootD+'freedbsearch.txt');
  reset(ResultFile);
  repeat
   if eof(ResultFile) then break;
   Readln(ResultFile,TmpStr);

   if copy(TmpStr,1,65)='<tr><td><a href="http://www.freedb.org/freedb_search_fmt.php?cat=' then
    begin
     inc(I);
     if i<100 then
      begin
          ListView1.Items.Add;
          ListView1.Items[ListView1.Items.Count-1].Caption:=Copy(GetSubstr(TmpStr,'=',3),1,length(GetSubstr(TmpStr,'=',3))-3);
          TmpStr2:=GetSubstr(TmpStr,'=',4);
          ListView1.Items[ListView1.Items.Count-1].SubItems.Append('');
          ListView1.Items[ListView1.Items.Count-1].SubItems.Append(Copy(TmpStr2,1,8));
          J:=1;
          filethrough:=false;
          TmpStr2:=Copy(TmpStr,65,length(TmpStr)-65);
          repeat
           if (not filethrough)and(TmpStr2[j]='>') then
            begin
              inc(J);
              c:=0;
              repeat
               inc(c);
              until (copy(TmpStr2,J+c,4)='</a>')or(J+c>=length(TmpStr2));
              ListView1.Items[ListView1.Items.Count-1].SubItems[0]:=Copy(TmpStr2,j,c);
              FileThrough:=true;
              if j+c+15=length(TmpStr2) then break;
            end;

           if Copy(TmpStr2,j,54)='href="http://www.freedb.org/freedb_search_fmt.php?cat=' then
            begin
               ListView1.Items.Add;
               ListView1.Items[ListView1.Items.Count-1].SubItems.Append('');
               ListView1.Items[ListView1.Items.Count-1].SubItems.Append(ListView1.Items[ListView1.Items.Count-2].SubItems[0]);
               TmpStr:=Copy(TmpStr2,j,length(TmpStr2)-j);
               ListView1.Items[ListView1.Items.Count-1].SubItems.Append(Copy(GetSubstr(TmpStr,'=',4),1,8));
               ListView1.Items[ListView1.Items.Count-1].Caption:=Copy(GetSubstr(TmpStr,'=',3),1,length(GetSubstr(TmpStr,'=',3))-3);
               break;
            end;

          inc(j);
          until j>=length(TmpStr2);
      end;
    end;

    if copy(TmpStr,1,57)= '<a href="http://www.freedb.org/freedb_search_fmt.php?cat=' then
      begin
         ListView1.Items.Add;
         ListView1.Items[ListView1.Items.Count-1].Caption:=Copy(GetSubstr(TmpStr,'=',3),1,length(GetSubstr(TmpStr,'=',3))-3);
         ListView1.Items[ListView1.Items.Count-1].SubItems.Append(ListView1.Items[ListView1.Items.Count-2].SubItems[0]);
         ListView1.Items[ListView1.Items.Count-1].SubItems.Append(Copy(GetSubstr(TmpStr,'=',4),1,8));
      end;

  until eof(ResultFile);
  closefile(ResultFile);

 if ListView1.Items.Count = 0 then Showmessage('No enty found');
 deletefile(RootD+'freedbsearch.txt');
end;


procedure TfrmFreedb.bSelectClick(Sender: TObject);
begin
  ShowWaitWindow('Get selected entry');
  if ListView1.Selected.Index > -1 then
  GetFreedbEntry(ListView1.Selected.Caption,ListView1.Selected.SubItems[1]);
  CloseWaitWindow;
end;

procedure TfrmFreedb.cbVariousClick(Sender: TObject);
var Index :Integer;
begin
  if cbVarious.Checked then
  for Index := 1 to StringGrid1.RowCount-1 do
  if AnsiContainsText(StringGrid1.Cells[2,Index],' / ') then
   begin
     StringGrid1.Cells[1,Index] := GetSubStr(StringGrid1.Cells[2,Index],' / ',1);
     StringGrid1.Cells[2,Index] := GetSubStr(StringGrid1.Cells[2,Index],' / ',2);
   end;
  for Index:=0 to StringGrid1.Colcount-1 do AutoSizeGridColumn(StringGrid1,Index,20,500); 
end;

procedure TfrmFreedb.cbEditmodeClick(Sender: TObject);
begin
 if not cbEditmode.Checked then
  begin
   Stringgrid1.Options := [goFixedVertLine,goFixedHorzLine,goDrawFocusSelected,goColSizing,goRowMoving,goRowSelect,goThumbTracking];
   cbEdit.Enabled:=false;
  end
 else
  begin
   Stringgrid1.Options := [goFixedVertLine,goFixedHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing,goThumbTracking];
   cbEdit.Enabled:=true;
  end;
end;

procedure TfrmFreedb.CreateDummys;
var Compare, Index: Integer;
begin
 Compare := StringGrid2.RowCount - StringGrid1.RowCount;
 if Compare>0 then
 for Index := Compare downto 0 do
  begin
   StringGrid1.RowCount:=StringGrid1.RowCount+1;
   StringGrid1.Cells[0,StringGrid1.RowCount-1]:='X';
   StringGrid1.Cells[1,StringGrid1.RowCount-1]:='<Dummy>';
  end;
 if Compare<0 then
 for Index := Compare to 0 do
  begin
   StringGrid2.RowCount:=StringGrid2.RowCount+1;
   StringGrid2.Cells[0,StringGrid2.RowCount-1]:='<Dummy>';
  end;
end;

procedure TfrmFreedb.DeleteDummys;
var i,a:integer;
begin
 i:=1;
 repeat
   if (Stringgrid2.Cells[0,i]='<Dummy>')then
    begin
     if (i = Stringgrid2.RowCount - 1) then begin
       Stringgrid2.Rows[Stringgrid2.RowCount].Clear;
       Stringgrid2.RowCount := Stringgrid2.RowCount - 1
     end
     else
       begin
         for a := i to Stringgrid2.RowCount - 2 do begin
           Stringgrid2.Rows[a].Clear;
           Stringgrid2.Rows[a] := Stringgrid2.Rows[a + 1];
         end;
           Stringgrid2.Rows[Stringgrid2.RowCount].Clear;
           Stringgrid2.RowCount := Stringgrid2.RowCount - 1;
           dec(i);
       end;
     end;
    inc(i);
 until i>Stringgrid2.RowCount - 1;
end;

procedure TfrmFreedb.ClearGrid;
var Index: Integer;
begin
 for Index:=1 to Stringgrid1.RowCount-1 do Stringgrid1.Rows[Index].Clear;
 Stringgrid1.RowCount := 2;
end;

procedure TfrmFreedb.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  //
end;

function TfrmFreedb.GetSubstr(InString, SeparatorStr: String; SubStrNr: Integer):string;
var SubStrCount, LastPos, CurrentPos, ComparePos: Integer;
begin
  if (InString = '')or(length(SeparatorStr) > length(InString))or(SubStrNr<1)then exit;
  SubStrCount := 0;
  CurrentPos := 1;
  repeat
    LastPos := CurrentPos;
    inc(SubStrCount);
    ComparePos := PosEx(SeparatorStr,InString,LastPos);
    CurrentPos := ComparePos+length(SeparatorStr);
  until (SubStrCount = SubStrNr)or(ComparePos = 0);
  if ComparePos = 0 then
   begin
    if SubStrCount < SubStrNr then exit;
    CurrentPos := length(InString)+LastPos;
   end;
  Result := copy(Instring,LastPos,CurrentPos-LastPos-length(SeparatorStr));
end;

function TfrmFreedb.GetSubstrToRightEnd(InString, SeparatorStr: String;
  SubStrNr: Integer): string;
var SubStrCount, LastPos, CurrentPos, ComparePos: Integer;
begin
  if (InString = '')or(length(SeparatorStr) > length(InString))or(SubStrNr<1)then exit;
  SubStrCount := 0;
  CurrentPos := 1;
  repeat
    LastPos := CurrentPos;
    inc(SubStrCount);
    ComparePos := PosEx(SeparatorStr,InString,LastPos);
    CurrentPos := ComparePos+length(SeparatorStr);
  until (SubStrCount = SubStrNr)or(ComparePos = 0);
  if ComparePos = 0 then
   if SubStrCount < SubStrNr then exit;
  CurrentPos := length(InString)+LastPos;
  Result := copy(Instring,LastPos,CurrentPos-LastPos-length(SeparatorStr));
end;

procedure TfrmFreedb.rbManuallyClick(Sender: TObject);
begin
  eID.Enabled:=true;
  cbGenre.Enabled:=true;
  cbDrives.Enabled:=false;
  eSearch.Enabled:=false;
  cbArtist.Enabled:=false;
  cbTitle.Enabled:=false;
  cbTrack.Enabled:=false;
  cbRest.Enabled:=false;
end;

procedure TfrmFreedb.rbSearchClick(Sender: TObject);
begin
  eID.Enabled:=false;
  cbGenre.Enabled:=false;
  cbDrives.Enabled:=false;
  eSearch.Enabled:=true;
  cbArtist.Enabled:=true;
  cbTitle.Enabled:=true;
  cbTrack.Enabled:=true;
  cbRest.Enabled:=true;
end;

procedure TfrmFreedb.rbCalculateClick(Sender: TObject);
begin
  eID.Enabled:=false;
  cbGenre.Enabled:=false;
  cbDrives.Enabled:=false;
  eSearch.Enabled:=false;
  cbArtist.Enabled:=false;
  cbTitle.Enabled:=false;
  cbTrack.Enabled:=false;
  cbRest.Enabled:=false;
end;

procedure TfrmFreedb.rbFromCDClick(Sender: TObject);
begin
  eID.Enabled:=false;
  cbGenre.Enabled:=false;
  cbDrives.Enabled:=true;
  eSearch.Enabled:=false;
  cbArtist.Enabled:=false;
  cbTitle.Enabled:=false;
  cbTrack.Enabled:=false;
  cbRest.Enabled:=false;
end;

procedure TfrmFreedb.AutoSizeGridColumn(Grid: TStringGrid; column, min,
  max: Integer);
  var
    Index, tempmax, temp: Integer;
begin
    tempmax := 0;
    for Index := 0 to (Grid.RowCount - 1) do
    begin
    if column<0 then break;
      temp := Grid.Canvas.TextWidth(Grid.cells[column, Index]);
      if temp > tempmax then tempmax := temp;
      if tempmax > max then
      begin
        tempmax := max;
        break;
      end;
    end;
    if tempmax < min then tempmax := min;
    Grid.ColWidths[column] := tempmax + Grid.GridLineWidth + 3;
end;

procedure TfrmFreedb.StringGrid1DblClick(Sender: TObject);
  var
    P: TPoint;
    iColumn, iRow: Longint;
    MySelection: TGridRect;
  begin
    GetCursorPos(P);

    with StringGrid1 do
    begin
      P := ScreenToClient(P);
      MouseToCell(P.X, P.Y, iColumn, iRow);
      if P.Y < DefaultRowHeight then if cbEditmode.Checked then
      begin
        MySelection.Left:=iColumn;
        MySelection.Right:=iColumn;
        MySelection.Top:=1;
        MySelection.Bottom:=RowCount-1;
        StringGrid1.Selection:=MySelection;
      end;  //else SortGridByCol(iColumn )
    end;
end;

procedure TfrmFreedb.FormShow(Sender: TObject);
begin
 AutoSizeGridColumn(StringGrid2,0,10,500);
end;

procedure TfrmFreedb.ListView1DblClick(Sender: TObject);
begin
 bSelectClick(nil);
end;

procedure TfrmFreedb.StringGrid2RowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
 Showmessage('Hallo');
end;

procedure TfrmFreedb.bMoveUpClick(Sender: TObject);
begin
 if Stringgrid2.Selection.Top>1 then
 TStringGridHack(Stringgrid2).MoveRow(Stringgrid2.Selection.Top,Stringgrid2.Selection.Top-1);
end;


{ TStringGridHack }

procedure TStringGridHack.MoveRow(FromIndex, ToIndex: Integer);
begin
  //
  inherited;
end;


procedure TfrmFreedb.bMoveDownClick(Sender: TObject);
begin
 if Stringgrid2.Selection.Top<Stringgrid2.RowCount-1 then
 TStringGridHack(Stringgrid2).MoveRow(Stringgrid2.Selection.Top,Stringgrid2.Selection.Top+1);
end;

end.
