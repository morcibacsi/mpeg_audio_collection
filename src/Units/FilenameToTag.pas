unit FilenameToTag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Global,StrUtils;

type
  TfrmFilenameToTag = class(TForm)
    bOK: TButton;
    bCancel: TButton;
    rbGuessFromName: TRadioButton;
    rbOwnScheme: TRadioButton;
    eScheme: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image3: TImage;
    Image4: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    cbTestmode: TCheckBox;
    Image1: TImage;
    Memo1: TMemo;
    procedure Label8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure rbGuessFromNameClick(Sender: TObject);
    procedure rbOwnSchemeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function GetFilenameToTagOptions(var Options:String; var Testmode:Boolean):boolean;
  function GetTagsFromName(Filename,Options:String):TagArray;
  function CharCount(S:String; C:Char):integer;
  procedure RemoveEmptyStrings(var Strings: TStrings);
  function IsInteger(s:string):boolean;

var
  frmFilenameToTag: TfrmFilenameToTag;

implementation
const PreSet : array [0..7] of string = ('%01','%02','%03','%04','%05','%06','%07','%08');
var SchemesFile: string = 'guess.smf';

{$R *.dfm}

  function GetFilenameToTagOptions(var Options:String; var Testmode:Boolean):boolean;
  begin
   Result:=false;
  	with TfrmFilenameToTag.Create(Application) do
     begin
  	  	try if ShowModal=mrOK then Result:=true;
            if rbGuessFromName.checked then Options:='Guess'
            else Options:=eScheme.Text;
            if cbTestmode.Checked then Testmode:=true
            else Testmode:=false;
  	  	finally Release;
  	    end;
     end;
  end;

  function GetTagsFromName(Filename,Options:String):TagArray;

     function SepeateOptions(Options:String):TStrings;
      var Index: Integer;
      begin
      Result:=TStringList.Create;
      Index:=1;
       repeat
        if AnsiMatchStr(copy(Options,Index,3),PreSet) then
         begin
           Result.Append(copy(Options,Index,3));
           inc(Index,2);
           if Index+1<length(Options) then Result.Append('');
         end
        else
         begin
          if Result.Count=0 then Result.Append('');
          Result.Strings[Result.Count-1]:=Result.Strings[Result.Count-1]+Options[Index];
         end;
        inc(Index);
       until Index>length(Options);
      end;

     function GetTheTagsAndSayIfFilesFitOptions(var TheTags:TagArray; Filename:String; SeperatedOptions:TStrings):boolean;
      var Index,Index2, Index3, ActiveTag: Integer;
          Abbortstring, TempStr: String;
          Fit: Boolean;
      begin
        Result:=false;
        Fit:=true;
        Index2:=1;
        RemoveEmptyStrings(SeperatedOptions);

        TheTags[1]:='';
        TheTags[2]:='';
        TheTags[3]:='';
        TheTags[4]:='';
        TheTags[5]:='';
        TheTags[6]:='';
        TheTags[7]:='';

        for Index:=0 to SeperatedOptions.Count-1 do
         begin
          if Index2>length(Filename) then exit;

          if SeperatedOptions[Index]='%01' then ActiveTag:=1 else
          if SeperatedOptions[Index]='%02' then ActiveTag:=2 else
          if SeperatedOptions[Index]='%03' then ActiveTag:=3 else
          if SeperatedOptions[Index]='%04' then ActiveTag:=4 else
          if SeperatedOptions[Index]='%05' then ActiveTag:=5 else
          if SeperatedOptions[Index]='%06' then ActiveTag:=6 else
          if SeperatedOptions[Index]='%07' then ActiveTag:=7 else
          if SeperatedOptions[Index]='%08' then ActiveTag:=8 else
          ActiveTag:=0;


          if Index<SeperatedOptions.Count-1 then Abbortstring:=SeperatedOptions[Index+1]
          else Abbortstring:='';

          //Set Tags or skip parts between Tag-valid information

          if ActiveTag>0 then
            begin
            TempStr:='';
             while (copy(Filename,Index2,length(Abbortstring))<>Abbortstring)or((Index=SeperatedOptions.Count-1)and(Index2<=length(Filename))) do
             begin
              if ActiveTag<>8 then TempStr:=TempStr+ Filename[Index2];
              inc(Index2);
              if (Index2>length(Filename))and(Index<SeperatedOptions.Count-1) then exit;
             end;
             //Check if Tag was set before. If it was set, check if scheme fits
             if (ActiveTag<>8)and(TheTags[ActiveTag]<>'')and(TheTags[ActiveTag]<>TempStr) then Fit:=false else TheTags[ActiveTag]:=TempStr;
            end
          else
            begin
             Index3:=1;
             while  (SeperatedOptions[Index][Index3]=Filename[Index2])and(Index2<=length(Filename)) do
              begin
               inc(Index2);
               inc(Index3);
               if (Index2>length(Filename))and(Index<SeperatedOptions.Count-1) then exit;
              end;
            end
         end;
        if Fit then Result:=true;
      end;

     function NewFilename(OldName,Options :String):String;
     var Index,Index2,BackslashCount: Integer;
     begin
      Result:=OldName;
      BackslashCount:=CharCount(Options,'\');
      Index:=length(Filename);
      while ((BackslashCount>=0)and(Index>0)) do
       begin
        if Filename[Index]='\' then dec(BackslashCount);
        dec(Index);
       end;
      inc(Index,2);
      Index2:=length(Filename);
      while ((Filename[Index2]<>'.')and(Filename[Index2]<>'\'))do dec(Index2);
     if Filename[Index2]='\' then Index2:=length(Filename);
     Result:=copy(Filename,Index,Index2-Index);
     end;

     var SeperatedOptions,TheGuessSchemes: TStrings;
         Index:Integer;
         NewName: string;
  begin

  ////Extract only needed part from Filename////


   if Options='Guess' then
    begin
     TheGuessSchemes:=TStringList.Create;
     TheGuessSchemes.LoadFromFile(RootD + SchemesFile);
     for Index:=0 to TheGuessSchemes.Count-1 do
      begin
        NewName:=NewFilename(Filename,TheGuessSchemes.Strings[Index]);
        SeperatedOptions:=SepeateOptions(TheGuessSchemes.Strings[Index]);
        if (GetTheTagsAndSayIfFilesFitOptions(Result,NewName,SeperatedOptions))and((Result[4]='')or(IsInteger(Result[4]))) then break;
      end;
    end
   else
    begin
     NewName:=NewFilename(Filename,Options);
     SeperatedOptions:=SepeateOptions(Options);
     GetTheTagsAndSayIfFilesFitOptions(Result,NewName,SeperatedOptions);
    end;
  end;

function CharCount(S:String; C:Char):integer;
var Index: Integer;
begin
  Result:=0;
  for Index:=1 to length(s) do
  if s[Index]=C then inc(Result);
end;

function IsInteger(s:string):boolean;
var Index: Integer;
begin

  if s='' then
  begin
   result:=false;
  end;

  for Index:=1 to length(s) do
  if (ord(s[Index])>57) then
  begin
   result:=false;
   exit;
  end;

end;

procedure RemoveEmptyStrings(var Strings: TStrings);
var Index: Integer;
begin
Index:=0;
 repeat
  if Strings.Strings[Index]='' then Strings.Delete(Index)
  else inc(Index);
 until Index>=Strings.Count;
end;

procedure TfrmFilenameToTag.Label8Click(Sender: TObject);
begin
  eScheme.SelText:='%01';
  eScheme.SetFocus;
end;

procedure TfrmFilenameToTag.Label9Click(Sender: TObject);
begin
  eScheme.SelText:='%02';
  eScheme.SetFocus;
end;

procedure TfrmFilenameToTag.Label10Click(Sender: TObject);
begin
  eScheme.SelText:='%03';
  eScheme.SetFocus;
end;

procedure TfrmFilenameToTag.Label11Click(Sender: TObject);
begin
  eScheme.SelText:='%04';
  eScheme.SetFocus;
end;

procedure TfrmFilenameToTag.Label12Click(Sender: TObject);
begin
  eScheme.SelText:='%05';
  eScheme.SetFocus;
end;

procedure TfrmFilenameToTag.Label13Click(Sender: TObject);
begin
  eScheme.SelText:='%06';
  eScheme.SetFocus;
end;

procedure TfrmFilenameToTag.Label14Click(Sender: TObject);
begin
  eScheme.SelText:='%07';
  eScheme.SetFocus;
end;

procedure TfrmFilenameToTag.Label15Click(Sender: TObject);
begin
  eScheme.SelText:='%08';
  eScheme.SetFocus;
end;

procedure TfrmFilenameToTag.rbGuessFromNameClick(Sender: TObject);
begin
  eScheme.Enabled:=false;
end;

procedure TfrmFilenameToTag.rbOwnSchemeClick(Sender: TObject);
begin
  eScheme.Enabled:=true;
end;

procedure TfrmFilenameToTag.FormCreate(Sender: TObject);
begin
  Label8.Caption := GetText(42);
  Label9.Caption := GetText(43);
  Label10.Caption := GetText(44);
  Label11.Caption := GetText(45);
  Label12.Caption := GetText(46);
  Label13.Caption := GetText(47);
  Caption := GetText(268);
  Label14.Caption := GetText(239);
  Label15.Caption := GetText(271);
  rbGuessFromName.Caption := GetText(269);
  rbOwnScheme.Caption := GetText(270);
  cbTestmode.Caption := GetText(272);
  bOK.Caption := GetText(54);
  bCancel.Caption := GetText(57);
end;

procedure TfrmFilenameToTag.bOKClick(Sender: TObject);
begin
if not fileexists(RootD + SchemesFile) then Memo1.Lines.SaveToFile(RootD + SchemesFile);
end;

end.
