unit FolderInfo;

interface

uses
	Global, WaitWindow,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, StdCtrls, ExtCtrls;

type
  TfrmFolderInfo = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Panel2: TPanel;
    Image13: TImage;
    Image14: TImage;
    Image16: TImage;
    Image17: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
// begin MB
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
// end MB
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    //
  end;

var
	SelectedNode: TTreeNode;

procedure ShowFolderInfo(const Node: TTreeNode);

implementation

{$R *.DFM}

{ --------------------------------------------------------------------------- }

procedure ShowFolderInfo(const Node: TTreeNode);
begin
	SelectedNode := Node;
	with TfrmFolderInfo.Create(Application) do
		try ShowModal;
		finally Release;
	end;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFolderInfo.Button1Click(Sender: TObject);
begin
	Close;
end;

{ --------------------------------------------------------------------------- }

procedure TfrmFolderInfo.FormCreate(Sender: TObject);
var
	Index, FileCount: longint;
	NTag: TagArray;
  NData: DataArray;
  Various: array [1..8] of boolean; // MB modify range (7->8)
  SampleText, ModeText, TypeText: string;
begin
	Caption := GetText(52) + ':  ' + TTreeNode(SelectedNode.Data).Text;
	Button1.Caption := GetText(54);

	Label15.Caption := GetText(43);
	Label16.Caption := GetText(44);
	Label17.Caption := GetText(46);
	Label18.Caption := GetText(47);
	Label19.Caption := GetText(132);
	Label20.Caption := GetText(133);
  Label21.Caption := GetText(211);
// begin MB
  Label1.Caption  := GetText(lngGenre);
// end MB
	ShowWaitWindow(GetText(102));
	SetWaitWindowText(GetText(79) + '...');

  for Index := 1 to 8 do Various[Index] := false; // MB index set to 8
  FileCount := 0;

  for Index := SelectedNode.StateIndex + 1 to Tree.Items.Count - 1 do
  begin
  	if Tree.Items[Index].Level <= SelectedNode.Level then break;
    if Tree.Items[Index].HasChildren then continue;

		NTag := ExtractTag(Tree.Items[Index].Text);
		NData := ExtractData(Tree.Items[Index].Text);

    if (NData[5] <> 0) then
    begin
		  Inc(FileCount);
		  SampleText := IntToStr(NData[3] * 10) + ' ' + GetText(70);
		  ModeText := GetChannelMode(NData[4]);
		  if (NData[5] <> 0) and (NData[6] <> 0) then TypeText := GetMPEGType(NData[5], NData[6])
  	  else TypeText := GetText(32);

      if FileCount = 1 then
      begin
		    Label22.Caption := NTag[2];
  		  Label23.Caption := NTag[3];
    		Label24.Caption := NTag[5];
    		Label25.Caption := NTag[6];
        Label2.Caption  := NTag[7]; // MB add tag Genre
  		  Label26.Caption := SampleText;
    		Label27.Caption := ModeText;
    		Label28.Caption := TypeText;
  	  	continue;
      end;

      if LowerCase(Label22.Caption) <> LowerCase(NTag[2]) then Various[1] := true;
      if LowerCase(Label23.Caption) <> LowerCase(NTag[3]) then Various[2] := true;
      if LowerCase(Label24.Caption) <> LowerCase(NTag[5]) then Various[3] := true;
      if LowerCase(Label25.Caption) <> LowerCase(NTag[6]) then Various[4] := true;
      if LowerCase(Label2.Caption)  <> LowerCase(NTag[7]) then Various[8] := true; // MB
      if Label26.Caption <> SampleText then Various[5] := true;
  		if Label27.Caption <> ModeText then Various[6] := true;
      if Label28.Caption <> TypeText then Various[7] := true;
    end;
  end;

  // because of 'R&B'
  Label2.Caption  := StringReplace(Label2.Caption, '&', '&&', []);

  if Various[1] then Label22.Caption := GetText(216);
  if Various[2] then Label23.Caption := GetText(216);
  if Various[3] then Label24.Caption := GetText(216);
  if Various[4] then Label25.Caption := GetText(216);
  if Various[8] then Label2.Caption  := GetText(216); // MB
  if Various[5] then Label26.Caption := GetText(216);
  if Various[6] then Label27.Caption := GetText(216);
  if Various[7] then Label28.Caption := GetText(216);

  if (Label22.Caption = '') or (Label22.Caption = GetText(216)) then Label22.Enabled := false;
  if (Label23.Caption = '') or (Label23.Caption = GetText(216)) then Label23.Enabled := false;
  if (Label24.Caption = '') or (Label24.Caption = GetText(216)) then Label24.Enabled := false;
  if (Label25.Caption = '') or (Label25.Caption = GetText(216)) then Label25.Enabled := false;
  if (Label2.Caption  = '') or (Label2.Caption  = GetText(216)) then Label2.Enabled  := false; // MB
  if Label26.Caption = GetText(216) then Label26.Enabled := false;
	if Label27.Caption = GetText(216) then Label27.Enabled := false;
  if Label28.Caption = GetText(216) then Label28.Enabled := false;

  if Label22.Caption = '' then Label22.Caption := GetText(138);
  if Label23.Caption = '' then Label23.Caption := GetText(138);
  if Label24.Caption = '' then Label24.Caption := GetText(138);
  if Label25.Caption = '' then Label25.Caption := GetText(138);
  if Label2.Caption  = '' then Label2.Caption  := GetText(138); // MB

  CloseWaitWindow;
end;

{ --------------------------------------------------------------------------- }

end.
