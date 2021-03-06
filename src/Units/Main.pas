{ *************************************************************************** }
{                                                                             }
{ MPEG Audio Collection                                                       }
{                                                                             }
{ http://sourceforge.net/projects/mac                                         }
{ e-mail: macteam@users.sourceforge.net                                       }
{                                                                             }
{ Copyright (c) 2000-2002 by Jurgen Faul                                      }
{ Copyright (c) 2003 by The MAC Team                                          }
{                                                                             }
{ This library is free software; you can redistribute it and/or               }
{ modify it under the terms of the GNU Lesser General Public                  }
{ License as published by the Free Software Foundation; either                }
{ version 2.1 of the License, or (at your option) any later version.          }
{                                                                             }
{ This library is distributed in the hope that it will be useful,             }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of              }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU           }
{ Lesser General Public License for more details.                             }
{                                                                             }
{ You should have received a copy of the GNU Lesser General Public            }
{ License along with this library; if not, write to the Free Software         }
{ Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   }
{                                                                             }
{ *************************************************************************** }

unit Main;

interface

uses
	FileRenamer, FileInfo, FolderInfo, Clipbrd,
	RenameLabel,
  ColumnsDialog, PrintCover, Options, ReportDialog,
  Find, ReportProcess, ScanDialog, SourcePath, TagEditor, SelectVolume,
  ProgressWindow, Statistic, About, WaitWindow, MessageDialog, Global,

  Windows, SysUtils, Classes, Forms, Registry, ShellAPI,
  Dialogs, Menus, ImgList, Controls, ComCtrls, ToolWin, StdCtrls,
  FileCtrl, ExtCtrls, Graphics;

type
  TfrmMain = class(TForm)
		MainMenu1: TMainMenu;
    Collection1: TMenuItem;
    Edit1: TMenuItem;
    View1: TMenuItem;
    Tools1: TMenuItem;
    Help1: TMenuItem;
		New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N1: TMenuItem;
    Import1: TMenuItem;
    Statistic1: TMenuItem;
		Report1: TMenuItem;
    N2: TMenuItem;
		Exit1: TMenuItem;
		Add1: TMenuItem;
		Delete1: TMenuItem;
    Toolbar1: TMenuItem;
    Statusbar1: TMenuItem;
    Tageditor1: TMenuItem;
    CDcover1: TMenuItem;
    N7: TMenuItem;
    Options1: TMenuItem;
    Info1: TMenuItem;
    History1: TMenuItem;
    License1: TMenuItem;
    N8: TMenuItem;
    Feedback1: TMenuItem;
    Homepage1: TMenuItem;
    N9: TMenuItem;
		About1: TMenuItem;
		N5: TMenuItem;
    Sort1: TMenuItem;
    StatusBar2: TStatusBar;
    Panel1: TPanel;
    TreeView1: TTreeView;
		Splitter1: TSplitter;
		ListView1: TListView;
		TreeView2: TTreeView;
		ListBox1: TListBox;
    ListBox2: TListBox;
    Gridlines1: TMenuItem;
    N10: TMenuItem;
    Hottrack1: TMenuItem;
    DirectoryListBox1: TDirectoryListBox;
    OpenDialog1: TOpenDialog;
    ImageList1: TImageList;
    SaveDialog1: TSaveDialog;
    ImageList2: TImageList;
    FileListBox1: TFileListBox;
    TreeView3: TTreeView;
    ListBox3: TListBox;
    PopupMenu1: TPopupMenu;
    Play1: TMenuItem;
    Enqueue1: TMenuItem;
    N3: TMenuItem;
    Update1: TMenuItem;
    Delete2: TMenuItem;
    Playlist1: TMenuItem;
    DriveComboBox1: TDriveComboBox;
    PopupMenu2: TPopupMenu;
    Select1: TMenuItem;
    Search1: TMenuItem;
    Rename1: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    Font1: TMenuItem;
    FontDialog1: TFontDialog;
    N18: TMenuItem;
    Update2: TMenuItem;
    Rename2: TMenuItem;
    Columns1: TMenuItem;
    ListBox4: TListBox;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ImageList3: TImageList;
    Reopen1: TMenuItem;
    Information1: TMenuItem;
    Fileextensions1: TMenuItem;
    Cheat1: TMenuItem;
    Fullpath1: TMenuItem;
    Selection1: TMenuItem;
    Filerenamer1: TMenuItem;
    ToolButton4: TToolButton;
    Copy1: TMenuItem;
    Image1: TImage;
    OpenDir: TMenuItem;
    ToolButton13: TToolButton;
    EditID3: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    lvSearchResults: TListView;
    pmnSearch: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    Panel5: TPanel;
    ILSearchResults: TImageList;
    cbDuplicates: TComboBox;
    Delete4: TMenuItem;
    Delete3: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ListBox5: TListBox;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    tvArtists: TTreeView;
		procedure Toolbar1Click(Sender: TObject);
		procedure Statusbar1Click(Sender: TObject);
		procedure Gridlines1Click(Sender: TObject);
		procedure Hottrack1Click(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure Info1Click(Sender: TObject);
		procedure History1Click(Sender: TObject);
		procedure License1Click(Sender: TObject);
		procedure Homepage1Click(Sender: TObject);
		procedure Feedback1Click(Sender: TObject);
		procedure Open1Click(Sender: TObject);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
		procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
			Selected: Boolean);
		procedure About1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure ListView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListView1DblClick(Sender: TObject);
    procedure Statistic1Click(Sender: TObject);
    procedure Tageditor1Click(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Sort1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure New1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
		procedure Import1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
		procedure PopupMenu1Popup(Sender: TObject);
		procedure Delete2Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
		procedure Play1Click(Sender: TObject);
    procedure Enqueue1Click(Sender: TObject);
    procedure Playlist1Click(Sender: TObject);
    procedure Update1Click(Sender: TObject);
    procedure Report1Click(Sender: TObject);
		procedure FormResize(Sender: TObject);
    procedure CDcover1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure Select1Click(Sender: TObject);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Search1Click(Sender: TObject);
    procedure Rename1Click(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure Font1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Columns1Click(Sender: TObject);
    procedure Collection1Click(Sender: TObject);
    procedure Information1Click(Sender: TObject);
    procedure Fileextensions1Click(Sender: TObject);
    procedure Cheat1Click(Sender: TObject);
    procedure ListView1Editing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure ListView1Edited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure Fullpath1Click(Sender: TObject);
    procedure Selection1Click(Sender: TObject);
    procedure Filerenamer1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);

    function CreatePlayList(SNode: TTreeNode; PlayList: TListBox): string;
    procedure OpenDirClick(Sender: TObject);

    procedure ToolButton13Click(Sender: TObject);
    procedure EditID3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lvSearchResultsDblClick(Sender: TObject);
    procedure lvSearchResultsColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvSearchResultsCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lvSearchResultsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuItem7Click(Sender: TObject);
    procedure cbDuplicatesChange(Sender: TObject);
//    procedure ListView1Resize(Sender: TObject);
    procedure ListView1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lvSearchResultsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Delete3Click(Sender: TObject);
    procedure Delete4Click(Sender: TObject);
    procedure pmnSearchPopup(Sender: TObject);
    function GetSelectedNode: TTreeNode;

    private
		procedure SetCaptions;
		procedure ShowTextFile(FileName: string);
		function QuestionForSaveCollection: byte;
		function OpenCollectionOK(FileName: string): boolean;
		procedure UpdateInformation;
		function SaveCollectionOK(FileName: string): boolean;
		procedure OnSaveCollection(FileName, WindowTitle: string);
		procedure OpenListViewItem;
		procedure NewCollection;
		procedure UpdateTreeView;
		procedure DeleteSelectedVolume;
    procedure MergeSelectedVolume;
		function ImportDataOK(FileName: string): boolean;
		procedure ShowNode(Node: TTreeNode);
		procedure SetLanguage(var FileName: string);
		procedure WriteSettings;
		procedure ReadSettings;
		function ConvertOK(FileName: string): boolean;
		procedure UpdateVolume(SourcePath: string; UpdatedNode: TTreeNode);
    procedure AddToPopup(FileName: string);
    procedure OnPopupClick(Sender: TObject);
    procedure OnClearPopup(Sender: TObject);
    procedure OpenFile(FileName: string);
		function FindDuplicates(FirstItem: longint; SPath: string): TTreeNode;
		function FindDuplicatesOK(FItem: longint): boolean;
    function FindName(FirstItem: longint; SPath: string): TTreeNode;
    function FindNameOK(FItem: longint): boolean;
    function FindTag(FirstItem: longint; SPath: string): TTreeNode;
    function FindTagOK(FItem: longint): boolean;
    function FindProperty(FirstItem: longint; SPath: string): TTreeNode;
    function FindPropertyOK(FItem: longint): boolean;
    function GetDate(Node: TTreeNode): string;
    procedure OnSearch;
    procedure SetColumns(ListView:TListView);   //PinterPeti added parameter to procedure
    procedure MarkUp(Node: TTreeNode; Marked: boolean);
    procedure MarkDown(Node: TTreeNode; Marked: boolean);

    public
      procedure UpdateListView;    //PinterPeti
      procedure UpdateControls;    //PinterPeti
      procedure DuplicateOnChange; //PinterPeti

      function SaveResults(FName:String;Mode:Byte):Boolean;  //PinterPet
      function ShowSearchResults(SPath: string; GD, HT: boolean; Mode: Byte): TTreeNode; //PinterPeti
	end;

var
	frmMain: TfrmMain;
	SourcePath:String;   //PinterPeti
	FindItem: TTreeNode; //PinterPeti
	//frmFind: TfrmFind;   //PinterPeti
	SearchArea:Byte;     //PinterPeti

implementation

uses EditTag, EditOggTag, Helpers;

{$R *.DFM}

{ --------------------------------------------------------------------------- }

function TfrmMain.SaveResults(FName:String;Mode:Byte):Boolean; //PinterPet
const PText: array [1..6] of array [0..2] of string =
            (('128', '160', '192'),
             ('22050', '32000', '41000'),
             ('1', '0', '0'),
             ('1', '2', '2.5'),
             ('1', '2', '3'),
             ('0', '0', '0'));
        PPointer: array [0..2] of string = ('<', '=', '>');
var RFile: TextFile;
    ListItem: TListItem;
    Index, Index2, FirstLine: longint;
    Duplicate, Path: string;
    Item, ParentNode: TTreeNode;

begin
  case Mode of
    0:begin  //NameResults
        try
          FileSetAttr(FName, 0);
          AssignFile(RFile, FName);
          Rewrite(RFile);
          Writeln(RFile, GetText(140) + ': ' + GetText(120));
          Writeln(RFile, '');
          Writeln(RFile, GetText(179) + ': ' + LastNameText[1]);
          if NameCase then
            Writeln(RFile, GetText(127) + ': ' + GetText(55))
          else
            Writeln(RFile, GetText(127) + ': ' + GetText(56));
          Writeln(RFile, '');
          for Index := 0 to lvSearchResults.Items.Count - 1 do begin
            ListItem := lvSearchResults.Items[Index];
            Writeln(RFile, ListItem.Caption);
          end;
          CloseFile(RFile);
          Result := true;
          except
            Result := false;
        end;
      end;
    1:begin //PropertyResults
        try
          FileSetAttr(FName, 0);
          AssignFile(RFile, FName);
          Rewrite(RFile);
          Writeln(RFile, GetText(140) + ': ' + GetText(20) + ': ' + IntToStr(lvSearchResults.Items.Count));
          Writeln(RFile, '');
          if Prop[1, 1] = 1 then Writeln(RFile, GetText(131) + ': ' + PPointer[Prop[1, 2]] + ' ' + PText[1, Prop[1, 3]] + ' ' + GetText(67));
          if Prop[2, 1] = 1 then Writeln(RFile, GetText(132) + ': ' + PPointer[Prop[2, 2]] + ' ' + PText[2, Prop[2, 3]] + ' ' + GetText(70));
          if Prop[3, 1] = 1 then
            if Prop[3, 2] = 0 then
              Writeln(RFile, GetText(133) + ': ' + GetText(74))
            else
              Writeln(RFile, GetText(133) + ': ' + GetText(71));
          if Prop[4, 1] = 1 then
            Writeln(RFile, GetText(134) + ': ' + PPointer[Prop[4, 2]] + ' ' + PText[4, Prop[4, 3]]);
          if Prop[5, 1] = 1 then
            Writeln(RFile, GetText(135) + ': ' + PPointer[Prop[5, 2]] + ' ' + PText[5, Prop[5, 3]]);
          if Prop[6, 1] = 1 then
            if Prop[6, 2] = 0 then
              Writeln(RFile, GetText(136) + ': ' + GetText(137))
            else
              Writeln(RFile, GetText(136) + ': ' + GetText(138));

          Writeln(RFile, '');
          for Index := 0 to lvSearchResults.Items.Count - 1 do begin
            ListItem := lvSearchResults.Items[Index];
            Writeln(RFile, ListItem.Caption);
          end;
          CloseFile(RFile);
          Result := true;
          except
            Result := false;
        end;
      end;
    2:begin //Tag
        try
          FileSetAttr(FName, 0);
          AssignFile(RFile, FName);
          Rewrite(RFile);
          Writeln(RFile, GetText(140) + ': ' + GetText(19) + ': ' + IntToStr(lvSearchResults.Items.Count));
          Writeln(RFile, '');
          for Index := 1 to numTag do // MB
            if Trim(TagText[Index]) <> '' then
              Writeln(RFile, GetText(Index + 41) + ': ' + TagText[Index]);
          Writeln(RFile, '');

          for Index := 0 to lvSearchResults.Items.Count - 1 do begin
              ListItem := lvSearchResults.Items[Index];
              Writeln(RFile, ListItem.Caption);
          end;
          CloseFile(RFile);
          Result := true;
          except
            Result := false;
        end;
      end;
    3:begin //Duplicates
        try
          FileSetAttr(FName, 0);
          AssignFile(RFile, FName);
          Rewrite(RFile);
          Writeln(RFile, GetText(140) + ': ' + GetText(20) + ': ' + IntToStr(lvSearchResults.Items.Count));
          for Index2 := 0 to cbDuplicates.Items.Count - 1 do begin
            FirstLine := integer(cbDuplicates.Items.Objects[Index2]);
            Duplicate := STempList.Items.Strings[FirstLine];
            Index := FirstLine;
            Writeln(RFile, '');
            Writeln(RFile, cbDuplicates.Items.Strings[Index2]);
            repeat
              Item := TTreeNode(STempList.Items.Objects[Index]);
              Path := '';
              ParentNode := Item;
              while (ParentNode.Level > 1) do begin
                ParentNode := ParentNode.Parent;
                Path := ExtractName(ParentNode.Text) + '\' + Path;
              end;
              if SourcePath <> '' then begin
                if Pos('\', Path) > 0 then
                  Delete(Path, 1, Pos('\', Path))
                else
                  Path := '';
                Path := Copy(SourcePath, 1, 3) + Path;
              end;
              if (Length(Path) > 0) and (Path[Length(Path)] = '\') then
                Delete(Path, Length(Path), 1);
                Writeln(RFile, Path + '\' + ExtractName(Item.Text));
                Inc(Index);
            until (Index >= STempList.Items.Count) or (CompareText(Duplicate, STempList.Items.Strings[Index]) <> 0);
          end;
          CloseFile(RFile);
          Result := true;
          except
            Result := false;
        end;
      end;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.DuplicateOnChange;          //PinterPeti copied from DuplicatesResults.pas
var Index, FirstLine, BitRate: longint;       //TempList > STempList (SearchTemplist)
    ListItem: TListItem;
    Line,Duplicate, Path, ItemText: string;
    Item, ParentNode: TTreeNode;
    FileData: DataArray;
    FileTag: TagArray;
    ColCounter:byte;
begin
  with frmMain do begin
    cbDuplicates.Hint := cbDuplicates.Items.Strings[cbDuplicates.ItemIndex];
    FirstLine := integer(cbDuplicates.Items.Objects[cbDuplicates.ItemIndex]);
    Duplicate := STempList.Items.Strings[FirstLine];
    Index := FirstLine;
    lvSearchResults.Items.Clear;
    repeat
      Item := TTreeNode(STempList.Items.Objects[Index]);
      ListItem := lvSearchResults.Items.Insert(0);
      ListItem.Data := Item;
      ItemText := ExtractName(Item.Text);
      FileTag := ExtractTag(Item.Text);
      FileData := ExtractData(Item.Text);
      if not Item.HasChildren then begin
        if (not FileExtensions) and (Pos('.', ItemText) > 0) then
          ItemText := Copy(ItemText, 1, LastDelimiter('.', ItemText) - 1);
        ListItem.ImageIndex := 1;
        FileTag := ExtractTag(Item.Text);
      end;
      Path := '';
      ParentNode := Item;
      while (ParentNode.Level > 1) do begin
        ParentNode := ParentNode.Parent;
        if (ParentNode.Level > 1) or (SourcePath <> '') then
          Path := ExtractName(ParentNode.Text) + '\' + Path
        else
          Path := TTreeNode(ParentNode.Data).Text + '\' + Path;
      end;
      if Length(Path) > 0 then
        Delete(Path, Length(Path), 1);
      if SourcePath <> '' then begin
        if Pos('\', Path) > 0 then
          Delete(Path, 1, Pos('\', Path))
        else
          Path := '';
        Path := Copy(SourcePath, 1, 3) + Path;
      end;
      if (Length(Path) > 0) and (Path[Length(Path)] = '\') then
        Delete(Path, Length(Path), 1);
///////////////
      //FileData
        //1 - Size
        //2 - ??
        //3 - Sample Rate
        //4 - Channel Type
        //5 - Type
        //6 - ??
      //FileTag
        //1 - Title
        //2 - Artist
        //3 - Album
        //4 - Track
        //5 - Year
        //6 - Comment
        //7 - Genre
///////////////
      ListItem.Caption := Path + '\' + ItemText;
      for ColCounter := 1 to lvSearchResults.Columns.Count-1 do begin         //Determine what should go where
        if lvSearchResults.Columns[ColCounter].Caption = GetText(42) then
          ListItem.SubItems.Add(FileTag[1])
        else if lvSearchResults.Columns[ColCounter].Caption = GetText(43) then
          ListItem.SubItems.Add(FileTag[2])
        else if lvSearchResults.Columns[ColCounter].Caption = GetText(44) then
          ListItem.SubItems.Add(FileTag[3])
        else if lvSearchResults.Columns[ColCounter].Caption = GetText(45) then
          ListItem.SubItems.Add(FileTag[4])
        else if lvSearchResults.Columns[ColCounter].Caption = GetText(46) then
          ListItem.SubItems.Add(FileTag[5])
        else if lvSearchResults.Columns[ColCounter].Caption = GetText(47) then
          ListItem.SubItems.Add(FileTag[6])
        else if lvSearchResults.Columns[ColCounter].Caption = GetText(239) then
          ListItem.SubItems.Add(FileTag[7])

        else if lvSearchResults.Columns[ColCounter].Caption = GetText(172) then
          ListItem.SubItems.Add(DurationToShortStr(Abs(FileData[2])))
        else if lvSearchResults.Columns[ColCounter].Caption = GetText(171) then
          ListItem.SubItems.Add(FloatToStrF(FileData[1] / 1024, ffFixed, 15, 2) + ' ' + GetText(62))
        else if lvSearchResults.Columns[ColCounter].Caption = GetText(132) then
          ListItem.SubItems.Add(IntToStr(FileData[3] * 10) + ' ' + GetText(70))
        else if lvSearchResults.Columns[ColCounter].Caption = GetText(131) then begin
          if FileData[2] <> 0 then
            BitRate := Trunc(FileData[1] * 8 * 1.024 / Abs(FileData[2]))
          else
            BitRate := 0;
          if FileData[2] < 0 then
            Line := FormatFloat('000', BitRate) + ' ' + GetText(67) + ' ' + GetText(66)
          else begin
            BitRate := AlignedBitRate(BitRate, FileData[3], FileData[4], FileData[5], FileData[6]);
            Line := FormatFloat('000', BitRate) + ' ' + GetText(67) + ' ' + GetText(148);
          end;
            ListItem.SubItems.Add(Line);
        end else if lvSearchResults.Columns[ColCounter].Caption = GetText(133) then
          ListItem.SubItems.Add(GetChannelMode(FileData[4]))
        else if lvSearchResults.Columns[ColCounter].Caption = GetText(211) then
          ListItem.SubItems.Add(GetMPEGType(FileData[5], FileData[6]))
      end;
      Inc(Index);
    until (Index >= STempList.Items.Count) or (CompareText(Duplicate, STempList.Items.Strings[Index]) <> 0);//SSS
    lvSearchResults.AlphaSort;
    lvSearchResults.Selected := lvSearchResults.Items[0];
    lvSearchResults.ItemFocused := lvSearchResults.Selected;
  end;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.ShowSearchResults(SPath: string; GD, HT: boolean; Mode: Byte): TTreeNode;
var Index, BitRate: LongInt;                  //PinterPeti copied from PropertyResults.pas
    ListItem: TListItem;                              //TempList > STempList (SearchTemplist)
    Path,{ItemText,Line} Temp: string;
    Item, ParentNode: TTreeNode;
    FileData: DataArray;
    FileTag: TagArray;
    ColCounter: Byte;
    Duplicate, NameText, PropertyText, TagText, DuplicateCaption: string;
begin
  with frmMain do try
    begin
      cbDuplicates.Clear;
      cbDuplicates.Enabled := False;
      SourcePath := SPath;
      lvSearchResults.GridLines := GD;
      lvSearchResults.RowSelect := lvSearchResults.GridLines;
      lvSearchResults.HotTrack := HT;
      FindItem := nil;
      ShowProgressWindow(GetText(141));
      case Mode of
        0: Tag := 0;       {NameResults}
        1: ;               {PropertyResults}
        2: Tag := 1;       {TagResults}
        3: Duplicate := '';{DuplicateResults}
      end;
      for Index := 0 to STempList.Items.Count - 1 do begin
        if (Index mod 100) = 0 then
          SetProgressValue(Round(Index / STempList.Items.Count * 100));
        Item := TTreeNode(STempList.Items.Objects[Index]);
        if Mode = 3 then begin
          if CompareText(Duplicate, STempList.Items.Strings[Index]) <> 0 then begin
            Duplicate := STempList.Items.Strings[Index];
            if CompareName then
              NameText := ', ' + ExtractName(Item.Text)
            else
              NameText := '';
            if CompareTag then begin
              FileTag := ExtractTag(Item.Text);
              TagText := ', ' + FileTag[2] + ' - ' + FileTag[1];
            end else
              TagText := '';
            if CompareProperty then begin
              FileData := ExtractData(Item.Text);
              PropertyText := ',  ' + FloatToStrF(FileData[1] / 1024, ffFixed, 15, 3)
                  + ' ' + GetText(62) + ',  ' + DurationToStr(Abs(FileData[2])) + ' ' + GetText(64);
            end else
              PropertyText := '';
            DuplicateCaption := NameText + TagText + PropertyText;
            Delete(DuplicateCaption, 1, 2);
            cbDuplicates.Items.Add(DuplicateCaption);
            cbDuplicates.Items.Objects[cbDuplicates.Items.Count - 1] := TObject(Index);
          end;
        end else if Mode <> 3 then begin
          FileData := ExtractData(Item.Text);
          FileTag := ExtractTag(Item.Text);
          ListItem := lvSearchResults.Items.Add;
          ListItem.Data := Item;
          {ItemText}Temp := ExtractName(Item.Text);
          if (not FileExtensions) and (Pos('.', {ItemText}Temp) > 0) then
            {ItemText}Temp := Copy({ItemText}Temp, 1, LastDelimiter('.', {ItemText}Temp) - 1);
          Path := '';
          ParentNode := Item;
          while (ParentNode.Level > 1) do begin
            ParentNode := ParentNode.Parent;
            if (ParentNode.Level > 1) or (SourcePath <> '') then
              Path := ExtractName(ParentNode.Text) + '\' + Path
            else
              Path := TTreeNode(ParentNode.Data).Text + '\' + Path;
          end;
          if Length(Path) > 0 then
            Delete(Path, Length(Path), 1);
          if SourcePath <> '' then begin
            if Pos('\', Path) > 0 then
              Delete(Path, 1, Pos('\', Path))
            else
              Path := '';
            Path := Copy(SourcePath, 1, 3) + Path;
          end;
          if (Length(Path) > 0) and (Path[Length(Path)] = '\') then
            Delete(Path, Length(Path), 1);
{-----------------------------}
      //FileData
        //1 - Size
        //2 - ??
        //3 - Sample Rate
        //4 - Channel Type
        //5 - Type
        //6 - ??
      //FileTag
        //1 - Title
        //2 - Artist
        //3 - Album
        //4 - Track
        //5 - Year
        //6 - Comment
        //7 - Genre
{-----------------------------}
          ListItem.Caption := Path + '\' + {ItemText}Temp;
          for ColCounter := 1 to lvSearchResults.Columns.count-1 do begin            //Determine what should go where
            if lvSearchResults.Columns[ColCounter].Caption = GetText(42) then
              ListItem.SubItems.Add(FileTag[1])
            else if lvSearchResults.Columns[ColCounter].Caption = GetText(43) then
              ListItem.SubItems.Add(FileTag[2])
            else if lvSearchResults.Columns[ColCounter].Caption = GetText(44) then
              ListItem.SubItems.Add(FileTag[3])
            else if lvSearchResults.Columns[ColCounter].Caption = GetText(45) then
              ListItem.SubItems.Add(FileTag[4])
            else if lvSearchResults.Columns[ColCounter].Caption = GetText(46) then
              ListItem.SubItems.Add(FileTag[5])
            else if lvSearchResults.Columns[ColCounter].Caption = GetText(47) then
              ListItem.SubItems.Add(FileTag[6])
            else if lvSearchResults.Columns[ColCounter].Caption = GetText(239) then
              ListItem.SubItems.Add(FileTag[7])

            else if lvSearchResults.Columns[ColCounter].Caption = GetText(172) then
              ListItem.SubItems.Add(DurationToShortStr(Abs(FileData[2])))
            else if lvSearchResults.Columns[ColCounter].Caption = GetText(171) then
              ListItem.SubItems.Add(FloatToStrF(FileData[1] / 1024, ffFixed, 15, 2) + ' ' + GetText(62))
            else if lvSearchResults.Columns[ColCounter].Caption = GetText(132) then
              ListItem.SubItems.Add(IntToStr(FileData[3] * 10) + ' ' + GetText(70))
            else if lvSearchResults.Columns[ColCounter].Caption = GetText(131) then begin
              if FileData[2] <> 0 then
                BitRate := Trunc(FileData[1] * 8 * 1.024 / Abs(FileData[2]))
              else
                BitRate := 0;
              if FileData[2] < 0 then
                {Line}Temp := FormatFloat('000', BitRate) + ' ' + GetText(67) + ' ' + GetText(66)
              else begin
                BitRate := AlignedBitRate(BitRate, FileData[3], FileData[4], FileData[5], FileData[6]);
                {Line}Temp := FormatFloat('000', BitRate) + ' ' + GetText(67) + ' ' + GetText(148);
              end;
              ListItem.SubItems.Add({Line}Temp);
            end else if lvSearchResults.Columns[ColCounter].Caption = GetText(133) then
              ListItem.SubItems.Add(GetChannelMode(FileData[4]))
            else if lvSearchResults.Columns[ColCounter].Caption = GetText(211) then
              ListItem.SubItems.Add(GetMPEGType(FileData[5], FileData[6]))
          end;
        end;
        lvSearchResults.Selected := lvSearchResults.Items[0];
        lvSearchResults.ItemFocused := lvSearchResults.Selected;
      end;
      if Mode = 3 then begin
        cbDuplicates.Enabled := True;
        cbDuplicates.ItemIndex := 0;
        DuplicateOnChange;
      end;
      CloseProgressWindow;
      Result := FindItem;
//      lvSearchResultsColumnClick(lvSearchResults,lvSearchResults.Columns[0]);
    end;
    finally
  end;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmMain.WriteSettings;
var
	Reg: TRegistry;
	Index, Value: longint;
begin
	Reg := TRegistry.Create;

	Reg.RootKey := HKEY_CURRENT_USER;

	if Reg.OpenKey('\Software\' + AppTitle, true) then
		try
			Reg.WriteString('LangName', LangName);
			Reg.WriteString('CurrentCollection', CurrentCollection);
			Reg.WriteInteger('FindArea', FindArea);
			for Index := 1 to 6 do Reg.WriteString('LastNameText' + IntToStr(Index), LastNameText[Index]);
			Reg.WriteInteger('NameArea', NameArea);
			Reg.WriteBool('NameCase', NameCase);
			for Index := 0 to 17 do Reg.WriteInteger('Property' + IntToStr(Index), Prop[(Index div 3) + 1, (Index mod 3) + 1]);
			for Index := 1 to numTag do Reg.WriteString('TagText' + IntToStr(Index), TagText[Index]); // MB
			Reg.WriteBool('AutoOpen', AutoOpen);
			Reg.WriteBool('UseWindowSettings', UseWindowSettings);
			for Index := 1 to 21 do Reg.WriteBool('ReportItems' + IntToStr(Index), RowCol[Index]);
      for Index := 1 to 17 do Reg.WriteInteger('ReportItemsIndex' + IntToStr(Index), RowColIndex[Index]);
			Reg.WriteInteger('ReportFormat', RFormat);
      Reg.WriteInteger('ReportScanning', RScanning);
			Reg.WriteString('LastReportFile', LastReportFile);
			Reg.WriteString('LastOpenDir', LastOpenDir);
			Reg.WriteString('LastSaveDir', LastSaveDir);
			Reg.WriteBool('CompareName', CompareName);
			Reg.WriteBool('CompareProperty', CompareProperty);
			for Index := 1 to 5 do Reg.WriteString('LastCol' + IntToStr(Index), LastCol[Index]);
      Reg.WriteString('LastDrive', LastDrive);
      Reg.WriteInteger('LastZoom', LastZoom);
      Reg.WriteString('FontName', FontName);
      Reg.WriteInteger('FontSize', FontSize);
      Reg.WriteInteger('FontColor', FontColor);
      Reg.WriteInteger('FontCharSet', FontCharSet);
      for Index := 1 to 4 do Reg.WriteBool('FontStyle' + IntToStr(Index), FontStyle[Index]);
      for Index := 1 to 2 do Reg.WriteInteger('Stretch' + IntToStr(Index), IStretch[Index]);

			Reg.WriteBool('GridLines', Gridlines1.Checked);
			Reg.WriteBool('HotTrack', Hottrack1.Checked);
			Reg.WriteBool('Toolbar', Toolbar1.Checked);
			Reg.WriteBool('Statusbar', Statusbar1.Checked);
            Reg.WriteInteger('SearchPanelHeight', Panel3.Height); //PinterPeti
			Reg.WriteInteger('PanelWidth', Panel1.Width);
      Reg.WriteInteger('Top', Top);
			Reg.WriteInteger('Left', Left);
			Reg.WriteInteger('Height', Height);
			Reg.WriteInteger('Width', Width);

      Reg.WriteInteger('SearchTop', SearchTop);
			Reg.WriteInteger('SearchLeft', SearchLeft);
			Reg.WriteInteger('SearchHeight', SearchHeight);
			Reg.WriteInteger('SearchWidth', SearchWidth);

      Reg.WriteBool('ReportSorting', RSorting);
      Reg.WriteInteger('DuplicateArea', DuplicateArea);
      Reg.WriteInteger('ColumnToSorting', ColumnToSorting);

      for Index := 1 to numTag do Reg.WriteBool('TagField' + IntToStr(Index), TagField[Index]); // MB

      Reg.WriteBool('AutoBackup', AutoBackup);
      Reg.WriteBool('Numeration', Numeration);
      Reg.WriteBool('AddDate', AddDate);
      Reg.WriteBool('CustomLabel', CustomLabel);
      Reg.WriteString('LabelText', LabelText);

      Reg.WriteString('WFName', TreeView1.Font.Name);
      Reg.WriteInteger('WFSize', TreeView1.Font.Size);
      Reg.WriteInteger('WFColor', TreeView1.Font.Color);
      Reg.WriteInteger('WFCharSet', TreeView1.Font.CharSet);
			if fsBold in TreeView1.Font.Style then Reg.WriteBool('WFBold', true) else Reg.WriteBool('WFBold', false);
      if fsItalic in TreeView1.Font.Style then Reg.WriteBool('WFItalic', true) else Reg.WriteBool('WFItalic', false);
      if fsUnderline in TreeView1.Font.Style then Reg.WriteBool('WFUnderline', true) else Reg.WriteBool('WFUnderline', false);
      if fsStrikeOut in TreeView1.Font.Style then Reg.WriteBool('WFStrikeOut', true) else Reg.WriteBool('WFStrikeOut', false);

      Reg.WriteString('PlayListSaveDir', PlayListSaveDir);
      Reg.WriteString('LastAddDir', LastAddDir);
      Reg.WriteBool('AddSize', AddSize);
      Reg.WriteBool('ValidFiles', ValidFiles);
      Reg.WriteBool('CompareTag', CompareTag);

      for Index := 0 to ListView1.Columns.Count - 1 do
      begin
      	Value := InfoCol[ListView1.Columns[Index].Tag];
        Value := (Value div 1000) * 1000 + ListView1.Columns[Index].Width;
        InfoCol[ListView1.Columns[Index].Tag] := Value;
      end;
      for Index := 0 to InfoCol_nCols do Reg.WriteInteger('InfoCol' + IntToStr(Index), InfoCol[Index]); // MB

			Reg.WriteBool('FileExtensions', Fileextensions1.Checked);
      Reg.WriteBool('ItemNumeration', ItemNumeration);
      Reg.WriteBool('FullPath', Fullpath1.Checked);
      Reg.WriteBool('ReportSummary', ReportSummary);
      Reg.WriteInteger('AppState', AppState);
      Reg.WriteString('LastMacro', LastMacro);

      Reg.WriteBool('GuessedEncoder', GuessedEncoder);

      Reg.WriteBool('UseFoobar', UseFoobar);
      Reg.WriteString('FoobarPath', FoobarPath);

      Reg.WriteBool('AllFiles', AllFiles);
      Reg.WriteBool('AutoSort', AutoSort);//PP
      Reg.WriteBool('AutoSave', AutoSave);//PP
      Reg.WriteInteger('PreferTag', PreferTag);

      Reg.WriteString('LastEditDir', LastEditDir);
      Reg.WriteBool('ColumnAutoSize', ColumnAutoSize);

      Reg.WriteBool('EjectCD', EjectCD);
      Reg.WriteBool('CapitalizationBoxState', FormEditTag.cbCapitalization.Checked); //PinterPeti
      Reg.WriteInteger('CapitalizationBoxIndex',FormEditTag.cboxCapitalization.ItemIndex);//PinterPeti
      Reg.WriteString('WordDelimiters',FormEditTag.edDelimiters.Text);//PinterPeti
      Reg.WriteString('FileFormat',FormEditTag.edFileFormat.Text);//PinterPeti
      Reg.WriteBool('DeleteIfNotEmpty',FormEditTag.cbDeleteIfNotEmpty.Checked);//PP
    except
		end;

	Reg.CloseKey;
	Reg.Free;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ReadSettings;
var
	Reg: TRegIniFile;
	Index: longint;
  // Gambit - reads foobar path
  Reg2: TRegistry;
begin
	Reg := TRegIniFile.Create;

	Reg.RootKey := HKEY_CURRENT_USER;

	if Reg.OpenKey('\Software\' + AppTitle, false) then
		try
			LangName := Reg.ReadString('','LangName',LangName);
			CurrentCollection := Reg.ReadString('','CurrentCollection',CurrentCollection);
			FindArea := Reg.ReadInteger('','FindArea',FindArea);
      for Index := 1 to 6 do LastNameText[Index] := Reg.ReadString('','LastNameText' + IntToStr(Index),LastNameText[Index]);
			NameArea := Reg.ReadInteger('','NameArea',NameArea);
			NameCase := Reg.ReadBool('','NameCase',NameCase);
			for Index := 0 to 17 do Prop[(Index div 3) + 1, (Index mod 3) + 1] := Reg.ReadInteger('','Property' + IntToStr(Index),Prop[(Index div 3) + 1, (Index mod 3) + 1]);
			for Index := 1 to numTag do TagText[Index] := Reg.ReadString('','TagText' + IntToStr(Index),TagText[Index]); // MB
			AutoOpen := Reg.ReadBool('','AutoOpen',AutoOpen);
			UseWindowSettings := Reg.ReadBool('','UseWindowSettings',UseWindowSettings);
			for Index := 1 to 21 do RowCol[Index] := Reg.ReadBool('','ReportItems' + IntToStr(Index),RowCol[Index]);
      for Index := 1 to 17 do RowColIndex[Index] := Reg.ReadInteger('','ReportItemsIndex' + IntToStr(Index),RowColIndex[Index]);
			RFormat := Reg.ReadInteger('','ReportFormat',RFormat);
      RScanning := Reg.ReadInteger('','ReportScanning',RScanning);
			LastReportFile := Reg.ReadString('','LastReportFile',LastReportFile);
			LastOpenDir := Reg.ReadString('','LastOpenDir',LastOpenDir);
			LastSaveDir := Reg.ReadString('','LastSaveDir',LastSaveDir);
			CompareName := Reg.ReadBool('','CompareName',CompareName);
			CompareProperty := Reg.ReadBool('','CompareProperty',CompareProperty);
      for Index := 1 to 5 do LastCol[Index] := Reg.ReadString('','LastCol' + IntToStr(Index),LastCol[Index]);
      LastDrive := Reg.ReadString('','LastDrive',LastDrive);
      LastZoom := Reg.ReadInteger('','LastZoom',LastZoom);
      FontName := Reg.ReadString('','FontName',FontName);
      FontSize := Reg.ReadInteger('','FontSize',FontSize);
      FontColor := Reg.ReadInteger('','FontColor',FontColor);
      FontCharSet := Reg.ReadInteger('','FontCharSet',FontCharSet);
      for Index := 1 to 4 do FontStyle[Index] := Reg.ReadBool('','FontStyle' + IntToStr(Index),FontStyle[Index]);
      for Index := 1 to 2 do IStretch[Index] := Reg.ReadInteger('','Stretch' + IntToStr(Index),IStretch[Index]);

			Gridlines1.Checked := Reg.ReadBool('','GridLines',Gridlines1.Checked);
      ListView1.GridLines := Gridlines1.Checked;
      lvSearchResults.GridLines := Gridlines1.Checked;   //PinterPeti
      ListView1.RowSelect := ListView1.GridLines;
      lvSearchResults.RowSelect := ListView1.GridLines;  //PinterPeti
			Hottrack1.Checked := Reg.ReadBool('','HotTrack',Hottrack1.Checked);
			TreeView1.HotTrack := Hottrack1.Checked;
			ListView1.HotTrack := Hottrack1.Checked;
            lvSearchResults.HotTrack := Hottrack1.Checked;    //PinterPeti
			Toolbar1.Checked := Reg.ReadBool('','Toolbar',Toolbar1.Checked);
      Toolbar2.Visible := Toolbar1.Checked;
			Statusbar1.Checked := Reg.ReadBool('','Statusbar',Statusbar1.Checked);
      Statusbar2.Visible := Statusbar1.Checked;
			Panel1.Width := Reg.ReadInteger('','PanelWidth',Panel1.Width);

			if UseWindowSettings then
			begin
				Top := Abs(Reg.ReadInteger('','Top',Top));
				Left := Reg.ReadInteger('','Left',Left);
				Height := Reg.ReadInteger('','Height',Height);
				Width := Reg.ReadInteger('','Width',Width);
			end;

      RSorting := Reg.ReadBool('','ReportSorting',RSorting);
      DuplicateArea := Reg.ReadInteger('','DuplicateArea',DuplicateArea);
      ColumnToSorting := Reg.ReadInteger('','ColumnToSorting',ColumnToSorting);

      for Index := 1 to numTag do TagField[Index] := Reg.ReadBool('','TagField' + IntToStr(Index),TagField[Index]); // MB

      AutoBackup := Reg.ReadBool('','AutoBackup',AutoBackup);
      Numeration := Reg.ReadBool('','Numeration',Numeration);
      AddDate := Reg.ReadBool('','AddDate',AddDate);
      CustomLabel := Reg.ReadBool('','CustomLabel',CustomLabel);
      LabelText := Reg.ReadString('','LabelText',LabelText);

      TreeView1.Font.Name := Reg.ReadString('','WFName',TreeView1.Font.Name);
      TreeView1.Font.Size := Reg.ReadInteger('','WFSize',TreeView1.Font.Size);
      TreeView1.Font.Color := Reg.ReadInteger('','WFColor',TreeView1.Font.Color);
      TreeView1.Font.CharSet := Reg.ReadInteger('','WFCharSet',TreeView1.Font.CharSet);

      if Reg.ReadBool('','WFBold',False) then TreeView1.Font.Style := TreeView1.Font.Style + [fsBold];
      if Reg.ReadBool('','WFItalic',False) then TreeView1.Font.Style := TreeView1.Font.Style + [fsItalic];
      if Reg.ReadBool('','WFUnderline',False) then TreeView1.Font.Style := TreeView1.Font.Style + [fsUnderline];
      if Reg.ReadBool('','WFStrikeOut',False) then TreeView1.Font.Style := TreeView1.Font.Style + [fsStrikeOut];
			ListView1.Font.Assign(TreeView1.Font);

      lvSearchResults.Font.Assign(TreeView1.Font); //PinterPeti
      cbDuplicates.Font.Assign(TreeView1.Font); //PinterPeti
      PlayListSaveDir := Reg.ReadString('','PlayListSaveDir',PlayListSaveDir);
      LastAddDir := Reg.ReadString('','LastAddDir',LastAddDir);
      AddSize := Reg.ReadBool('','AddSize',AddSize);
      ValidFiles := Reg.ReadBool('','ValidFiles',ValidFiles);
      CompareTag := Reg.ReadBool('','CompareTag',CompareTag);
      for Index := 0 to InfoCol_nCols do InfoCol[Index] := Reg.ReadInteger('','InfoCol' + IntToStr(Index),InfoCol[Index]); // MB

      Fileextensions1.Checked := Reg.ReadBool('','FileExtensions',Fileextensions1.Checked);
      FileExtensions := Fileextensions1.Checked;
      ItemNumeration := Reg.ReadBool('','ItemNumeration',ItemNumeration);
      Fullpath1.Checked := Reg.ReadBool('','FullPath',Fullpath1.Checked);
      FullPath := Fullpath1.Checked;
      ReportSummary := Reg.ReadBool('','ReportSummary',ReportSummary);
			AppState := Reg.ReadInteger('','AppState',AppState);
      LastMacro := Reg.ReadString('','LastMacro',LastMacro);
      GuessedEncoder := Reg.ReadBool('','GuessedEncoder',GuessedEncoder);
      UseFoobar := Reg.ReadBool('','UseFoobar',UseFoobar);
      FoobarPath := Reg.ReadString('','FoobarPath',FoobarPath);
      AllFiles := Reg.ReadBool('','AllFiles',AllFiles);
      AutoSort := Reg.ReadBool('','AutoSort',AutoSort);//PP
      AutoSave := Reg.ReadBool('','AutoSave',AutoSave);//PP
      PreferTag := Reg.ReadInteger('','PreferTag',PreferTag);

      LastEditDir := Reg.ReadString('','LastEditDir',LastEditDir);
      ColumnAutoSize := Reg.ReadBool('','ColumnAutoSize',ColumnAutoSize);

      EjectCD := Reg.ReadBool('','EjectCD',EjectCD);

      SearchTop := Abs(Reg.ReadInteger('','SearchTop',SearchTop));
      SearchLeft := Reg.ReadInteger('','SearchLeft',SearchLeft);
      SearchHeight := Reg.ReadInteger('','SearchHeight',SearchHeight);
      SearchWidth := Reg.ReadInteger('','SearchWidth',SearchWidth);

      Panel3.Height := Reg.ReadInteger('','SearchPanelHeight',Panel3.Height); //PinterPeti

      CapitalizationBoxState := Reg.ReadBool('','CapitalizationBoxState',CapitalizationBoxState);
      CapitalizationBoxIndex := Reg.ReadInteger('','CapitalizationBoxIndex',CapitalizationBoxIndex);
      FileFormat := Reg.ReadString('','FileFormat',FileFormat);
      DeleteIfNotEmpty := Reg.ReadBool('','DeleteIfNotEmpty',DeleteIfNotEmpty);
      WordDelimiterChars := Reg.ReadString('','WordDelimiterChars',WordDelimiterChars);

      if WordDelimiterChars = '' then
        WordDelimiterChars := ' _!+-.,[(&@#=';

    except
		end;

	Reg.CloseKey;
	Reg.Free;

  if FoobarPath = '' then
  begin
  // Gambit - reads foobar path
  Reg2 := TRegistry.Create(KEY_READ);
  try
    Reg2.RootKey := HKEY_CURRENT_USER;
    // False because we do not want to create it if it doesn't exist
    Reg2.OpenKey('\Software\foobar2000', False);
    FoobarPath := Reg2.ReadString('InstallDir');
  finally
    Reg2.Free;
  end;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Toolbar1Click(Sender: TObject);
begin
	Toolbar1.Checked := not Toolbar1.Checked;
	Toolbar2.Visible := Toolbar1.Checked;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Statusbar1Click(Sender: TObject);
begin
	Statusbar1.Checked := not Statusbar1.Checked;
	Statusbar2.Visible := Statusbar1.Checked;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Gridlines1Click(Sender: TObject);
begin
	Gridlines1.Checked := not Gridlines1.Checked;
	ListView1.GridLines := Gridlines1.Checked;
  ListView1.RowSelect := ListView1.GridLines;
  lvSearchResults.GridLines := Gridlines1.Checked;     //PinterPeti
  lvSearchResults.RowSelect := ListView1.GridLines;    //PinterPeti
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Hottrack1Click(Sender: TObject);
begin
	Hottrack1.Checked := not Hottrack1.Checked;
	TreeView1.HotTrack := Hottrack1.Checked;
  ListView1.HotTrack := Hottrack1.Checked;       //PinterPeti
  lvSearchResults.HotTrack := Hottrack1.Checked;       //PinterPeti
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.SetCaptions;
begin
	Collection1.Caption := GetText(1);
	New1.Caption := GetText(2);
	ToolButton1.Hint := New1.Caption;
	Open1.Caption := GetText(3);
  Reopen1.Caption := GetText(213);
	ToolButton2.Hint := Open1.Caption;
	Save1.Caption := GetText(4);
	ToolButton3.Hint := Save1.Caption;
	Saveas1.Caption := GetText(5);
	Import1.Caption := GetText(6);
	Statistic1.Caption := GetText(7);
	ToolButton5.Hint := Statistic1.Caption;
	Report1.Caption := GetText(8);
	ToolButton6.Hint := Report1.Caption;
	Exit1.Caption := GetText(9);
	Edit1.Caption := GetText(10);
	Add1.Caption := GetText(11);
	ToolButton8.Hint := Add1.Caption;
	Delete1.Caption := GetText(106);
	ToolButton9.Hint := Delete1.Caption;
	Update2.Caption := GetText(12);
  Rename2.Caption := GetText(28);
	Sort1.Caption := GetText(14);
	ToolButton10.Hint := Sort1.Caption;
	Search1.Caption := GetText(15);
	ToolButton12.Hint := Search1.Caption;
	View1.Caption := GetText(21);
	Gridlines1.Caption := GetText(23);
	Hottrack1.Caption := GetText(24);
  Fileextensions1.Caption := GetText(214);
  Fullpath1.Caption := GetText(217);
	Toolbar1.Caption := GetText(25);
	Statusbar1.Caption := GetText(26);
  Font1.Caption := GetText(22);
  Columns1.Caption := GetText(210);
	Tools1.Caption := GetText(27);
	Tageditor1.Caption := GetText(29);
	ToolButton16.Hint := Tageditor1.Caption;
  FileRenamer1.Caption := GetText(220);
  ToolButton4.Hint := FileRenamer1.Caption;
	Cdcover1.Caption := GetText(30);
	ToolButton17.Hint := Cdcover1.Caption;
	Options1.Caption := GetText(31);
	Help1.Caption := GetText(32);
	Info1.Caption := GetText(33);
	History1.Caption := GetText(34);
	License1.Caption := GetText(35);
	Homepage1.Caption := GetText(36);
	Feedback1.Caption := GetText(37);
	About1.Caption := GetText(39);
	ToolButton20.Hint := About1.Caption;
	Play1.Caption := GetText(152);
	Enqueue1.Caption := GetText(153);
  OpenDir.Caption := GetText(242);
	Update1.Caption := Update2.Caption;
	Delete2.Caption := GetText(13);
  Rename1.Caption := Rename2.Caption;
	Playlist1.Caption := GetText(154);
  Select1.Caption := GetText(149);
  Information1.Caption := GetText(52);
  StatusBar2.Hint := GetText(52);

  MenuItem1.Caption := GetText(152);   //PinterPeti
  MenuItem2.Caption := GetText(153);   //PinterPeti
  MenuItem3.Caption := GetText(154);   //PinterPeti
  MenuItem4.Caption := GetText(242);   //PinterPeti
  MenuItem6.Caption := GetText(52);    //PinterPeti
  MenuItem7.Caption := GetText(91);    //PinterPeti
  EditID3.Caption   := GetText(309);   //PinterPeti
  Delete3.Caption   := GetText(231);   //PinterPeti
  Delete4.Caption   := GetText(319);   //PinterPeti
  TabSheet1.Caption := GetText(1);     //PinterPeti
  TabSheet2.Caption := GetText(43);    //PinterPeti
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.SetColumns(ListView:TListView);
//PinterPeti - added parameter to the procedure and changed ListView1 to ListView
// so I can use this to build the lvSearchResults' headers
var
	Index: integer;
  LColumn: TListColumn;
begin
	ListView.Items.Clear;
	while ListView.Columns.Count > 0 do ListView.Columns.Delete(0);

  for Index := 0 to InfoCol_nCols do // MB
	  if InfoCol[Index] > 0 then
	  begin
  	  LColumn := ListView.Columns.Add;

  		case InfoCol[Index] div 10000 mod 100 of
      	0: LColumn.Caption := GetText(41);
  			1: LColumn.Caption := GetText(171);
	  		2: LColumn.Caption := GetText(172);
  			3: LColumn.Caption := GetText(131);
  			4: LColumn.Caption := GetText(132);
  			5: LColumn.Caption := GetText(133);
	  		6: LColumn.Caption := GetText(211);
  			7: LColumn.Caption := GetText(42);
  			8: LColumn.Caption := GetText(43);
  			9: LColumn.Caption := GetText(44);
	  		10: LColumn.Caption := GetText(45);
  			11: LColumn.Caption := GetText(46);
  			12: LColumn.Caption := GetText(47); 
        13: LColumn.Caption := GetText(lngGenre); // MB
	    end;

      case InfoCol[Index] div 1000000 of
      	1: LColumn.Alignment := taLeftJustify;
        2: LColumn.Alignment := taCenter;
        3: LColumn.Alignment := taRightJustify;
      end;

      LColumn.Width := InfoCol[Index] mod 1000;
      LColumn.MinWidth := 10;
      LColumn.Tag := Index;

      if (InfoCol[Index] div 10000 mod 100 = 0) then LColumn.AutoSize := false
      else LColumn.AutoSize := ColumnAutoSize;
      Height := Height + 1;
      Height := Height - 1;
	  end;

  if ListView.Columns.Count < Abs(ColumnToSorting) then ColumnToSorting := 1;
  if ColumnToSorting > 0 then ListView.Columns[ColumnToSorting - 1].ImageIndex := 5
  else ListView.Columns[Abs(ColumnToSorting) - 1].ImageIndex := 6;

  if ListView = ListView1 then
	UpdateListView;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
    AVersion := Sto_GetFmtFileVersion(ParamStr(0));
	Application.Title := AppTitle;
	Caption := AppTitle;

	RootD := ExtractFilePath(ParamStr(0));

  FirstDrive := 0;
  if (DriveComboBox1.Items.Count > 0) and
  	(LowerCase(DriveComboBox1.Items.Strings[0][1]) = 'a') then Inc(FirstDrive);
  if (DriveComboBox1.Items.Count > 1) and
  	(LowerCase(DriveComboBox1.Items.Strings[1][1]) = 'b') then Inc(FirstDrive);
  if FirstDrive = 0 then Inc(FirstDrive);

	Tree := TreeView2;
	TempTree := TreeView3;
	TempList := ListBox3;
	STempList := ListBox5;         //PinterPeti - added new listbox
	TabSheet2.TabVisible := False; //PinterPeti
	DirList := DirectoryListBox1;
	FileList := FileListBox1;
	Lang := ListBox1;

	Panel1.Width := ClientWidth div 3;
	ReadSettings;

	SetLanguage(LangName);

	if LastOpenDir = '' then LastOpenDir := RootD;
	if LastSaveDir = '' then LastSaveDir := RootD;
	if PlayListSaveDir = '' then PlayListSaveDir := RootD;
  if LastAddDir = '' then LastAddDir := RootD;

	if (UseWindowSettings) and (AppState > 0) then
  begin
  	WindowState := wsMaximized;
    AppState := 0;
  end;
  Repaint;

	if (Trim(ParamStr(1)) <> '') and (OpenCollectionOK(Trim(ParamStr(1)))) then exit;
	if (AutoOpen) and (CurrentCollection <> '') and (OpenCollectionOK(CurrentCollection)) then exit;
	NewCollection;

  Application.HintHidePause := 10000;

end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ShowTextFile(FileName: string);
begin
	try
		if not FileExists(FileName) then raise EInOutError.Create('');
		ShellExecute(Handle, 'open', PChar(FileName), nil, nil, SW_SHOW);
	except
		Dialog(GetText(48) + ': ' + FileName, GetText(51), GetText(54), '', '', 1, 2);
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Info1Click(Sender: TObject);
begin
	ShowTextFile(RootD + MACHelpFile);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.History1Click(Sender: TObject);
begin
	ShowTextFile(RootD + HistoryFile);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.License1Click(Sender: TObject);
begin
	ShowTextFile(RootD + LicenseFile);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Homepage1Click(Sender: TObject);
begin
	ShellExecute(Handle, 'open', PChar(Homepage), nil, nil, SW_SHOW);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Feedback1Click(Sender: TObject);
var
	Command: string;
begin
	Command := 'mailto:' + EMail + '?subject=' + AppTitleShort + ' '
  	+ AVersion + ' (' + GetText(0) + ')';
	ShellExecute(Handle, 'open', PChar(Command), nil, nil, SW_SHOW);
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.QuestionForSaveCollection: byte;
begin
	Result := Dialog(GetText(49), GetText(50), GetText(55), GetText(56), GetText(57), 1, 1);

	if Result = 1 then OnSaveCollection(CurrentCollection, GetText(5));
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.UpdateListView;
var
	Index, BitRate: longint;
	Line, ItemText, ItemExtension : String;
	ListItem: TListItem;
	Child: TTreeNode;
	FileTag: TagArray;
  FileData: DataArray;
begin
	ListView1.Items.BeginUpdate;
	ListView1.Items.Clear;

	if TreeView1.Selected <> nil then
	begin
		Child := TreeView1.Selected.Data;
		if Child <> nil then Child := Child.GetFirstChild;

		while Child <> nil do
		begin
			ListItem := ListView1.Items.Add;
			ListItem.Data := Child;
      ListItem.OverlayIndex := Child.OverlayIndex;

			Line := Child.Text;

      ItemText := ExtractName(Line);
      if (not Fileextensions1.Checked) and (not Child.HasChildren) and (Pos('.', ItemText) > 0) then
      	ItemText := Copy(ItemText, 1, LastDelimiter('.', ItemText) - 1);
			ListItem.Caption := ItemText;
			FileTag := ExtractTag(Line);
      FileData := ExtractData(Line);

			if Child.HasChildren then
        ListItem.ImageIndex := 2
			else
      begin
        ItemExtension := '';
        ItemExtension := LowerCase(ExtractFileExt(ExtractName(Line)));

        // determines file type icons
        if Pos(ItemExtension, SupportedExtension) > 0 then
          ListItem.ImageIndex := 4
        else if ItemExtension = CueFile then
          ListItem.ImageIndex := 7
        else if Pos(ItemExtension, PlaylistMask) > 0 then
          ListItem.ImageIndex := 9
        else if Pos(ItemExtension, TextMask) > 0 then
          ListItem.ImageIndex := 10
        else if Pos(ItemExtension, ImageMask) > 0 then
          ListItem.ImageIndex := 11
        else if Pos(ItemExtension, ExeMask) > 0 then
          ListItem.ImageIndex := 12
        else if Pos(ItemExtension, ComprMask) > 0 then
          ListItem.ImageIndex := 13
        else if Pos(ItemExtension, DllMask) > 0 then
          ListItem.ImageIndex := 14
        else if Pos(ItemExtension, IniMask) > 0 then
          ListItem.ImageIndex := 15
        else if Pos(ItemExtension, BatMask) > 0 then
          ListItem.ImageIndex := 16
        else if Pos(ItemExtension, HtmlMask) > 0 then
          ListItem.ImageIndex := 23
        else if Pos(ItemExtension, VideoMask) > 0 then
          ListItem.ImageIndex := 24
        else
          ListItem.ImageIndex := 8;
      end;

      for Index := 1 to ListView1.Columns.Count - 1 do
      begin
      	ItemText := '';

	  		case InfoCol[ListView1.Columns[Index].Tag] div 10000 mod 100 of
  				1: ItemText := FloatToStrF(FileData[1] / 1024, ffFixed, 15, 2) + ' ' + GetText(62);
	  			2: 	if Child.HasChildren then ItemText := DurationToStr(Abs(FileData[2]))
          		else ItemText := DurationToShortStr(Abs(FileData[2]));
  				3:	begin
                if FileData[2] <> 0 then BitRate := Trunc(FileData[1] * 8 * 1.024 / Abs(FileData[2]))
								else BitRate := 0;

								if Child.HasChildren then
									ItemText := GetText(65) + ' ' + FormatFloat('0', BitRate) + ' ' + GetText(67)
								else
							 		if FileData[2] < 0 then ItemText := FormatFloat('0', BitRate) + ' ' + GetText(67) + ' ' + GetText(66)
									else
									begin
										BitRate := AlignedBitRate(BitRate, FileData[3], FileData[4], FileData[5], FileData[6]);
							      ItemText := FormatFloat('0', BitRate) + ' ' + GetText(67) + ' ' + GetText(148);
							 		end;
              end;
	  			4: if not Child.HasChildren then ItemText := IntToStr(FileData[3] * 10) + ' ' + GetText(70);
  				5: if not Child.HasChildren then ItemText := GetChannelMode(FileData[4]);
	  			6: if Child.HasChildren then ItemText := GetText(175)
		         else
             begin
             if FileData[5] = 0 then
             begin
              Delete(ItemExtension, 1, 1);
              ItemText := UpperCase(ItemExtension) + ' File';
             end
             else
              ItemText := GetMPEGType(FileData[5], FileData[6]);
             end;
  				7: ItemText := FileTag[1];
	  			8: ItemText := FileTag[2];
  				9: ItemText := FileTag[3];
	  			10: begin
          			ItemText := FileTag[4];
                if (Length(ItemText) = 1) and (ItemText[1] in ['1'..'9']) then
                	ItemText := '0' + ItemText;
          		end;
  				11: ItemText := FileTag[5];
  				12: ItemText := FileTag[6];
          13: ItemText := FileTag[7]; // MB
		    end;

				ListItem.SubItems.Add(ItemText);
      end;

			Child := Child.GetNextSibling;
		end;
	end;

	ListView1.Items.EndUpdate;
	if ListView1.Items.Count > 0 then ListView1.ItemFocused := ListView1.Items[0];
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.GetSelectedNode: TTreeNode;
var
	Index, Value: integer;
    TempListView:TListView;
begin
	Result := nil;
  ListBox4.Items.Clear;

	if (ActiveControl = ListView1) or (ActiveControl = lvSearchResults) then
	begin
		if ActiveControl = ListView1 then      //PinterPeti
			TempListView := ListView1;           //PinterPeti
		if ActiveControl = lvSearchResults then      //PinterPeti
			TempListView := lvSearchResults;           //PinterPeti

   	for Index := 0 to TempListView.Items.Count - 1 do
     	if TempListView.Items[Index].Selected then
      begin
				Result := TempListView.Items[Index].Data;
		    Value := ListBox4.Items.Add(Result.Text);
		    ListBox4.Items.Objects[Value] := Result;
     	end;

	end;

	if (ActiveControl = TreeView1) and (TreeView1.Selected <> nil) then
  begin
		Result := TreeView1.Selected.Data;
		Value := ListBox4.Items.Add(Result.Text);
		ListBox4.Items.Objects[Value] := Result;
  end;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.GetDate(Node: TTreeNode): string;
var
	ParentNode: TTreeNode;
  NodeData: DataArray;
begin
  ParentNode := Node;
	while ParentNode.Level > 1 do ParentNode := ParentNode.Parent;

  NodeData := ExtractData(ParentNode.Text);
  Result := FormatDateTime('dd/mm/yyyy', NodeData[5]);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.UpdateInformation;
var
	SelectedItem: TTreeNode;
	Index, BitRate: longint;
	Line: string;
	FileData: DataArray;
  SumSize, SumDur, SumFold, SumFiles: longint;
begin
	SelectedItem := GetSelectedNode;

	if SelectedItem = nil then
	begin
  	if (TreeView1.Selected = nil) and (ListView1.Selected = nil) then
			for Index := 0 to 5 do Statusbar2.Panels[Index].Text := '';
		exit;
	end;

  if ListBox4.Items.Count > 1 then
  begin
  	SumSize := 0;
    SumDur := 0;
    SumFold := 0;
    SumFiles := 0;

  	for Index := 0 to ListBox4.Items.Count - 1 do
	  begin
    	SelectedItem := TTreeNode(ListBox4.Items.Objects[Index]);
			Line := SelectedItem.Text;
			FileData := ExtractData(Line);

      if FileData[5] <> 0 then
      begin
			  Inc(SumSize, FileData[1]);
        Inc(SumDur, Abs(FileData[2]));
        if SelectedItem.HasChildren then
          Inc(SumFold, 1)
        else
          Inc(SumFiles, 1);
      end;
	  end;

    if SumSize < 1000000 then
	    Statusbar2.Panels[0].Text := FloatToStr(Round(SumSize / 1024 * 100) / 100) + ' ' + GetText(62)
    else
    	Statusbar2.Panels[0].Text := FloatToStr(Round(SumSize / 1048576 * 100) / 100) + ' ' + GetText(86);
    Statusbar2.Panels[1].Text := DurationToStr(SumDur) + ' ' + GetText(64);
    if SumDur > 0 then Statusbar2.Panels[2].Text := GetText(65) + ' ' + IntToStr(Trunc(SumSize * 8 * 1.024 / SumDur)) + ' ' + GetText(67)
    else Statusbar2.Panels[2].Text := '';
		Statusbar2.Panels[3].Text := IntToStr(SumFold) + ' ' + GetText(68);
		Statusbar2.Panels[4].Text := IntToStr(SumFiles) + ' ' + GetText(69);
    Statusbar2.Panels[5].Text := IntToStr(SumFold + SumFiles) + ' ' + GetText(218);
	  exit;
  end;

	Line := SelectedItem.Text;

	FileData := ExtractData(Line);

  if FileData[1] < 1000000 then
		Statusbar2.Panels[0].Text := FloatToStr(Round(FileData[1] / 1024 * 100) / 100) + ' ' + GetText(62)
  else
  	Statusbar2.Panels[0].Text := FloatToStr(Round(FileData[1] / 1048576 * 100) / 100) + ' ' + GetText(86);
	Statusbar2.Panels[1].Text := DurationToStr(Abs(FileData[2])) + ' ' + GetText(64);

	if FileData[2] <> 0 then BitRate := Trunc(FileData[1] * 8 * 1.024 / Abs(FileData[2]))
	else BitRate := 0;

	if SelectedItem.HasChildren then
	begin
    // shows the average bitrate for folders and volumes
		Statusbar2.Panels[2].Text := GetText(65) + ' ' + IntToStr(BitRate) + ' ' + GetText(67);
		Statusbar2.Panels[3].Text := IntToStr(FileData[3]) + ' ' + GetText(68);
		Statusbar2.Panels[4].Text := IntToStr(FileData[4]) + ' ' + GetText(69);
		Statusbar2.Panels[5].Text := GetDate(SelectedItem);
	end
	else
	begin
		if FileData[2] < 0 then Statusbar2.Panels[2].Text := GetText(66) + ' ' + IntToStr(BitRate) + ' ' + GetText(67)
		else
		begin
			BitRate := AlignedBitRate(BitRate, FileData[3], FileData[4], FileData[5], FileData[6]);
      Statusbar2.Panels[2].Text := GetText(148) + ' ' + IntToStr(BitRate) + ' ' + GetText(67);
		end;

		Statusbar2.Panels[3].Text := IntToStr(FileData[3] * 10) + ' ' + GetText(70);
		Statusbar2.Panels[4].Text := GetChannelMode(FileData[4]);
    Statusbar2.Panels[5].Text := GetMPEGType(FileData[5], FileData[6]);
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.UpdateControls;
begin
	if DataIsChanged then
	begin
		Save1.Enabled := true;
		ToolButton3.Visible := true;
	end
	else
	begin
		Save1.Enabled := false;
		ToolButton3.Visible := false;
	end;

	if TreeView1.Items.Count = 0 then
	begin
		Report1.Enabled := false;
		Delete1.Enabled := false;
		N5.Enabled := false;
		Sort1.Enabled := false;
		Search1.Enabled := false;

		ToolButton6.Visible := false;
		ToolButton9.Visible := false;
		ToolButton10.Visible := false;
		ToolButton12.Visible := false;
		ToolButton13.Visible := false; //PinterPeti
	end
	else
	begin
		Report1.Enabled := true;
		Delete1.Enabled := true;
		N5.Enabled := true;
		Sort1.Enabled := true;
		Search1.Enabled := true;

		ToolButton6.Visible := true;
		ToolButton9.Visible := true;
		ToolButton10.Visible := true;
		ToolButton12.Visible := true;
		ToolButton13.Visible := true; //PinterPeti
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.UpdateTreeView;
var
	Index, Index2, Level: longint;
	Line: string;
	Dir: array[0..100] of TTreeNode;
  DirectoryData: DataArray;
begin
	TreeView1.Items.BeginUpdate;

	TreeView1.Items.Clear;

  Index2 := 0;
	for Index := 1 to Tree.Items.Count - 1 do
	begin
		Tree.Items[Index].StateIndex := Index;
    if (Length(Tree.Items[Index].Text) > 0) and (Tree.Items[Index].Text[Length(Tree.Items[Index].Text)] = #30) then
	    Tree.Items[Index].OverlayIndex := 4
    else Tree.Items[Index].OverlayIndex := -1;

		if Tree.Items[Index].HasChildren then
		begin
			Level := Tree.Items[Index].Level - 1;
			Line := ExtractName(Tree.Items[Index].Text);
			if Level = 0 then
      begin
      	if (not Fullpath1.Checked) and (Pos('\', Line) > 0) then Line := Copy(Line, 1, Pos('\', Line) - 1);
      	Dir[0] := TreeView1.Items.Add(nil, Line);

        // volume type icon
        DirectoryData := ExtractData(Tree.Items[Index].Text);
        case DirectoryData[7] of
          VOLUME_TYPE_REMOVABLE : Dir[0].ImageIndex := 19;
          VOLUME_TYPE_FIXED : Dir[0].ImageIndex := 20;
          VOLUME_TYPE_REMOTE : Dir[0].ImageIndex := 21;
          VOLUME_TYPE_CDROM : Dir[0].ImageIndex := 18;
          VOLUME_TYPE_RAM : Dir[0].ImageIndex := 22;
          VOLUME_TYPE_AUDIO_CD : Dir[0].ImageIndex := 17;
        else
          Dir[0].ImageIndex := 1;
        end;

      end
			else
			begin
				Dir[Level] := TreeView1.Items.AddChild(Dir[Level - 1], Line);
				Dir[Level].ImageIndex := 2;
			end;
      Dir[Level].StateIndex := Index2;
			Dir[Level].Data := Tree.Items[Index];
      Dir[Level].OverlayIndex := Tree.Items[Index].OverlayIndex;
			Tree.Items[Index].Data := Dir[Level];
      Inc(Index2);
		end;
	end;

	TreeView1.Items.EndUpdate;
  if TreeView1.Items.Count > 0 then TreeView1.Selected := TreeView1.Items[0]
  else TreeView1.Selected := nil;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.OpenCollectionOK(FileName: string): boolean;
var
	CFile: TextFile;
	Line: string;
  Node, WNode: TTreeNode;
begin
	ActiveControl := nil;
	Result := false;
	Repaint;

	try
  	if ExtractFilePath(FileName) = '' then FileName := RootD + FileName;
		AssignFile(CFile, FileName);
		Reset(CFile);
		Readln(CFile, Line);
		CloseFile(CFile);

		if Line[1] <> #1 then raise EInOutError.Create('');
	except
		exit;
	end;

	ShowWaitWindow(GetText(58));
	SetWaitWindowText(GetText(59) + '...');

  TreeView1.Items.BeginUpdate;
  try
		Tree.LoadFromFile(FileName);
  except
  	CloseWaitWindow;
  	Dialog(GetText(94) + ': ' + FileName, GetText(51), GetText(54), '', '', 1, 2);
    ShowWaitWindow(GetText(58));
  end;

	SetWaitWindowText(GetText(60) + '...');

  Node := Tree.Items[0].GetNextSibling;
  while Node <> nil do
  begin
  	WNode := Node;
  	Node := Node.GetNextSibling;
    Tree.Items.Delete(WNode);
	end;

	UpdateTreeView;
  TreeView1.Items.EndUpdate;

	SetWaitWindowText(GetText(61) + '...');

	DataIsChanged := false;

	UpdateListView;
	UpdateControls;

	CloseWaitWindow;
  UpdateInformation;

	CurrentCollection := FileName;
  AddToPopup(FileName);
	Caption := AppTitle + ' - ' + CurrentCollection;

	Result := true;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.OpenFile(FileName: string);
begin
	LastOpenDir := ExtractFilePath(FileName);

	if (not DataIsChanged) or ((DataIsChanged) and (QuestionForSaveCollection in [1, 2])) then
		if not OpenCollectionOK(FileName) then
			Dialog(GetText(48) + ': ' + FileName, GetText(51), GetText(54), '', '', 1, 2)
    else
    	if TreeView1.CanFocus then TreeView1.SetFocus;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Open1Click(Sender: TObject);
begin
	Repaint;
	OpenDialog1.Title := GetText(3);
	OpenDialog1.DefaultExt := DefaultExt;
	OpenDialog1.Filter := GetText(161) + ' (*.' + DefaultExt + ')|*.' + DefaultExt;
	OpenDialog1.InitialDir := LastOpenDir;
	OpenDialog1.FileName := '';
	if OpenDialog1.Execute then begin
		lvSearchResults.Items.Clear;  //PinterPeti
		lvSearchResults.Items.Clear;  //PinterPeti
		ListBox5.Clear;         //PinterPeti
		STempList.Clear;        //PinterPeti
		STempList.Tag := 0;     //PinterPeti
		OpenFile(OpenDialog1.FileName);
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.TreeView1GetSelectedIndex(Sender: TObject;	Node: TTreeNode);
begin
	if Node.Level > 0 then
    Node.SelectedIndex := 3
  else
    Node.SelectedIndex := Node.ImageIndex;

	if Tag = 0 then UpdateInformation
	else
	begin
		UpdateListView;
		Tag := 0;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
	UpdateInformation;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.About1Click(Sender: TObject);
begin
	Repaint;
	ShowAbout;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.SaveCollectionOK(FileName: string): boolean;
var
	CFile: TextFile;
  CollectionInfo, VolumeInfo: DataArray;
  Index: integer;
  Node: TTreeNode;
  BackupFileName: string;
begin
	Result := true;
	Repaint;

  if (AutoBackup) and (FileExists(FileName)) then
  begin
  	BackupFileName := FileName + '~';
    DeleteFile(BackupFileName);
    if not RenameFile(FileName, BackupFileName) then
	    Dialog(GetText(77) + ': ' + BackupFileName, GetText(51), GetText(54), '', '', 1, 2);
  end;

	AssignFile(CFile, FileName);
	try
		Rewrite(CFile);
		CloseFile(CFile);
	except
	begin
		Result := false;
		exit;
	end;
	end;

	ShowWaitWindow(GetText(78));
	SetWaitWindowText(GetText(79) + '...');

  for Index := 1 to 6 do CollectionInfo[Index] := 0;

	Node := Tree.Items[0].GetFirstChild;
  while Node <> nil do
  begin
  	VolumeInfo := ExtractData(Node.Text);

   	Inc(CollectionInfo[1], VolumeInfo[1]);
		Inc(CollectionInfo[2], VolumeInfo[2]);
		Inc(CollectionInfo[3], 1);
		Inc(CollectionInfo[4], VolumeInfo[4]);

	  Node := Node.GetNextSibling;
  end;
  CollectionInfo[5] := Trunc(Date);

	Tree.Items[0].Text := #1;
	for Index := 1 to 5 do
			Tree.Items[0].Text := Tree.Items[0].Text + IntToStr(CollectionInfo[Index])+ Chr(Index + 1);

	Tree.SaveToFile(FileName);

	DataIsChanged := false;

	UpdateControls;

	CloseWaitWindow;

	CurrentCollection := FileName;
  AddToPopup(FileName);
	Caption := AppTitle + ' - ' + CurrentCollection;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.OnSaveCollection(FileName, WindowTitle: string);
var
	FName, SFileName, DirPath: string;
begin
	SaveDialog1.Title := WindowTitle;
	SaveDialog1.DefaultExt := DefaultExt;
	SaveDialog1.Filter := GetText(161) + ' (*.' + DefaultExt + ')|*.' + DefaultExt;
	if ShortFileNameOK(CurrentCollection, SFileName, DirPath) then
	begin
		if DirectoryExists(DirPath) then SaveDialog1.InitialDir := DirPath
		else SaveDialog1.InitialDir := LastSaveDir;
		SaveDialog1.FileName := SFileName;
	end
	else
	begin
		SaveDialog1.InitialDir := LastSaveDir;
		SaveDialog1.FileName := '';
	end;

	FName := FileName;

	if FName = '' then
		if SaveDialog1.Execute then
		begin
			LastSaveDir := ExtractFilePath(SaveDialog1.FileName);
			FName := SaveDialog1.FileName;
		end
		else exit;

	if not SaveCollectionOK(FName) then
		Dialog(GetText(77) + ': ' + FName, GetText(51), GetText(54), '', '', 1, 2);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Save1Click(Sender: TObject);
begin
	Repaint;
	OnSaveCollection(CurrentCollection, GetText(5));
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Saveas1Click(Sender: TObject);
begin
	OnSaveCollection('', GetText(5));
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.OpenListViewItem;
var
	Child: TTreeNode;
begin
	if ListView1.Selected <> nil then
	begin
		Child := ListView1.Selected.Data;

		if Child <> nil then
    	if Child.HasChildren then
			begin
				Child := TreeView1.Selected.GetFirstChild;

				while Child <> nil do
				begin
					if Child.Text = ListView1.Selected.Caption then
					begin
						TreeView1.Selected := Child;
						exit;
					end;
					Child := Child.GetNextSibling;
				end;
			end
      else Play1Click(Self);
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ListView1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
	SelectedNode: TTreeNode;
begin
	if (Key = VK_RETURN) and (ActiveControl = ListView1) then OpenListViewItem;

	if (Key = VK_BACK) and (ActiveControl = ListView1) then
  begin
		SelectedNode := TreeView1.Selected.Data;
    if (SelectedNode = nil) or (SelectedNode.Level < 2) then exit;
    SelectedNode := SelectedNode.Parent;
    if SelectedNode = nil then exit;
    ShowNode(SelectedNode);
    ActiveControl := ListView1;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ListView1DblClick(Sender: TObject);
begin
	OpenListViewItem;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.NewCollection;
begin
	Tree.Items.Clear;
	Tree.Items.Add(nil, #1#48#2#48#3#48#4#48#5 + IntToStr(Trunc(Date)) + #6);

	TreeView1.Selected := nil;
	ListView1.Selected := nil;

	TreeView1.Items.Clear;
	ListView1.Items.Clear;
	lvSearchResults.Items.Clear;

	DataIsChanged := false;

	Caption := AppTitle;
	CurrentCollection := '';

	UpdateInformation;
	UpdateControls;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Statistic1Click(Sender: TObject);
begin
	Repaint;
	ShowStatistic;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Tageditor1Click(Sender: TObject);
begin
	Repaint;
	ShowTagEditor;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.UpdateVolume(SourcePath: string; UpdatedNode: TTreeNode);
var
	ItemCount, Index: longint;
begin
	ItemCount := Tree.Items.Count;

	if ScanOK(SourcePath, UpdatedNode, true) then
	begin
		if Tree.Items.Count > ItemCount then
		begin
			ShowWaitWindow(GetText(163));

			Index := UpdatedNode.StateIndex;
			SetWaitWindowText(GetText(79) + '...');
			Tree.Items.Delete(UpdatedNode);

			SetWaitWindowText(GetText(60) + '...');

			UpdateTreeView;

			SetWaitWindowText(GetText(61) + '...');

			DataIsChanged := true;

			UpdateListView;
			UpdateControls;

			CloseWaitWindow;

			TreeView1.Selected := Tree.Items[Index].Data;
		end
		else Dialog(GetText(100), GetText(52), GetText(54), '', '', 1, 3);
	end
	else
		if Tree.Items.Count > ItemCount then Tree.Items.Delete(Tree.Items[UpdatedNode.StateIndex]);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Add1Click(Sender: TObject);
var
	SourcePath, SourceLabel: string;
	SourceSerial: longint;
  SourceType: Integer;
	Child: TTreeNode;
	VolumeData: DataArray;
	ItemCount: longint;
  Value: integer;
begin
	Repaint;
	if SourcePathOK(GetText(11), SourcePath, SourceLabel, SourceSerial, SourceType) then
	begin
		Child := Tree.Items[0].GetFirstChild;

		while Child <> nil do
		begin
			VolumeData := ExtractData(Child.Text);

      // volume already exists
			if (VolumeData[6] = SourceSerial) and
      	(CompareText(GetVolumePath(SourcePath), GetVolumePath(ExtractName(Child.Text))) = 0) then
			begin
				Value := Dialog(GetText(99), GetText(50), GetText(55), GetText(56), GetText(57), 1, 1);
				if Value = 1 then UpdateVolume(SourcePath, Child);
				if Value <> 2 then exit;
			end;

			Child := Child.GetNextSibling;
		end;

		ItemCount := Tree.Items.Count;

		if ScanOK(SourcePath, nil, true) then
		begin
			if Tree.Items.Count > ItemCount then
			begin
				ShowWaitWindow(GetText(101));

				ItemCount := TreeView1.Items.Count;

				SetWaitWindowText(GetText(60) + '...');

				UpdateTreeView;

				SetWaitWindowText(GetText(61) + '...');

				DataIsChanged := true;

				UpdateListView;
				UpdateControls;

				CloseWaitWindow;

				TreeView1.Selected := TreeView1.Items[ItemCount];
				if AutoSort = True then
					Sort1Click(Sender);
				if AutoSave = True then
					Save1Click(Sender);
			end
			else Dialog(GetText(100), GetText(52), GetText(54), '', '', 1, 3);
		end
		else
			if Tree.Items.Count > ItemCount then Tree.Items.Delete(Tree.Items[ItemCount]);
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.DeleteSelectedVolume;
var
	Child, SelectedItem: TTreeNode;
	VolData, ColData: DataArray;
	Index: longint;
begin
	Repaint;
	ShowWaitWindow(GetText(108));
	SetWaitWindowText(GetText(110) + '...');

	ColData := ExtractData(Tree.Items[0].Text);

	Child := Tree.Items[1];
	while Child <> nil do
	begin
		SelectedItem := Child;
		Child := Child.GetNextSibling;

		if SelectedItem.ImageIndex = 1 then
		begin
			VolData := ExtractData(SelectedItem.Text);

			Dec(ColData[1], VolData[1]);
			Dec(ColData[2], VolData[2]);
			Dec(ColData[3], 1);
			Dec(ColData[4], VolData[4]);

			Tree.Items.Delete(SelectedItem);
		end;
	end;

	Tree.Items[0].Text := #1;
	for Index := 1 to 4 do
	begin
		if ColData[Index] < 0 then ColData[Index] := 0;
		Tree.Items[0].Text := Tree.Items[0].Text + IntToStr(ColData[Index]) + Chr(Index + 1);
	end;
	Tree.Items[0].Text := Tree.Items[0].Text + IntToStr(Trunc(Date)) + #6;

	SetWaitWindowText(GetText(60) + '...');
	UpdateTreeView;

	SetWaitWindowText(GetText(61) + '...');

	DataIsChanged := true;

	UpdateListView;
	UpdateControls;
  UpdateInformation;

	CloseWaitWindow;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.MergeSelectedVolume;
var
	Child, SelectedItem, MergeNode, Child2, SelectedItem2: TTreeNode;
	VolData, MergeData, ColData: DataArray;
	Index, Count: longint;
  Marked: boolean;
begin
	Repaint;
	ShowWaitWindow(GetText(141));
	SetWaitWindowText(GetText(117) + '...');

	ColData := ExtractData(Tree.Items[0].Text);
  MergeNode := Tree.Items.AddChild(Tree.Items[0], '');
  for Index := 1 to 6 do MergeData[Index] := 0;
  Count := 0;
  Marked := false;

	Child := Tree.Items[1];
	while (Child <> MergeNode) and (Child <> nil) do
	begin
		SelectedItem := Child;
		Child := Child.GetNextSibling;

		if SelectedItem.ImageIndex = 1 then
		begin
			VolData := ExtractData(SelectedItem.Text);
      if SelectedItem.OverlayIndex > -1 then Marked := true;
			for Index := 1 to 4 do Inc(MergeData[Index], VolData[Index]);

			Child2 := SelectedItem.GetFirstChild;
			while (Child2 <> nil) do
			begin
				SelectedItem2 := Child2;
				Child2 := Child2.GetNextSibling;
   		  SelectedItem2.MoveTo(MergeNode, naAddChild);
			end;

      Tree.Items.Delete(SelectedItem);
      Inc(Count);
		end;
	end;

  Dec(ColData[3], Count - 1);
	Tree.Items[0].Text := #1;
  MergeNode.Text := GetText(103) + #1;
	for Index := 1 to 4 do
	begin
		if ColData[Index] < 0 then ColData[Index] := 0;
		Tree.Items[0].Text := Tree.Items[0].Text + IntToStr(ColData[Index]) + Chr(Index + 1);
    MergeNode.Text := MergeNode.Text + IntToStr(MergeData[Index]) + Chr(Index + 1);
	end;
	Tree.Items[0].Text := Tree.Items[0].Text + IntToStr(Trunc(Date)) + #6;
  MergeNode.Text := MergeNode.Text + IntToStr(Trunc(Date)) + #6 + '0' + #7;
  if Marked then MergeNode.Text := MergeNode.Text + #30;

	SetWaitWindowText(GetText(60) + '...');
	UpdateTreeView;

	SetWaitWindowText(GetText(61) + '...');

	DataIsChanged := true;

	UpdateListView;
	UpdateControls;
  UpdateInformation;

	CloseWaitWindow;

  ShowNode(MergeNode);
  Rename1Click(Self);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Delete1Click(Sender: TObject);
var
	Index: integer;
begin
	Repaint;

  Index := SelectVolumeAction(GridLines1.Checked, HotTrack1.Checked);
	case Index of
  	1: DeleteSelectedVolume;
    2: MergeSelectedVolume;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Sort1Click(Sender: TObject);
var
	SortOK: boolean;
begin
	Repaint;
	if Dialog(GetText(113), GetText(50), GetText(55), GetText(56), '', 2, 1) <> 1 then exit;

	ShowWaitWindow(GetText(111));
	SetWaitWindowText(GetText(112) + '...');

	SortOK := Tree.CustomSort(@TreeSorting, 0);
	if SortOK then
	begin
		SetWaitWindowText(GetText(60) + '...');
		UpdateTreeView;

		SetWaitWindowText(GetText(61) + '...');

		DataIsChanged := true;

		UpdateListView;
		UpdateControls;
	end;

	CloseWaitWindow;

	if SortOK then Dialog(GetText(114), GetText(52), GetText(54), '', '', 1, 3);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	if (DataIsChanged) and (QuestionForSaveCollection in [0, 3]) then CanClose := false
	else
	begin
    if WindowState = wsMaximized then AppState := 1
    else AppState := 0;
    WindowState := wsNormal;

		CanClose := true;
		WriteSettings;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.New1Click(Sender: TObject);
begin
	Repaint;
	if (not DataIsChanged) or ((DataIsChanged) and (QuestionForSaveCollection in [1, 2])) then
		NewCollection;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.ConvertOK(FileName: string): boolean;
var
	Level: longint;
	Index: longint;
	CFile: TextFile;
	Line: string;
	Dir: array[0..99] of TTreeNode;
	Threshold: boolean;
	IData: DataArray;
begin
	Result := false;
	Repaint;

	TempTree.Items.Clear;
	TempList.Clear;
	TempList.Sorted := false;

	AssignFile(CFile, FileName);

	try Reset(CFile);
	except exit;
	end;

	Dir[0] := TempTree.Items.Add(nil, '');

	while not Eof(CFile) do
	begin
		Readln(CFile, Line);
		if Pos(';', Line) > 0 then
		begin
			Threshold := true;

			for Index := 1 to Length(Line) do
				if not (Line[Index] in [#48..#57, ';']) then Threshold := false;

			if Threshold then break;
		end;

		Level := LastDelimiter(#9, Line) + 1;
		Dir[Level] := TempTree.Items.AddChild(Dir[Level - 1], Trim(Copy(Line, Level, Length(Line) - Level + 1)));
	end;

	SetWaitWindowText(GetText(151) + '...');

	TempList.Items.Add(Line);
	while not Eof(CFile) do
	begin
		Readln(CFile, Line);

		TempList.Items.Add(Line);
	end;
	TempList.Items.Delete(TempList.Items.Count - 1);

	CloseFile(CFile);

	if TempTree.Items.Count = TempList.Items.Count then
	begin
		IData := ExtractOldData(TempList.Items.Strings[0]);
		TempTree.Items[0].Text := #1 + IntToStr(IData[1]) + #2 + IntToStr(IData[2]) + #3
			+ IntToStr(IData[4]) + #4 + IntToStr(IData[5]) + #5 + IntToStr(IData[6]) + #6;

		for Index := 1 to TempTree.Items.Count - 1 do
		begin
			IData := ExtractOldData(TempList.Items.Strings[Index]);

			if TempTree.Items[Index].HasChildren then
			begin
				TempTree.Items[Index].Text := TempTree.Items[Index].Text + #1
					+ IntToStr(IData[1]) + #2 + IntToStr(IData[2]) + #3
					+ IntToStr(IData[4]) + #4 + IntToStr(IData[5]) + #5;
				if TempTree.Items[Index].Level = 1 then
					TempTree.Items[Index].Text := TempTree.Items[Index].Text
						+ IntToStr(IData[6]) + #6 + '0' + #7;
			end
			else
			begin
				if IData[3] < 0 then IData[2] := -IData[2];
				TempTree.Items[Index].Text := TempTree.Items[Index].Text + #1
					+ IntToStr(IData[1]) + #2 + IntToStr(IData[2]) + #3
					+ IntToStr(IData[4] * 10) + #4 + IntToStr(IData[5] + 1) + #5
					+ IntToStr(IData[6] div 10) + #6 + IntToStr(IData[6] mod 10) + #7#21#22#23#24#25#26#27;
			end;
		end;

		Result := true;
	end;

	TempList.Clear;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.ImportDataOK(FileName: string): boolean;
var
	CFile: TextFile;
	Line: string;
	Index, Level: longint;
	Dir: array[0..99] of TTreeNode;
	ColData, ImpData: DataArray;
	OldFormat: boolean;
begin
	Result := false;
	Repaint;

	if Copy(FileName, LastDelimiter('.', FileName) + 1, 3) = OldExt then OldFormat := true
	else OldFormat := false;

	if not OldFormat then
	begin
		AssignFile(CFile, FileName);
		try
			Reset(CFile);
			Readln(CFile, Line);
			CloseFile(CFile);
			if Line[1] <> #1 then exit;
		except
			exit;
		end;
	end;

	ShowWaitWindow(GetText(115));

	SetWaitWindowText(GetText(116) + '...');
	if not OldFormat then TempTree.LoadFromFile(FileName)
	else
		if not ConvertOK(FileName) then
		begin
			CloseWaitWindow;
			exit;
		end;

	SetWaitWindowText(GetText(117) + '...');
	Dir[0] := Tree.Items[0];
	for Index := 1 to TempTree.Items.Count - 1 do
	begin
		Level := TempTree.Items[Index].Level;
		Dir[Level] := Tree.Items.AddChild(Dir[Level - 1], TempTree.Items[Index].Text);
	end;

	ColData := ExtractData(Tree.Items[0].Text);
	ImpData := ExtractData(TempTree.Items[0].Text);

	Inc(ColData[1], ImpData[1]);
	Inc(ColData[2], ImpData[2]);
	Inc(ColData[3], ImpData[3]);
	Inc(ColData[4], ImpData[4]);

	Tree.Items[0].Text := #1;
	for Index := 1 to 4 do
		Tree.Items[0].Text := Tree.Items[0].Text + IntToStr(ColData[Index]) + Chr(Index + 1);
	Tree.Items[0].Text := Tree.Items[0].Text + IntToStr(Trunc(Date)) + #6;

	SetWaitWindowText(GetText(118) + '...');
	TempTree.Items.Clear;

	SetWaitWindowText(GetText(60) + '...');
	UpdateTreeView;

	SetWaitWindowText(GetText(61) + '...');

	DataIsChanged := true;

	UpdateListView;
	UpdateControls;

	CloseWaitWindow;

	Result := true;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Import1Click(Sender: TObject);
begin
	Repaint;
	OpenDialog1.Title := GetText(6);
	OpenDialog1.DefaultExt := DefaultExt;
	OpenDialog1.Filter := GetText(161) + ' (*.' + DefaultExt + ', *.' + OldExt + ')|*.' + DefaultExt + ';*.' + OldExt;
	OpenDialog1.InitialDir := LastOpenDir;
	OpenDialog1.FileName := '';

  Repaint;
	if OpenDialog1.Execute then
	begin
  	LastOpenDir := ExtractFilePath(OpenDialog1.FileName);

		if not ImportDataOK(OpenDialog1.FileName) then
			Dialog(GetText(150) + ': ' + OpenDialog1.FileName, GetText(51), GetText(54), '', '', 1, 2)
		else
			Dialog(GetText(119), GetText(52), GetText(54), '', '', 1, 3);
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ShowNode(Node: TTreeNode);
var
	Index: longint;
	ParentNode: TTreeNode;
begin
	if Node.HasChildren then
	begin
		Node := Node.Data;
		Node.Selected := true;
		TreeView1.SetFocus;
	end
	else
	begin
		ParentNode := Node.Parent.Data;
		ParentNode.Selected := true;

    for Index := 0 to ListView1.Items.Count - 1 do
    	if ListView1.Items[Index].Data = Node then
      begin
				ListView1.Items[Index].Selected := true;
				ListView1.Items[Index].Focused := true;
				ListView1.SetFocus;
				ListView1.Items[Index].MakeVisible(false);
      end;
	end;

	UpdateInformation;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.SetLanguage(var FileName: string);
var
	ULanguage: PChar;
	BufferSize, Index, Value: longint;
	SFName, LName, LangPath: string;
begin
	if DirectoryExists(RootD + LanguageDir) then LangPath := RootD + LanguageDir + '\'
  else LangPath := RootD;

	if FileName = '' then
	begin
		BufferSize := 255;

		GetMem(ULanguage, BufferSize);
		try
		begin
			GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SENGLANGUAGE, ULanguage, BufferSize);
			ULanguage := AnsiStrLower(ULanguage);

      DirList.Directory := LangPath;
			FileList.Mask := '*.' + LanguageExt;
			DirList.Update;
			FileList.Update;

			for Index := 1 to FileList.Items.Count do
				try
					SFName := FileList.Items.Strings[Index - 1];
					TempList.Items.LoadFromFile(LangPath + SFName);
					LName := TempList.Items.Strings[0];
					Delete(LName, 1, 3);
					LName := AnsiLowerCase(LName);
					if AnsiPos(LName, ULanguage) = 1 then FileName := SFName;
				finally
				end;

			TempList.Clear;
		end;
		finally
			FreeMem(ULanguage, BufferSize);
		end;
	end;

	if FileName = '' then Lang := ListBox1
	else
		try
		begin
			ListBox2.Items.LoadFromFile(LangPath + FileName);
			Lang := ListBox2;
		end;
		except
			Lang := ListBox1;
			Dialog(GetText(48) + ': ' + LangPath + FileName + '. ' + GetText(147), GetText(51), GetText(54), '', '', 1, 2);
			FileName := '';
		end;

	for Index := 0 to ListView1.Columns.Count - 1 do
  begin
  	Value := InfoCol[ListView1.Columns[Index].Tag];
    Value := (Value div 1000) * 1000 + ListView1.Columns[Index].Width;
    InfoCol[ListView1.Columns[Index].Tag] := Value;
  end;

	SetCaptions;
	SetColumns(ListView1);
	SetColumns(lvSearchResults); //PinterPeti
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Options1Click(Sender: TObject);
var
	FileName: string;
begin
	FileName := LangName;
	if (OptionsOK) and (LangName <> FileName) then begin
		SetLanguage(LangName);
		FormEditTag.SetCaptions;                   //PinterPeti
		FormEditOggTag.SetCaptions;                //PinterPeti
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
var
	Index: longint;
	SelNode: TTreeNode;
begin
	for Index := 0 to PopupMenu1.Items.Count-1 do PopupMenu1.Items[Index].Visible := false;

	SelNode := GetSelectedNode;

	if SelNode <> nil then
	begin
		Play1.Visible := true;
		Enqueue1.Visible := true;
		if (PopUpMenu1.PopupComponent <> TreeView1) then begin  //PinterPeti
			Delete3.Visible := True;                            //PinterPeti
  			Delete4.Visible := True;                                //PinterPeti
		end;
    if ListBox4.Items.Count = 1 then OpenDir.Visible := True;
		N3.Visible := true;
    Select1.Visible := true;
    if ListBox4.Items.Count = 1 then Information1.Visible := true;
	if (ListBox4.Items.Count = 1) and (PopUpMenu1.PopupComponent <> TreeView1) then EditID3.Visible := true;                                  //PinterPeti
    if ActiveControl = ListView1 then Select1.Checked := ListView1.ItemFocused.OverlayIndex >= 0
    else Select1.Checked := SelNode.OverlayIndex >= 0;
    if (SelNode.HasChildren) or (ListBox4.Items.Count > 1) then Playlist1.Visible := true;
		if SelNode.Level = 1 then
		begin
			Update1.Visible := true;
			Delete2.Visible := true;
      Rename1.Visible := true;
      N4.Visible := true;
		end;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Delete2Click(Sender: TObject);
var
	SelectedNode: TTreeNode;
begin
	SelectedNode := GetSelectedNode;

	if (SelectedNode <> nil) and (SelectedNode.Level = 1) then
    if Dialog(GetText(164), GetText(50), GetText(55), GetText(56), '', 2, 1) = 1 then
		begin
			SelectedNode.ImageIndex := 1;
			DeleteSelectedVolume;
		end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
	Tag := 1;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.CreatePlayList(SNode: TTreeNode; PlayList: TListBox): string;
	procedure ScanTreeNode(Node: TTreeNode; FPath: string);
	var
		Child: TTreeNode;
	begin
  	if Length(FPath) = 3 then FPath := FPath[1] + FPath[2];
		Child := Node.GetFirstChild;
		while Child <> nil do
		begin
			if not Child.HasChildren then
      begin
      // scans added directories
        if Pos(LowerCase(ExtractFileExt(ExtractName(Child.Text))), SupportedExtension) > 0 then
        begin
          PlayList.Items.Add(FPath + '\' + ExtractName(Child.Text));
          PlayList.Items.Objects[PlayList.Items.Count - 1] := Child;
        end;
      end
			else ScanTreeNode(Child, FPath + '\' + ExtractName(Child.Text));
			Child := Child.GetNextSibling;
		end;
	end;
var
	Path, DriveLabel, SLabel: string;
	Index, SSerial, ItemIndex: longint;
  SType: Integer;
	DriveExists: boolean;
	VData: DataArray;
	Node: TTreeNode;
begin
	Result := '';
	DriveExists := false;
  PlayList.Clear;

  if ListBox4.Items.Count = 0 then
  begin
  	ListBox4.Items.Add(SNode.Text);
		ListBox4.Items.Objects[0] := SNode;
  end;

  for ItemIndex := 0 to ListBox4.Items.Count - 1 do
  begin
  	SNode := TTreeNode(ListBox4.Items.Objects[ItemIndex]);

		Node := SNode;
  	Path := ExtractName(Node.Text);
	  while Node.Level > 1 do
  	begin
			Node := Node.Parent;
	    Path := ExtractName(Node.Text) + '\' + Path;
  	end;

	  DriveLabel := '';
		if Pos('\', Path) > 0 then DriveLabel := Copy(Path, 1, Pos('\', Path) - 1)
	  else Drivelabel := Path;
  	Path := GetVolumePath(Path);

		VData := ExtractData(Node.Text);

		for Index := FirstDrive to DriveComboBox1.Items.Count - 1 do
			if (VolumeDataOK(DriveComboBox1.Items.Strings[Index][1], SLabel, SSerial, SType)) and
	  	  ((VData[6] = SSerial) or ((VData[6] = 0) and (CompareText(DriveLabel, SLabel) = 0))) then
			begin
				DriveExists := true;
				Path := DriveComboBox1.Items.Strings[Index][1] + ':\' + Path;

				if SNode.HasChildren then
    	  begin
	    	  if not DirectoryExists(Path) then
  	    	begin
        		Result := GetText(158) + ': ' + Path;
						exit;
		      end;
    	    ScanTreeNode(SNode, Path);
      	end
	      else
  	    begin
	  	    if not FileExists(Path) then
  	  	  begin
        		Result := GetText(158) + ': ' + Path;
						exit;
		      end;
          // scans added files
          if Pos(LowerCase(ExtractFileExt(Path)), SupportedExtension) > 0 then
          begin
            PlayList.Items.Add(Path);
  	        PlayList.Items.Objects[PlayList.Items.Count - 1] := SNode;
          end;
    	  end;

	      break;
			end;
  end;

	if not DriveExists then
	begin
		DriveLabel := GetText(159) + ': "' + Drivelabel + '"';
		if VData[6] <> 0 then Drivelabel := DriveLabel + #13#10 + GetText(160) + ': ' + IntToHex(VData[6], 1);
    Result := GetText(158) + #13#10 + DriveLabel;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Play1Click(Sender: TObject);
var
	SelectedNode: TTreeNode;
  ErrorMsg: string;
begin
	SelectedNode := GetSelectedNode;
	if SelectedNode <> nil then
  begin
  	ShowWaitWindow(GetText(155));
    SetWaitWindowText(GetText(156) + '...');
    TempList.Sorted := false;
  	ErrorMsg := CreatePlayList(SelectedNode, TempList);
    CloseWaitWindow;

    if ErrorMsg = '' then
     	try
       	TempList.Items.SaveToFile(RootD + PlaylistFile);

        if (Pos(LowerCase(ExtractFileExt(ExtractName(SelectedNode.Text))), SupportedExtension) > 0) or (SelectedNode.HasChildren) then
        begin
          if (UseFoobar) and (FileExists(FoobarPath + '\foobar2000.exe')) then
            ShellExecute(Handle, nil, PChar('"' + FoobarPath + '\foobar2000.exe"'), PChar('"' + RootD + PlaylistFile + '"'), nil, SW_SHOW)
          else
            ShellExecute(Handle, 'open', PChar(RootD + PlaylistFile), nil, nil, SW_SHOW);
        end
        else
          ShellExecute(Handle, 'open', PChar(GetSelectedPath(SelectedNode)), nil, nil, SW_SHOW);

      except
       	Dialog(GetText(157) + ': ' + RootD + PlaylistFile, GetText(51), GetText(54), '', '', 1, 2);
      end
    else Dialog(ErrorMsg, GetText(51), GetText(54), '', '', 1, 2);
		TempList.Clear;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Enqueue1Click(Sender: TObject);
var
	SelectedNode: TTreeNode;
  ErrorMsg: string;
begin
	SelectedNode := GetSelectedNode;
	if SelectedNode <> nil then
  begin
  	ShowWaitWindow(GetText(155));
    SetWaitWindowText(GetText(156) + '...');
    TempList.Sorted := false;
  	ErrorMsg := CreatePlayList(SelectedNode, TempList);
    CloseWaitWindow;

    if ErrorMsg = '' then
     	try
       	TempList.Items.SaveToFile(RootD + PlaylistFile);
        if (UseFoobar) and (FileExists(FoobarPath + '\foobar2000.exe')) then
          ShellExecute(Handle, nil, PChar('"' + FoobarPath + '\foobar2000.exe"'), PChar('/add "' + RootD + PlaylistFile + '"'), nil, SW_SHOW)
        else
          ShellExecute(Handle, 'enqueue', PChar(RootD + PlaylistFile), nil, nil, SW_SHOW);
      except
       	Dialog(GetText(157) + ': ' + RootD + PlaylistFile, GetText(51), GetText(54), '', '', 1, 2);
      end
    else Dialog(ErrorMsg, GetText(51), GetText(54), '', '', 1, 2);
		TempList.Clear;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Playlist1Click(Sender: TObject);
var
	SelectedNode: TTreeNode;
	FileName, ErrorMsg: string;
  Index: integer;
begin
	SelectedNode := GetSelectedNode;

	if SelectedNode <> nil then
	begin
		FileName := ExtractName(SelectedNode.Text);
		Delete(FileName, 1, LastDelimiter('\', FileName));

		SaveDialog1.Title := GetText(154);
		SaveDialog1.DefaultExt := PlaylistExt1;
		SaveDialog1.Filter := GetText(162) + ' (*.' + PlaylistExt1 + ', *.' + PlaylistExt2 + ')|*.' + PlaylistExt1 + ';*.' + PlaylistExt2;

		SaveDialog1.InitialDir := PlayListSaveDir;
    if ListBox4.Items.Count > 1 then FileName := '';
		SaveDialog1.FileName := FileName;
		if SaveDialog1.Execute then
		begin
			PlayListSaveDir := ExtractFilePath(SaveDialog1.FileName);

      Repaint;
	  	ShowWaitWindow(GetText(155));
  	  SetWaitWindowText(GetText(156) + '...');
    	TempList.Sorted := false;
	  	ErrorMsg := CreatePlayList(SelectedNode, TempList);

	    if ErrorMsg = '' then
      	try
          for Index := 0 to TempList.Items.Count - 1 do
	          if Pos(LowerCase(PlayListSaveDir), LowerCase(TempList.Items.Strings[Index])) = 1 then
  	        begin
    	      	FileName := TempList.Items.Strings[Index];
              Delete(FileName, 1, Length(PlayListSaveDir));
              TempList.Items.Strings[Index] := FileName;
      	    end;

        	TempList.Items.SaveToFile(SaveDialog1.FileName);
          CloseWaitWindow;
        except
        	CloseWaitWindow;
        	Dialog(GetText(157) + ': ' + SaveDialog1.FileName, GetText(51), GetText(54), '', '', 1, 2);
        end
  	  else
      begin
      	CloseWaitWindow;
      	Dialog(ErrorMsg, GetText(51), GetText(54), '', '', 1, 2);
      end;
			TempList.Clear;
		end;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.OpenDirClick(Sender: TObject);
var
	SelectedNode: TTreeNode;
  SelectedItemPath: String;
begin
  SelectedNode := GetSelectedNode;

  if SelectedNode <> nil then
  begin
    if SelectedNode.HasChildren then
      SelectedItemPath := GetSelectedPath(SelectedNode)
    else
      SelectedItemPath := ExtractFilePath(GetSelectedPath(SelectedNode));

    if DirectoryExists(SelectedItemPath) then
      ShellExecute(Handle, 'open', PChar(SelectedItemPath), nil, nil, SW_SHOW)
    else
      Dialog(GetText(158) + ': ' + #13 + #10 + SelectedItemPath, GetText(51), GetText(54), '', '', 1, 2);
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Update1Click(Sender: TObject);
var
	SelectedNode: TTreeNode;
	Path, SLabel: string;
	Index, SSerial: longint;
  SType: Integer;
	VData: DataArray;
begin
	SelectedNode := GetSelectedNode;

	if (SelectedNode <> nil) and (SelectedNode.Level = 1) then
	begin
		VData := ExtractData(SelectedNode.Text);
    Path := GetVolumePath(ExtractName(SelectedNode.Text));

		for Index := FirstDrive to DriveComboBox1.Items.Count - 1 do
			if (VolumeDataOK(DriveComboBox1.Items.Strings[Index][1], SLabel, SSerial, SType)) and
	      (VData[6] = SSerial) then
			begin
				Path := DriveComboBox1.Items.Strings[Index][1] + ':\' + Path;
         if DirectoryExists(Path) then
         begin
          if Dialog(GetText(165), GetText(50), GetText(55), GetText(56), '', 2, 1) = 1 then
          	UpdateVolume(Path, SelectedNode);
         end
         else Dialog(GetText(158) + ': ' + Path, GetText(51), GetText(54), '', '', 1, 2);
				exit;
			end;

    if SourcePathOK(GetText(12), Path, SLabel, SSerial, SType) then UpdateVolume(Path, SelectedNode);
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Report1Click(Sender: TObject);
var
	DirPath, SFileName: string;
	RFile: TextFile;
begin
	Repaint;
	if ReportDialogOK then
	begin
  	Repaint;
		SaveDialog1.Title := GetText(178);
		case RFormat of
			2:
			begin
				SaveDialog1.DefaultExt := DIFExt;
				SaveDialog1.Filter := GetText(170) + ' (*.' + DIFExt + ')|*.' + DIFExt;
			end;
			3:
			begin
				SaveDialog1.DefaultExt := HTMLExt;
				SaveDialog1.Filter := GetText(195) + ' (*.' + HTMLExt + ', *.' + HTMExt + ')|*.' + HTMLExt + ';*.' + HTMExt;
			end
			else
			begin
				SaveDialog1.DefaultExt := TextExt;
				SaveDialog1.Filter := GetText(169) + ' (*.' + TextExt + ')|*.' + TextExt;
			end;
		end;
		if ShortFileNameOK(LastReportFile, SFileName, DirPath) then
		begin
			if DirectoryExists(DirPath) then SaveDialog1.InitialDir := DirPath
			else SaveDialog1.InitialDir := LastSaveDir;
			SaveDialog1.FileName := SFileName;
		end
		else
		begin
			SaveDialog1.InitialDir := LastSaveDir;
			SaveDialog1.FileName := '';
		end;

    Repaint;
		if SaveDialog1.Execute then
		begin
			LastSaveDir := ExtractFilePath(SaveDialog1.FileName);

			LastReportFile := SaveDialog1.FileName;

			AssignFile(RFile, LastReportFile);

			try
			begin
				Rewrite(RFile);
				CloseFile(RFile);
				DeleteFile(LastReportFile);

				if ReportProcessOK then
					Dialog(GetText(181) + ': ' + LastReportFile, GetText(52), GetText(54), '', '', 1, 3);
				end;
			except
				Dialog(GetText(77) + ': ' + LastReportFile, GetText(51), GetText(54), '', '', 1, 2);
			end;
		end;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.FormResize(Sender: TObject);
var
	Index, Count, PWidth: longint;
begin
	Count := Statusbar2.Panels.Count;
	PWidth := Statusbar2.Width div Count;
	for Index := 0 to Count - 1 do Statusbar2.Panels[Index].Width := PWidth;
	cbDuplicates.Width := Panel5.Width - 2;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.FindDuplicatesOK(FItem: longint): boolean;
// PinterPeti - TempList changed to STempList because it was used to create a playlist file when Enqueueing or playing with WinAmp
// And after these the list forgot the contents or positions or something like that I don't remember, sorry
var
	Index: longint;
	Item, Line, Duplicate: string;
	ItemData: DataArray;
  ItemTag: TagArray;
begin
	Result := false;
  if FItem < 0 then FItem := 1;

	ShowWaitWindow(GetText(128));
	SetWaitWindowText(GetText(182) + '...');

	for Index := FItem to Tree.Items.Count - 1 do
		if ((Tree.Items[Index].HasChildren) and (DuplicateArea in [1, 2])) or
			((not Tree.Items[Index].HasChildren) and (DuplicateArea in [1, 3])) then
		begin
			Item := Tree.Items[Index].Text;

			if CompareName then Line := ExtractName(Item) + #1
			else Line := '';

			if CompareTag then
			begin
				ItemTag := ExtractTag(Item);
        if (ItemTag[1] <> '') and (ItemTag[2] <> '') then
					Line := Line + ItemTag[2] + #1 + ItemTag[1] + #1
        else continue;
			end;

			if CompareProperty then
			begin
				ItemData := ExtractData(Item);
				Line := Line + IntToStr(ItemData[1]) + #1 + IntToStr(ItemData[2]) + #1;
			end;

			STempList.Items.Objects[STempList.Items.Add(Line)] := Tree.Items[Index];
		end;

	SetWaitWindowText(GetText(111) + '...');

	STempList.Sorted := true;

	Index := 0;
	while Index < STempList.Items.Count - 1 do
	begin
		if CompareText(STempList.Items.Strings[Index], STempList.Items.Strings[Index + 1]) <> 0 then
			STempList.Items.Delete(Index)
		else
		begin
			Duplicate := STempList.Items.Strings[Index];
			Inc(Index);

			while Index < STempList.Items.Count - 1 do
			begin
				Inc(Index);
				if CompareText(Duplicate, STempList.Items.Strings[Index]) <> 0 then break;
			end;
		end;
	end;
	if CompareText(Duplicate, STempList.Items.Strings[Index]) <> 0 then STempList.Items.Delete(Index);

	CloseWaitWindow;

	if STempList.Items.Count > 1 then Result := true;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.FindDuplicates(FirstItem: longint; SPath: string): TTreeNode;
//PinterPeti see comment at FindDuplicatesOK
begin
  Result := nil;
	if FindDuplicatesOK(FirstItem) then
  	Result := ShowSearchResults(SPath, GridLines1.Checked, HotTrack1.Checked, 3) {3 = we want to show duplicate results}
	else
  	if Dialog(GetText(139), GetText(52), GetText(54), GetText(15), '', 1, 3) = 2 then
    	STempList.Tag := 1;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.FindNameOK(FItem: longint): boolean;
//PinterPeti see comment at FindDuplicatesOK
var
	Index, Index2: longint;
	Line: string;
  Words: array[1..99] of string;
  Count, Hit: integer;
begin
	Result := false;
  if FItem < 0 then FItem := 1;

	ShowWaitWindow(GetText(128));
	SetWaitWindowText(GetText(79) + '...');

  Count := 0;
  Line := LastNameText[1];
  repeat
		Index := Pos(#32, Line);
   	if Count < 99 then Inc(Count);
    if Index > 0 then
    begin
	    Words[Count] := Copy(Line, 1, Index - 1);
  	  Delete(Line, 1, Index);
    	Line := Trim(Line);
    end
    else
    	Words[Count] := Line;
  until Index <= 0;

	for Index := FItem to Tree.Items.Count - 1 do
	begin
		Line := ExtractName(Tree.Items[Index].Text);

		if ((Tree.Items[Index].HasChildren) and (NameArea in [1, 2])) or
			((not Tree.Items[Index].HasChildren) and (NameArea in [1, 3])) then
      begin
      	Hit := 0;

	      for Index2 := 1 to Count do
					if ((NameCase and (Pos(Words[Index2], Line) > 0)) or
						(not NameCase) and (Pos(AnsiLowerCase(Words[Index2]), AnsiLowerCase(Line)) > 0)) then
            	Inc(Hit);

      	if (Hit > 0) and (Hit = Count) then
        begin
					Index2 := STempList.Items.Add(IntToStr(Index));
          STempList.Items.Objects[Index2] := Tree.Items[Index];
        end;
      end;
	end;

	CloseWaitWindow;

	if STempList.Items.Count > 0 then Result := true;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.FindName(FirstItem: longint; SPath: string): TTreeNode;
//PinterPeti see comment at FindDuplicatesOK
begin
  Result := nil;
	if FindNameOK(FirstItem) then
  	Result := ShowSearchResults(SPath, GridLines1.Checked, HotTrack1.Checked, 0) {0 = we want to show name results}
	else
  	if Dialog(GetText(139), GetText(52), GetText(54), GetText(15), '', 1, 3) = 2 then
    	STempList.Tag := 1;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.FindTagOK(FItem: longint): boolean;
//PinterPeti see comment at FindDuplicatesOK
var
	Index, Index2: longint;
  TagInfo: TagArray;
begin

	Result := false;
  if FItem < 0 then FItem := 1;

	ShowWaitWindow(GetText(128));
	SetWaitWindowText(GetText(79) + '...');

	for Index := FItem to Tree.Items.Count - 1 do
		if not Tree.Items[Index].HasChildren then
		begin
      TagInfo := ExtractTag(Tree.Items[Index].Text);

			if ((Trim(TagText[1]) = '') or (Pos(AnsiLowerCase(TagText[1]), AnsiLowerCase(TagInfo[1])) > 0)) and
				((Trim(TagText[2]) = '') or (Pos(AnsiLowerCase(TagText[2]), AnsiLowerCase(TagInfo[2])) > 0)) and
				((Trim(TagText[3]) = '') or (Pos(AnsiLowerCase(TagText[3]), AnsiLowerCase(TagInfo[3])) > 0)) and
        ((Trim(TagText[4]) = '') or (Pos(AnsiLowerCase(TagText[4]), AnsiLowerCase(TagInfo[4])) > 0)) and
        ((Trim(TagText[5]) = '') or (Pos(AnsiLowerCase(TagText[5]), AnsiLowerCase(TagInfo[5])) > 0)) and
				((Trim(TagText[6]) = '') or (Pos(AnsiLowerCase(TagText[6]), AnsiLowerCase(TagInfo[6])) > 0)) and
        ((Trim(TagText[7]) = '') or (Pos(AnsiLowerCase(TagText[7]), AnsiLowerCase(TagInfo[7])) > 0)) then // MB add condition for new tag
      begin
				Index2 := TempList.Items.Add(IntToStr(Index));
        TempList.Items.Objects[Index2] := Tree.Items[Index];
      end;
		end;

	CloseWaitWindow;

	if STempList.Items.Count > 0 then Result := true;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.FindTag(FirstItem: longint; SPath: string): TTreeNode;
//PinterPeti see comment at FindDuplicatesOK
begin
  Result := nil;
	if FindTagOK(FirstItem) then
  	Result := ShowSearchResults(SPath, GridLines1.Checked, HotTrack1.Checked, 2) {2 = we want to show tag results}
	else
  	if Dialog(GetText(139), GetText(52), GetText(54), GetText(15), '', 1, 3) = 2 then
    	STempList.Tag := 1;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.FindPropertyOK(FItem: longint): boolean;
//PinterPeti see comment at FindDuplicatesOK
var
	Index, Index2: longint;
  MProp: MatchArray;
begin
	Result := false;
  if FItem < 0 then FItem := 1;

	ShowWaitWindow(GetText(128));
	SetWaitWindowText(GetText(79) + '...');

	for Index := FItem to Tree.Items.Count - 1 do
		if not Tree.Items[Index].HasChildren then
			if PropertyOK(Tree.Items[Index], Prop, MProp) then
      begin
				Index2 := STempList.Items.Add(IntToStr(Index));
        STempList.Items.Objects[Index2] := Tree.Items[Index];
			end;
      
	CloseWaitWindow;

	if STempList.Items.Count > 0 then Result := true;
end;

{ --------------------------------------------------------------------------- }

function TfrmMain.FindProperty(FirstItem: longint; SPath: string): TTreeNode;
//PinterPeti see comment at FindDuplicatesOK
begin
  Result := nil;
	if FindPropertyOK(FirstItem) then
  	Result := ShowSearchResults(SPath, GridLines1.Checked, HotTrack1.Checked, 1) {1 = we want to show property results}
	else
  	if Dialog(GetText(139), GetText(52), GetText(54), GetText(15), '', 1, 3) = 2 then
    	STempList.Tag := 1;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.CDcover1Click(Sender: TObject);
begin
	Repaint;
	ShowPrintCover;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.OnPopupClick(Sender: TObject);
begin
	if Sender is TMenuItem then begin
		OpenFile(LastCol[(Sender as TMenuItem).Tag]);
		lvSearchResults.Items.Clear; //PinterPeti
		cbDuplicates.Items.Clear; //PinterPeti
	end;
end;
{ --------------------------------------------------------------------------- }

procedure TfrmMain.OnClearPopup(Sender: TObject);
var
	Index: integer;
begin
	if Sender is TMenuItem then for Index := 1 to 5 do LastCol[Index] := '';
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
var
	Index, Count: integer;
  NewItem: TMenuItem;
begin
	while PopupMenu2.Items.Count > 0 do PopupMenu2.Items.Delete(0);

	Count := 0;
	for Index := 1 to 5 do
  	if LastCol[Index] <> '' then
    begin
    	Inc(Count);

			NewItem := TMenuItem.Create(Self);
			NewItem.Caption := IntToStr(Count) + #32 + LastCol[Index];
      NewItem.Tag := Index;
      NewItem.OnClick := OnPopupClick;

      PopupMenu2.Items.Add(NewItem);
    end;

  if Count > 0 then
  begin
		NewItem := TMenuItem.Create(Self);
		NewItem.Caption := '-';
    PopupMenu2.Items.Add(NewItem);

		NewItem := TMenuItem.Create(Self);
		NewItem.Caption := GetText(212);
    NewItem.OnClick := OnClearPopup;
    PopupMenu2.Items.Add(NewItem);
  end;

  PopupMenu2.Items.RethinkHotkeys;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.AddToPopup(FileName: string);
var
	Index, Count: integer;
  LastColTemp: array [1..6] of string;
begin
	LastColTemp[1] := FileName;
	for Index := 2 to 6 do LastColTemp[Index] := '';

  Count := 1;
  for Index := 1 to 5 do
  	if CompareText(FileName, LastCol[Index]) <> 0 then
    begin
    	Inc(Count);
    	LastColTemp[Count] := LastCol[Index];
    end;

  for Index := 1 to 5 do LastCol[Index] := LastColTemp[Index];
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.MarkUp(Node: TTreeNode; Marked: boolean);
var
	PNode, CNode: TTreeNode;
  Deselected: boolean;
begin
	PNode := Node.Parent;

	while PNode.Level > 0 do
  begin
		if Marked then
    begin
    	PNode.OverlayIndex := 4;
			if PNode.Text[Length(PNode.Text)] <> #30 then PNode.Text := PNode.Text + #30;
			CNode := PNode.Data;
    	CNode.OverlayIndex := PNode.OverlayIndex;
    end
    else
    begin
    	Deselected := true;
    	CNode := PNode.GetFirstChild;

      while CNode <> nil do
      begin
      	if CNode.OverlayIndex = 4 then
        begin
        	Deselected := false;
        	break;
        end;
				CNode := CNode.GetNextSibling;
      end;

      if Deselected then
	    begin
    		PNode.OverlayIndex := -1;
  	    if PNode.Text[Length(PNode.Text)] = #30 then PNode.Text := Copy(PNode.Text, 1, Length(PNode.Text) - 1);
				CNode := PNode.Data;
  	  	CNode.OverlayIndex := PNode.OverlayIndex;
	    end;
    end;

    PNode := PNode.Parent;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.MarkDown(Node: TTreeNode; Marked: boolean);
var
	Index: longint;
  NItem: TTreeNode;
begin
	for Index := Node.StateIndex to Tree.Items.Count - 1 do
	begin
  	NItem := Tree.Items[Index];
  	if (Index > Node.StateIndex) and (NItem.Level <= Node.Level) then exit;

		if Marked then
    begin
    	NItem.OverlayIndex := 4;
			if NItem.Text[Length(NItem.Text)] <> #30 then NItem.Text := NItem.Text + #30;
    end
    else
    begin
    	NItem.OverlayIndex := -1;
      if NItem.Text[Length(NItem.Text)] = #30 then NItem.Text := Copy(NItem.Text, 1, Length(NItem.Text) - 1);
    end;

    if NItem.HasChildren then
    begin
	    NItem := NItem.Data;
    	NItem.OverlayIndex := Node.OverlayIndex;
    end;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Select1Click(Sender: TObject);
var
	SelectedNode, Node: TTreeNode;
  Index, ItemIndex: longint;
  NodeMarked: boolean;
begin
	SelectedNode := GetSelectedNode;

	if SelectedNode <> nil then
  begin
  	NodeMarked := SelectedNode.OverlayIndex < 0;

  	for ItemIndex := 0 to ListBox4.Items.Count - 1 do
	  begin
    	SelectedNode := TTreeNode(ListBox4.Items.Objects[ItemIndex]);

      MarkDown(SelectedNode, NodeMarked);
			MarkUp(SelectedNode, NodeMarked);

      for Index := 0 to ListView1.Items.Count - 1 do
      begin
      	Node := ListView1.Items[Index].Data;
        ListView1.Items[Index].OverlayIndex := Node.OverlayIndex;
      end;
	  end;

	  DataIsChanged := true;
  	UpdateControls;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.TreeView1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	if Button = mbRight then
		if TreeView1.GetNodeAt(X, Y) <> nil then            //PinterPeti
			TreeView1.Selected := TreeView1.GetNodeAt(X, Y)
		else                                                //PinterPeti
			TreeView1.Selected := TreeView1.TopItem;        //PinterPeti
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.OnSearch;
//PinterPeti see comment at FindDuplicatesOK
var
	Path: string;
  ItemCount: longint;
  ClickedItem: TTreeNode;
begin
	if FindOK(Path) then
  begin
  	Repaint;
		STempList.Clear;
		STempList.Sorted := false;
		if Path = '' then
    begin
    	ClickedItem := nil;
    	case FindArea of
      	0: ClickedItem := FindName(-1, '');
        1: ClickedItem := FindProperty(-1, '');
        2: ClickedItem := FindTag(-1, '');
        3: ClickedItem := FindDuplicates(-1, '');
      end;
      if ClickedItem <> nil  then ShowNode(ClickedItem);
    end
    else
		begin
			ItemCount := Tree.Items.Count;

			if ScanOK(Path, nil, false) then
      begin
	 			if Tree.Items.Count > ItemCount then
				begin
		    	case FindArea of
    		  	0: FindName(ItemCount, Path);
        		1: FindProperty(ItemCount, Path);
		        2: FindTag(ItemCount, Path);
    		    3: FindDuplicates(ItemCount, Path);
		      end;

          Tree.Items.Delete(Tree.Items[ItemCount]);
        end
        else
        	if Dialog(GetText(100), GetText(52), GetText(54), GetText(15), '', 1, 3) = 2 then
	          STempList.Tag := 1;
      end
   		else
				if Tree.Items.Count > ItemCount then Tree.Items.Delete(Tree.Items[ItemCount]);
		end;

	if FindArea <> 3 then begin
		STempList.Clear;
		STempList.Sorted := false;
	end;
  end;

end;
{ --------------------------------------------------------------------------- }

procedure TfrmMain.Search1Click(Sender: TObject);
//PinterPeti see comment at FindDuplicatesOK
begin
  repeat
  	STempList.Tag := 0;
   	Repaint;
  	OnSearch;
  until STempList.Tag = 0;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Rename1Click(Sender: TObject);
var
	SelectedNode, SNode: TTreeNode;
  VLabel, VText, VInput, VPath: string;
begin
	Repaint;
	SelectedNode := GetSelectedNode;

	if (SelectedNode <> nil) and (SelectedNode.Level = 1) then
	begin
  	VText := ExtractName(SelectedNode.Text);
    VLabel := '';
    if Pos('\', VText) > 0 then VLabel := Copy(VText, 1, Pos('\', VText) - 1)
    else VLabel := VText;
		VInput := RenameVolumeLabel(VText, VLabel);

    VInput := Trim(StringReplace(VInput, '\', ' ', [rfReplaceAll]));

    if VInput <> VLabel then
    begin
    	VPath := GetVolumePath(VText);
      if VPath <> '' then VPath := VInput + '\' + VPath
      else VPath := VInput;

      VText := SelectedNode.Text;
      Delete(VText, 1, Pos(#1, VText));
      VText := VPath + #1 + VText;

      SelectedNode.Text := VText;
      SNode := SelectedNode.Data;
      if Fullpath1.Checked then SNode.Text := VPath
      else SNode.Text := VInput;

			DataIsChanged := true;
			UpdateControls;
    end;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ListView1ColumnClick(Sender: TObject; Column: TListColumn);
var
	Value: integer;
begin
	Value := Abs(ColumnToSorting) - 1;
  ColumnToSorting := Column.Index + 1;
  if ListView1.Columns[Column.Index].ImageIndex = 5 then ColumnToSorting := -(Column.Index + 1)
  else ColumnToSorting := Column.Index + 1;

  ListView1.Columns[Value].ImageIndex := -1;
  ListView1.AlphaSort;

  if ColumnToSorting < 0 then ListView1.Columns[Column.Index].ImageIndex := 6
  else ListView1.Columns[Column.Index].ImageIndex := 5;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ListView1Compare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
var
  Index, TInd, AInd: integer; //ArtistIndex,TitleIndex /PP
  Node1, Node2: TTreeNode;
begin
	Node1 := Item1.Data;
  Node2 := Item2.Data;

  for Index := 0 to (Sender as TListView).Columns.Count-1 do begin
    if (Sender as TListView).Column[Index].Caption = GetText(43) then
      AInd := Index-1;
    if (Sender as TListView).Column[Index].Caption = GetText(42) then
      TInd := Index-1;
  end;

	if Node1.HasChildren = Node2.HasChildren then
		if Abs(ColumnToSorting) = 1 then
 			Compare := AnsiCompareText(Item1.Caption, Item2.Caption)
		else
		begin
			Index := Abs(ColumnToSorting) - 2;

		if Index+2 = AInd then
			Compare := AnsiCompareText(Item1.SubItems[Index]+Item1.SubItems[AInd], Item2.SubItems[Index]+Item2.SubItems[AInd])
		else if Index+2 = TInd then
			Compare := AnsiCompareText(Item1.SubItems[Index]+Item1.SubItems[TInd], Item2.SubItems[Index]+Item2.SubItems[TInd])
		else
			Compare := AnsiCompareText(Item1.SubItems[Index], Item2.SubItems[Index]);

      if (InfoCol[(Sender as TListView).Columns[Index + 1].Tag] div 10000 mod 100) in [1, 3] then
      begin
      	if Length(Item1.SubItems[Index]) < Length(Item2.SubItems[Index]) then Compare := -1;
        if Length(Item1.SubItems[Index]) > Length(Item2.SubItems[Index]) then Compare := 1;
      end;
		end
  else
		if Node1.HasChildren then Compare := -1
		else Compare := 1;

  if ColumnToSorting < 0 then Compare := -Compare;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Font1Click(Sender: TObject);
var
	Index: integer;
begin
	FontDialog1.Font.Assign(TreeView1.Font);
  if FontDialog1.Execute then
  begin
  	TreeView1.Font.Assign(FontDialog1.Font);
    ListView1.Font.Assign(FontDialog1.Font);
    lvSearchResults.Font.Assign(FontDialog1.Font); //PinterPeti
    cbDuplicates.Font.Assign(TreeView1.Font); //PinterPeti

    Index := ListView1.Columns[Abs(ColumnToSorting) - 1].ImageIndex;
    ListView1.Columns[Abs(ColumnToSorting) - 1].ImageIndex := -1;
    ListView1.Columns[Abs(ColumnToSorting) - 1].ImageIndex := Index;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Edit1Click(Sender: TObject);
var
	SelectedNode: TTreeNode;
begin
	SelectedNode := GetSelectedNode;

  Update2.Enabled := (SelectedNode <> nil) and (SelectedNode.Level = 1);
  Rename2.Enabled := (SelectedNode <> nil) and (SelectedNode.Level = 1);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Columns1Click(Sender: TObject);
var
	Index, Value: longint;
begin
	for Index := 0 to ListView1.Columns.Count - 1 do
  begin
  	Value := InfoCol[ListView1.Columns[Index].Tag];
    Value := (Value div 1000) * 1000 + ListView1.Columns[Index].Width;
    InfoCol[ListView1.Columns[Index].Tag] := Value;
  end;

  if ColumnsDialogOK then begin
    SetColumns(ListView1);
    SetColumns(lvSearchResults); //PinterPeti
  end;

end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Collection1Click(Sender: TObject);
var
	Index, Count: integer;
  NewItem: TMenuItem;
begin
	Reopen1.Clear;

	Count := 0;
	for Index := 1 to 5 do
  	if LastCol[Index] <> '' then
    begin
    	Inc(Count);

			NewItem := TMenuItem.Create(Self);
			NewItem.Caption := IntToStr(Count) + #32 + LastCol[Index];
      NewItem.Tag := Index;
      NewItem.OnClick := OnPopupClick;

      Reopen1.Add(NewItem);
    end;

  if Count > 0 then
  begin
		NewItem := TMenuItem.Create(Self);
		NewItem.Caption := '-';
		Reopen1.Add(NewItem);

		NewItem := TMenuItem.Create(Self);
		NewItem.Caption := GetText(212);
    NewItem.OnClick := OnClearPopup;
    Reopen1.Add(NewItem);

    Reopen1.Enabled := true;
  end
  else Reopen1.Enabled := false;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Information1Click(Sender: TObject);
var
	SelectedNode: TTreeNode;
begin
	SelectedNode := GetSelectedNode;
	if SelectedNode <> nil then
  	if ListBox4.Items.Count = 1 then
    	if SelectedNode.HasChildren then ShowFolderInfo(SelectedNode)
      else ShowFileInfo(SelectedNode);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Fileextensions1Click(Sender: TObject);
begin
	Fileextensions1.Checked := not Fileextensions1.Checked;
	FileExtensions := Fileextensions1.Checked;
  UpdateListView;
  UpdateInformation;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Cheat1Click(Sender: TObject);
begin
	CheatMode := true;
  Dialog(CheatModeWarning, GetText(53), GetText(54), '', '', 1, 4);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ListView1Editing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
	AllowEdit := CheatMode;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ListView1Edited(Sender: TObject; Item: TListItem;
  var S: String);
var
	Temp, Extension: string;
  Node: TTreeNode;
begin
	if Trim(S) = '' then S := Item.Caption
  else
  begin
  	Node := Item.Data;
    Temp := Node.Text;
    Extension := ExtractName(Node.Text);
    Delete(Temp, 1, Pos(#1, Temp));

    if (not Node.HasChildren) and (not Fileextensions1.Checked) then
    begin
    	if Pos('.', Extension) > 0 then Delete(Extension, 1, Pos('.', Extension) - 1)
      else Extension := '';
      Node.Text := S + Extension + #1 + Temp;
    end
    else Node.Text := S + #1 + Temp;

  	DataIsChanged := true;
		UpdateControls;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Fullpath1Click(Sender: TObject);
var
	Node, Origin: TTreeNode;
  Line: string;
begin
	Fullpath1.Checked := not Fullpath1.Checked;
	FullPath := Fullpath1.Checked;

  if TreeView1.Items.Count > 0 then Node := TreeView1.Items[0]
  else Node := nil;

  while Node <> nil do
  begin
  	Origin := Node.Data;
    Line := ExtractName(Origin.Text);
    if (not Fullpath1.Checked) and (Pos('\', Line) > 0) then Line := Copy(Line, 1, Pos('\', Line) - 1);
    Node.Text := Line;
  	Node := Node.GetNextSibling;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Selection1Click(Sender: TObject);
var
	Index: integer;
begin
	if ActiveControl = ListView1 then
  	for Index := 0 to ListView1.Items.Count - 1 do
    	ListView1.Items[Index].Selected := true;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Filerenamer1Click(Sender: TObject);
begin
	Repaint;
	FileRenamerDialog;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Copy1Click(Sender: TObject);
var
	PString: array [0..255] of char;
  CString: string;
begin
	CString := '';

	if (ActiveControl = ListView1) and (ListView1.ItemFocused <> nil) then
		CString := ListView1.ItemFocused.Caption;
	if (ActiveControl = TreeView1) and (TreeView1.Selected <> nil) then
		CString := TreeView1.Selected.Text;

	if CString <> '' then
  begin
	  StrPCopy(PString, CString);
  	Clipboard.SetTextBuf(PString);
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.FormPaint(Sender: TObject);
var
	Bm1, Bm2: TBitmap;
begin
	Bm1 := Image1.Picture.Bitmap;
  Bm2 := TBitmap.Create;

  Bm2.Width := Bm1.Width;
  Bm2.Height := Bm1.Height;

  Bm2.Canvas.Brush.Color := CoolBar1.Color;
  Bm2.Canvas.BrushCopy(Rect(0, 0, Bm2.Width, Bm2.Height), Bm1,
  	Rect(0, 0, Bm1.width, Bm1.Height), clWhite);

  CoolBar1.Bitmap.Assign(Bm2);
  Bm2.Free;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ToolButton13Click(Sender: TObject);
begin
  try
    if GetSelectedNode.HasChildren = False then begin
       if UpperCase(ExtractFileExt(GetFilePath(frmMain.GetSelectedNode))) = '.MP3' then
         with TFormEditTag.Create(Application) do
           try ShowModal;
             finally Release;
           end;
       if UpperCase(ExtractFileExt(GetFilePath(frmMain.GetSelectedNode))) = '.OGG' then
         with TFormEditOggTag.Create(Application) do
           try ShowModal;
             finally Release;
           end;
       end else
      MessageBox(Handle, PChar(GetText(308)), PChar('Error'), $00000010);
  except on EAccessViolation do
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.EditID3Click(Sender: TObject);  //PinterPeti
begin
  ToolButton13Click(Sender);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  EditID3.ShortCut := ShortCut(Word('3'), [ssAlt]);  //PinterPeti
  Delete4.ShortCut := ShortCut(VK_Delete,[ssCtrl,ssShift]);  //PinterPeti
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.lvSearchResultsDblClick(Sender: TObject);  //PinterPeti
begin
  if lvSearchResults.Selected <> nil then begin
    FindItem := lvSearchResults.Selected.Data;
    ListView1.Selected := nil;
    ShowNode(FindItem);
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.lvSearchResultsColumnClick(Sender: TObject;Column: TListColumn); //PinterPeti
var Value: integer;
begin
  Value := Abs(ColumnToSorting) - 1;
  ColumnToSorting := Column.Index + 1;
  if lvSearchResults.Columns[Column.Index].ImageIndex = 2 then
    ColumnToSorting := -(Column.Index + 1)
  else
    ColumnToSorting := Column.Index + 1;
  lvSearchResults.Columns[Value].ImageIndex := -1;
  lvSearchResults.AlphaSort;
  if ColumnToSorting < 0 then
    lvSearchResults.Columns[Column.Index].ImageIndex := 3
  else
    lvSearchResults.Columns[Column.Index].ImageIndex := 2;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmMain.lvSearchResultsCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer); //PinterPeti

var VData1, VData2: DataArray;
begin
  VData1 := ExtractData(TTreeNode(Item1.Data).Text);
  VData2 := ExtractData(TTreeNode(Item2.Data).Text);
  Compare := 0;
  case Abs(Tag) of
    1: Compare := AnsiCompareText(Item1.Caption,Item2.Caption);
    2: Compare := AnsiCompareText(Item1.SubItems.Strings[0],Item2.SubItems.Strings[0]);
    3: if VData1[1] <> VData2[1] then
         if VData1[1] > VData2[1] then
           Compare := 1
         else
           Compare := -1;
    4: if Abs(VData1[2]) <> Abs(VData2[2]) then
         if Abs(VData1[2]) > Abs(VData2[2]) then
           Compare := 1
         else
           Compare := -1;
    5: if (VData1[1] / Abs(VData1[2])) <> (VData2[1] / Abs(VData2[2])) then
         if (VData1[1] / Abs(VData1[2])) > (VData2[1] / Abs(VData2[2])) then
           Compare := 1
         else
           Compare := -1;
  end;
  if Tag < 0 then
    Compare := -Compare;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmMain.lvSearchResultsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);//PinterPeti
begin
  if Key = VK_RETURN then
    lvSearchResultsDblClick(Self);
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.MenuItem7Click(Sender: TObject);
var SaveIdx:Byte;
begin
  SaveDialog1.Title := GetText(5);
  SaveDialog1.DefaultExt := '*.' + TextExt;
  SaveDialog1.Filter := GetText(169) + ' (*.' + TextExt + ')|*.' + TextExt;
  SaveDialog1.InitialDir := LastSaveDir;
  if SaveDialog1.Execute then begin
    Repaint;
    LastSaveDir := ExtractFilePath(SaveDialog1.FileName);
    ShowWaitWindow(GetText(78));
    SetWaitWindowText(GetText(79) + '...');
    if SaveResults(SaveDialog1.FileName,SearchArea) then
     // PinterPeti
     { I have to use a  new variable (SearchArea, because of some reason I can' use
       frmFind.PageControl1.ActivePageIndex , don't know why )}
      Dialog(GetText(181) + ': ' + SaveDialog1.FileName, GetText(52), GetText(54), '', '', 1, 3)
    else
       Dialog(GetText(77) + ': ' + SaveDialog1.FileName, GetText(51), GetText(54), '', '', 1, 2);
    CloseWaitWindow;
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.cbDuplicatesChange(Sender: TObject); //PinterPeti
begin
  DuplicateOnChange;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.ListView1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
//PinterPeti: There could be some problem with this so maybe it should be removed
// I think under Win98 it crashes the program (not sure,I can't remember it (again))
// with winXP it works (for me)

var Index: Byte;
begin
  try
    for Index := 0 to ListView1.Columns.Count-1 do
      lvSearchResults.Column[Index].Width := ListView1.Column[Index].Width;
    except
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.lvSearchResultsMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
//PinterPeti: There could be some problem with this so maybe it should be removed
// I think under Win98 it crashes the program (not sure,I can't remember it (again))
// with winXP it works (for me)
var Index: Byte;
begin
  try
    for Index := 0 to ListView1.Columns.Count-1 do
      ListView1.Column[Index].Width := lvSearchResults.Column[Index].Width;
    except
  end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Delete3Click(Sender: TObject);
//PinterPeti removes entries from list BUT the files' informations left in the
//Volume's property (size,duration etc) and I couldn't figured out how to remove them
var Item: TListItem;
    SelectedItem,Node: TTreeNode;
    FileData1,FileData: DataArray;
    Index: Integer;
    Line,Line1:String;
begin
  while ListView1.SelCount <> 0 do begin
    Item := frmMain.ListView1.Selected;
    Node := TTreeNode(Item.Data);
    Item.Selected := False;
    FileData1 := ExtractData(Node.Text);
    Line1 := Node.Text;
//    for Index := 0 to ListBox4.Items.Count - 1 do begin
//      SelectedItem := TTreeNode(ListBox4.Items.Objects[Index]);
//      Line := SelectedItem.Text;
//      FileData := ExtractData(Line);
//      if Line1 = Line then
//        ListBox4.Items.Delete(Index);
//    end;
    TreeView1.Items.Delete(Node);
//    repeat
//      if ListBox4.Items.Objects.
//      SelectedItem := TTreeNode(ListBox4.Items.Objects[Index]);
//      Line := SelectedItem.Text;
//      FileData := ExtractData(Line);
//      Inc(Index)
//    until Node <> SelectedItem;
//    ListBox4.Items.Delete(Index);
    Item.Delete;
  end;
  Node := TreeView1.Selected;
//  if (not Node.HasChildren) and (Node.get ) then
//    Node.Delete;
  DataIsChanged := True;
  UpdateListView;
//  UpdateTreeView;
  UpdateInformation;
  UpdateControls;
  //  GetSelectedNode

end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.Delete4Click(Sender: TObject);
//PinterPeti deletes from writeable media BUT files' informations left in the
//Volume's property (size,duration etc) and I couldn't figured out how to remove them
var Item: TListItem;
    Node: TTreeNode;
    FName: String;
    Index: Integer;
begin
  if MessageBox(Handle, PChar(GetText(320)), PChar('Warning'), $00000034) = IDYES then begin
    while ListView1.SelCount <> 0 do begin
      Item := frmMain.ListView1.Selected;
      Node := Item.Data;
      FName := GetFilePath(Node);
      DeleteFile(FName);
      Item.Selected := False;
      TreeView1.Items.Delete(Node);
      Item.Delete;
    end;
  end;
  //  ListView1.DeleteSelected;
//  Node := TreeView1.Selected;
//  if not Node.HasChildren then
//    Node.Delete;
  DataIsChanged := True;
  UpdateListView;
  UpdateTreeView;
  UpdateInformation;
  UpdateControls;

end;

{ --------------------------------------------------------------------------- }

procedure TfrmMain.pmnSearchPopup(Sender: TObject);
//PinterPeti
var Index: Byte;
begin
  if lvSearchResults.Items.Count = 0 then
    for Index := 0 to pmnSearch.Items.Count-1 do
      pmnSearch.Items[Index].Visible := false
  else
    for Index := 0 to pmnSearch.Items.Count-1 do
      pmnSearch.Items[Index].Visible := True
end;

end.
