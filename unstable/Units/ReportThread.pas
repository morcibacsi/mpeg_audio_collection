unit ReportThread;

interface

uses
	Global, Classes, StdCtrls, ComCtrls, SysUtils;

type
	TReportThread = class(TThread)
	private
		PLabel, OLabel: TLabel;
		Progress: TProgressBar;
		CSize: array [0..16] of longint;
		Header1, Header2, Foot: string;
    SumSize, SumDuration, SumFolder, SumFile: longint;
		function CopyObjectsOK: boolean;
    function FolderInfoOK: boolean;
		function CreateReportOK: boolean;
		procedure WriteReport;
	protected
		procedure Execute; override;
	public
		constructor Create(Label1, Label2: TLabel; ProgressBar1: TProgressBar);
	end;

	ReportArray = array [0..16] of string;

const
	SHFT = 13;
 	SnapToLeft: array [1..16] of boolean = (false, false, true, false, true, true, true, true, true, true, true, true, false, false, true, true);

implementation

// -----------------------------------------------------------------------------

constructor TReportThread.Create(Label1, Label2: TLabel; ProgressBar1: TProgressBar);
begin
	PLabel := Label1;
	OLabel := Label2;
	Progress := ProgressBar1;

	inherited Create(false);
end;

// -----------------------------------------------------------------------------

procedure TReportThread.Execute;
begin
	TempTree.Items.Clear;
	if Terminated then exit;

	PLabel.Caption := PLabel.Hint + GetText(182);

	if CopyObjectsOK then
	begin

  	if RSorting then
    begin
			PLabel.Caption := PLabel.Hint + GetText(111);
			if (RowCol[3]) and (RowCol[4]) then TempTree.CustomSort(@TreeSorting, 0)
			else TempTree.AlphaSort;
    end;

    if (RowCol[3]) and (not FolderInfoOK) then
    begin
			PLabel.Caption := PLabel.Hint + GetText(118);
			TempTree.Items.Clear;
      exit;
    end;

		PLabel.Caption := PLabel.Hint + GetText(183);

		if (RFormat in [1..3]) and (CreateReportOK) then
		begin
			PLabel.Caption := PLabel.Hint + GetText(184);
			WriteReport;
		end;
	end;

	PLabel.Caption := PLabel.Hint + GetText(118);
	TempTree.Items.Clear;
end;

// -----------------------------------------------------------------------------

function TReportThread.CopyObjectsOK: boolean;
	function GetHeader: string;
	var
		Index: longint;
		RData: ReportArray;
	begin
		for Index := 0 to 16 do RData[Index] := '';

		RData[0] := GetText(41);
		if RowCol[5] then RData[1] := GetText(62);
		if RowCol[6] then RData[2] := GetText(64);
		if RowCol[7] then RData[3] := GetText(67);
		if RowCol[17] then RData[13] := GetText(68);
		if RowCol[18] then RData[14] := GetText(69);
		if RowCol[19] then RData[15] := GetText(174);
		if RowCol[20] then RData[16] := GetText(103);
		if RowCol[8] then RData[4] := GetText(70);
		if RowCol[9] then RData[5] := GetText(133);
		if RowCol[10] then RData[6] := GetText(211);
		if RowCol[11] then RData[7] := GetText(42);
    if RowCol[12] then RData[8] := GetText(43);
    if RowCol[13] then RData[9] := GetText(44);
    if RowCol[14] then RData[10] := GetText(45);
    if RowCol[15] then RData[11] := GetText(46);
    if RowCol[16] then RData[12] := GetText(47);

		for Index := 0 to 16 do CSize[Index] := Length(RData[Index]);

		Result := RData[0] + #1;
		for Index := 1 to 16 do Result := Result + RData[Index] + Chr(Index + SHFT);
	end;
var
	Index, Index2, Level: longint;
	Info: array [0..16] of string;
	TreeNode: TTreeNode;
	ReportNode: array [0..99] of TTreeNode;
	AddItem: boolean;
	Levels: array[1..4] of longint;
	ItemData: DataArray;
	ItemTag: TagArray;
	LastDate, LastVolume, DurStr: string;
begin
	Result := false;

  Level := 0;
  SumSize := 0;
  SumDuration := 0;
  SumFolder := 0;
  SumFile := 0;
	ReportNode[Level] := TempTree.Items.Add(nil, GetHeader);
	for Index := 1 to 4 do Levels[Index] := 0;

	Progress.Max := Tree.Items.Count - 1;
	for Index := 0 to Progress.Max do
	begin
		if Terminated then exit;
		Progress.Position := Index;
   	TreeNode := Tree.Items[Index];
		Info[0] := ExtractName(TreeNode.Text);
		ItemData := ExtractData(TreeNode.Text);
		if TreeNode.Level = 1 then
		begin
			LastVolume := Info[0];
			Index2 := Pos('\', LastVolume);
			Delete(LastVolume, Index2, Length(LastVolume) - Index2 + 1);
      if not FullPath then Info[0] := LastVolume;
			LastDate := FormatDateTime('dd/mm/yyyy', ItemData[5]);
		end;

    if TreeNode.HasChildren then OLabel.Caption := OLabel.Hint + Info[0];

		AddItem := false;

		if (TreeNode.HasChildren) and ((RowCol[1]) or (RowCol[2]) or (RowCol[3])) then
		begin
			for Index2 := 1 to 16 do Info[Index2] := Chr(Index2 + SHFT);
			if RowCol[5] then Info[1] := FloatToStrF(ItemData[1] / 1024, ffFixed, 15, 2) + Info[1];
			DurStr := DurationToStr(Abs(ItemData[2]));
			if RowCol[6] then Info[2] := DurStr + Info[2];
			if ItemData[2] <> 0 then Index2 := Trunc(ItemData[1] * 8 * 1.024 / Abs(ItemData[2]))
			else Index2 := 0;
			if RowCol[7] then Info[3] := GetText(65) + #32 + IntToStr(Index2) + Info[3];
			if RowCol[17] then Info[13] := IntToStr(ItemData[3]) + Info[13];
			if RowCol[18] then Info[14] := IntToStr(ItemData[4]) + Info[14];

			if (TreeNode.Level = 0) and (RowCol[1]) then
			begin
				Info[0] := GetText(1) + ' ' + ExtractFileName(CurrentCollection);

				if RowCol[19] then Info[15] := FormatDateTime('dd/mm/yyyy', ItemData[5]) + Info[15];

				Levels[1] := 1;
				Level := Levels[1];
				AddItem := true;
			end;

			if (TreeNode.Level = 1) and (RowCol[2]) then
			begin
				if RowCol[19] then Info[15] := LastDate + Info[15];

				Levels[2] := 1;
				Level := Levels[1] + Levels[2];
				AddItem := true;
			end;

			if (TreeNode.Level > 1) and (RowCol[3]) then
			begin
				if RowCol[19] then Info[15] := LastDate + Info[15];
				if RowCol[20] then Info[16] := LastVolume + Info[16];

				Levels[3] := TreeNode.Level - 1;
				Level := Levels[1] + Levels[2] + Levels[3];
				AddItem := true;
			end;
		end;

		if (not TreeNode.HasChildren) and (RowCol[4]) then
		begin
      if (not FileExtensions) and (Pos('.', Info[0]) > 0) then Info[0] := Copy(Info[0], 1, LastDelimiter('.', Info[0]) - 1);

			for Index2 := 1 to 16 do Info[Index2] := Chr(Index2 + SHFT);

			if RowCol[5] then Info[1] := FloatToStrF(ItemData[1] / 1024, ffFixed, 15, 2) + Info[1];
			if RFormat = 2 then DurStr := DurationToStr(Abs(ItemData[2]))
      else DurStr := DurationToShortStr(Abs(ItemData[2]));
			if RowCol[6] then Info[2] := DurStr + Info[2];
			if ItemData[2] <> 0 then Index2 := Trunc(ItemData[1] * 8 * 1.024 / Abs(ItemData[2]))
			else Index2 := 0;
			if ItemData[2] > 0 then Index2 := AlignedBitRate(Index2, ItemData[3], ItemData[4], ItemData[5], ItemData[6]);
			if RowCol[7] then
      begin
      	if ItemData[2] < 0 then Info[3] := GetText(66) + #32 + IntToStr(Index2) + Info[3]
        else Info[3] := GetText(148) + #32 + IntToStr(Index2) + Info[3];
      end;
			if RowCol[19] then Info[15] := LastDate + Info[15];
			if RowCol[20] then Info[16] := LastVolume + Info[16];
			if RowCol[8] then Info[4] := IntToStr(ItemData[3] * 10) + Info[4];
			if RowCol[9] then Info[5] := GetChannelMode(ItemData[4]) + Info[5];
			if RowCol[10] then Info[6] := GetMPEGType(ItemData[5], ItemData[6]) + Info[6];
      ItemTag := ExtractTag(TreeNode.Text);
      for Index2 := 1 to 6 do
      	if RowCol[Index2 + 10] then Info[Index2 + 6] := ItemTag[Index2] + Info[Index2 + 6];

			if RowCol[3] then Levels[4] := TreeNode.Level - 1
			else Levels[4] := 1;
			Level := Levels[1] + Levels[2] + Levels[4];
			AddItem := true;
		end;

    if (TreeNode.Level > 0) and (RScanning = 2) and (TreeNode.OverlayIndex < 0) then continue;

    if not TreeNode.HasChildren then
    begin
			Inc(SumSize, ItemData[1]);
      Inc(SumDuration, Abs(ItemData[2]));
    end;

		if AddItem then
		begin
			Info[0] := Info[0] + #1;

			for Index2 := 0 to 16 do
				if CSize[Index2] < (Length(Info[Index2]) - 1) then CSize[Index2] := Length(Info[Index2]) - 1;
			if CSize[0] < (Length(Info[0]) + Level - 2) then CSize[0] := Length(Info[0]) + Level - 2;

			for Index2 := 1 to 16 do Info[0] := Info[0] + Info[Index2];
			ReportNode[Level] := TempTree.Items.AddChild(ReportNode[Level - 1], Info[0]);
      ReportNode[Level].Data := TreeNode;

      if TreeNode.HasChildren then Inc(SumFolder, 1)
      else Inc(SumFile, 1);
		end;

		if (RowCol[1]) and (not RowCol[2]) and (not RowCol[3]) and (not RowCol[4]) then break;
	end;

	OLabel.Caption := OLabel.Hint;
	Result := true;
end;

// -----------------------------------------------------------------------------

function ExtractRData(Source: string): ReportArray;
var
	CharPos: array [0..16] of integer;
	Index: longint;
begin
	CharPos[0] := Pos(#1, Source);
	for Index := 1 to 16 do CharPos[Index] := Pos(Chr(Index + SHFT), Source);

	Result[0] := Copy(Source, 1, CharPos[0] - 1);
	for Index := 0 to 15 do
		Result[Index + 1] := Copy(Source, CharPos[Index] + 1, CharPos[Index + 1] - CharPos[Index] - 1);
end;

// -----------------------------------------------------------------------------

function TReportThread.FolderInfoOK: boolean;
var
	Index, Temp: longint;
	RData: ReportArray;
  FileData: DataArray;
  TagData: TagArray;
  RNode, Child: TTreeNode;
  BitRate: integer;
  VBR, CBR, SRateOK, CModeOK, MVersionOK, ArtistOK, AlbumOK, YearOK, CommentOK: boolean;
  TextItem, SRate, CMode, MVersion, Artist, Album, Year, Comment, DString: string;
begin
	Result := false;

	Progress.Max := TempTree.Items.Count - 1;
	for Index := 1 to Progress.Max do
	begin
		if Terminated then exit;
		Progress.Position := Index;
    RNode := TempTree.Items[Index].Data;

    if (RNode.HasChildren) and (RNode.Level > 1) then
    begin
			RData := ExtractRData(TempTree.Items[Index].Text);
	    OLabel.Caption := OLabel.Hint + RData[0];

      BitRate := -1;
      VBR := true;
      CBR := true;
      SRate := '';
			SRateOK := true;
      CMode := '';
			CModeOK := true;
      MVersion := '';
			MVersionOK := true;
      Artist := '';
      ArtistOK := true;
      Album := '';
      AlbumOK := true;
      Year := '';
      YearOK := true;
      Comment := '';
      CommentOK := true;

			Child := RNode.GetFirstChild;
		  while Child <> nil do
		  begin
      	if Child.HasChildren then break;
        FileData := ExtractData(Child.Text);
        TagData := ExtractTag(Child.Text);

				if (FileData[2] <> 0) and (BitRate <> 0) then
        begin
	        Temp := Trunc(FileData[1] * 8 * 1.024 / Abs(FileData[2]));
					if FileData[2] > 0 then
          begin
          	VBR := false;
          	Temp := AlignedBitRate(Temp, FileData[3], FileData[4], FileData[5], FileData[6]);
            if BitRate < 0 then BitRate := Temp
            else if BitRate <> Temp then BitRate := 0;
          end
          else CBR := false;
        end;

        if SRateOK then
        begin
        	DString := IntToStr(FileData[3] * 10);
        	if SRate = '' then SRate := DString
          else if SRate <> DString then SRateOK := false;
        end;
        if CModeOK then
        begin
        	DString := GetChannelMode(FileData[4]);
        	if CMode = '' then CMode := DString
          else if CMode <> DString then CModeOK := false;
        end;
        if MVersionOK then
        begin
					if FileData[5] = 0 then MVersionOK := false
          else DString := GetMPEGType(FileData[5], FileData[6]);
        	if MVersion = '' then MVersion := DString
          else if MVersion <> DString then MVersionOK := false;
        end;
        if ArtistOK then
        begin
        	if Artist = '' then Artist := TagData[2]
          else if Artist <> TagData[2] then ArtistOK := false;
        end;
        if AlbumOK then
        begin
        	if Album = '' then Album := TagData[3]
          else if Album <> TagData[3] then AlbumOK := false;
        end;
        if YearOK then
        begin
        	if Year = '' then Year := TagData[5]
          else if Year <> TagData[5] then YearOK := false;
        end;
        if CommentOK then
        begin
        	if Comment = '' then Comment := TagData[6]
          else if Comment <> TagData[6] then CommentOK := false;
        end;

			  Child := Child.GetNextSibling;
		  end;

      if Child = nil then
      begin
      	TextItem := TempTree.Items[Index].Text;

				if (VBR) and (not CBR) then
	        TextItem := StringReplace(TextItem, Chr(2 + SHFT) + GetText(65) + #32, Chr(2 + SHFT) + GetText(66) + #32, []);
				if (CBR) and (not VBR) and (BitRate > 0) then
	        TextItem := StringReplace(TextItem, Chr(2 + SHFT) + GetText(65) + #32, Chr(2 + SHFT) + GetText(148) + #32, []);

        if (SRateOK) and (SRate <> '') then
        begin
        	Insert(SRate, TextItem, Pos(Chr(4 + SHFT), TextItem));
          if CSize[4] < Length(SRate) then CSize[4] := Length(SRate);
        end;
        if (CModeOK) and (CMode <> '') then
        begin
        	Insert(CMode, TextItem, Pos(Chr(5 + SHFT), TextItem));
          if CSize[5] < Length(CMode) then CSize[5] := Length(CMode);
        end;
        if (MVersionOK) and (MVersion <> '') then
        begin
        	Insert(MVersion, TextItem, Pos(Chr(6 + SHFT), TextItem));
          if CSize[6] < Length(MVersion) then CSize[6] := Length(MVersion);
        end;
        if (ArtistOK) and (Artist <> '') then
        begin
        	Insert(Artist, TextItem, Pos(Chr(8 + SHFT), TextItem));
          if CSize[8] < Length(Artist) then CSize[8] := Length(Artist);
        end;
        if (AlbumOK) and (Album <> '') then
        begin
        	Insert(Album, TextItem, Pos(Chr(9 + SHFT), TextItem));
          if CSize[9] < Length(Album) then CSize[9] := Length(Album);
        end;
        if (YearOK) and (Year <> '') then
        begin
        	Insert(Year, TextItem, Pos(Chr(11 + SHFT), TextItem));
          if CSize[11] < Length(Year) then CSize[11] := Length(Year);
        end;
        if (CommentOK) and (Comment <> '') then
        begin
        	Insert(Comment, TextItem, Pos(Chr(12 + SHFT), TextItem));
          if CSize[12] < Length(Comment) then CSize[12] := Length(Comment);
        end;

        TempTree.Items[Index].Text := TextItem;
      end;
    end;
	end;

  OLabel.Caption := OLabel.Hint;
	Result := true;
end;

// -----------------------------------------------------------------------------

function TReportThread.CreateReportOK: boolean;

	function BuildLine(ReportData: ReportArray; Level: longint; IsHeader, IsFoot: boolean): string;
	var
		Index: longint;
	begin
		Result := StringOfChar(#32, Level - 1) + ReportData[0] + StringOfChar(#32, CSize[0] - Length(ReportData[0]) - Level + 1);

    if ItemNumeration then
	    if (isHeader) or (isFoot) then Result := Result + StringOfChar(#32, Length(IntToStr(Progress.Max)) + 1)
  	  else Result := IntToStr(Progress.Position) + StringOfChar(#32, Length(IntToStr(Progress.Max)) - Length(IntToStr(Progress.Position)) + 1) + Result;

		for Index := 1 to 16 do
			if (RowCol[RowColIndex[Index] + 4]) and (CSize[RowColIndex[Index]] > 0) then
      	if (SnapToLeft[RowColIndex[Index]]) or (IsHeader) then
        	Result := Result + #32 + ReportData[RowColIndex[Index]] + StringOfChar(#32, CSize[RowColIndex[Index]] - Length(ReportData[RowColIndex[Index]]))
        else
					Result := Result + StringOfChar(#32, CSize[RowColIndex[Index]] - Length(ReportData[RowColIndex[Index]]) + 1) + ReportData[RowColIndex[Index]];
	end;

	function BuildRow(ReportData: ReportArray; Level: longint; IsHeader: boolean): string;
	var
		Index: longint;
	begin
		Result := 'BOT' + #13#10 + '1,0' + #13#10 + '"' + StringOfChar(#32, (Level - 1) * 3) + ReportData[0] + '"' + #13#10;

		for Index := 1 to 16 do
			if (RowCol[RowColIndex[Index] + 4]) and (CSize[RowColIndex[Index]] > 0) then
      	if (SnapToLeft[RowColIndex[Index]]) or (IsHeader) then
        	Result := Result + '1,0' + #13#10 + '"' + ReportData[RowColIndex[Index]] + '"' + #13#10
        else
					Result := Result + '0,' + ReportData[RowColIndex[Index]] + #13#10 + 'V' + #13#10;

		Result := Result + '-1,0';
	end;

	function BuildTAG(ReportData: ReportArray; Level: longint; IsHeader, IsFoot: boolean): string;
	var
		Index: longint;
    ColTAG, BGColor: string;
	begin
  	if (IsHeader) or (IsFoot) then
    begin
    	ColTAG := 'TH';
      BGColor := 'BGCOLOR="#C6C6C6"';
    end
    else
    begin
    	ColTAG := 'TD';
      case Level mod 6 of
        1: BGColor := 'BGCOLOR="#F8F8F8"';
        2: BGColor := 'BGCOLOR="#F0F0F0"';
        3: BGColor := 'BGCOLOR="#E8E8E8"';
        4: BGColor := 'BGCOLOR="#E0E0E0"';
        5: BGColor := 'BGCOLOR="#D6D6D6"'
      	else BGColor := 'BGCOLOR="#CECECE"';
      end;
    end;

		Result := '<TR ' + BGColor + '>';
    if ItemNumeration then
    	if (isHeader) or (IsFoot) then
        Result := Result + '<' + ColTAG + ' COLSPAN=2 ALIGN=left NOWRAP>' + StringOfChar(#46, (Level - 1) * 2) + ReportData[0] + '</' + ColTag + '>'
      else
      begin
      	Result := Result + '<' + ColTAG + '>' + IntToStr(Progress.Position) + '</' + ColTAG + '>';
        Result := Result + '<' + ColTAG + ' ALIGN=left NOWRAP>' + StringOfChar(#46, (Level - 1) * 2) + ReportData[0] + '</' + ColTag + '>';
      end
    else
	    Result := Result + '<' + ColTAG + ' ALIGN=left NOWRAP>' + StringOfChar(#46, (Level - 1) * 2) + ReportData[0] + '</' + ColTag + '>';

		for Index := 1 to 16 do
			if (RowCol[RowColIndex[Index] + 4]) and (CSize[RowColIndex[Index]] > 0) then
      	if (SnapToLeft[RowColIndex[Index]]) or (IsHeader) then
        	Result := Result + '<' + ColTAG + ' ALIGN=left NOWRAP>' + ReportData[RowColIndex[Index]] + '</' + ColTag + '>'
        else
					Result := Result + '<' + ColTAG + ' ALIGN=right NOWRAP>' + ReportData[RowColIndex[Index]] + '</' + ColTag + '>';

    Result := Result + '</TR>';
	end;

var
	Index, Index2, ColCount: longint;
	RData, SData, AData: ReportArray;
begin
	Result := false;

	for Index := 0 to 16 do
  begin
  	SData[Index] := '';
    AData[Index] := '';
  end;
  SData[0] := IntToStr(TempTree.Items.Count - 1) + ' ' + GetText(218);
  SData[1] := FloatToStrF(SumSize / 1024, ffFixed, 15, 2);
  SData[2] := DurationToStr(SumDuration);
  if SumDuration > 0 then SData[3] := GetText(65) + #32 + IntToStr(Trunc(SumSize * 8 * 1.024 / SumDuration));
  SData[13] := IntToStr(SumFolder);
  SData[14] := IntToStr(SumFile);

	for Index := 0 to 16 do
   	if CSize[Index] < Length(SData[Index]) then CSize[Index] := Length(SData[Index]);

	Progress.Max := TempTree.Items.Count - 1;
	for Index := 1 to Progress.Max do
	begin
		if Terminated then exit;
		Progress.Position := Index;

		RData := ExtractRData(TempTree.Items[Index].Text);
    OLabel.Caption := OLabel.Hint + RData[0];

    if ReportSummary then
    	for Index2 := 0 to 16 do
		    if Index = 1 then AData[Index2] := RData[Index2]
	    	else if AData[Index2] <> RData[Index2] then AData[Index2] := '';

		case RFormat of
			2: TempTree.Items[Index].Text := BuildRow(RData, TempTree.Items[Index].Level, false);
      3: TempTree.Items[Index].Text := BuildTAG(RData, TempTree.Items[Index].Level, false, false);
			else TempTree.Items[Index].Text := BuildLine(RData, TempTree.Items[Index].Level, false, false);
		end;
	end;

	for Index := 0 to 16 do
		if not (Index in [0, 1, 2, 3, 13, 14]) then SData[Index] := AData[Index];

	RData := ExtractRData(TempTree.Items[0].Text);
	case RFormat of
		2:begin
    		ColCount := 1;
        for Index := 1 to 16 do if CSize[Index] > 0 then Inc(ColCount);
    		Header1 := 'TABLE' + #13#10 + '0,1' + #13#10 + '"EXCEL"' + #13#10
        	+ 'VECTORS' + #13#10 + '0,' + IntToStr(TempTree.Items.Count) + #13#10
          + '""' + #13#10 + 'TUPLES' + #13#10 + '0,' + IntToStr(ColCount) + #13#10
          + '""' + #13#10 + 'DATA' + #13#10 + '0,0' + #13#10 + '""' + #13#10 + '-1,0';
				Header2 := BuildRow(RData, 1, true);
        Foot := 'EOD';
			end;
		3:begin
				Header1 := '<HTML><HEAD><TITLE></TITLE></HEAD><BODY><CENTER><TABLE RULES=cols CELLSPACING="0" CELLPADDING="2" BORDER="1">';
				Header2 := BuildTAG(RData, 1, true, false);
        Foot := '</TABLE></CENTER></BODY></HTML>';
			  if ReportSummary then Foot := BuildTAG(SData, 1, false, true) + #13#10 + Foot;
			end
		else
		begin
			Header1 := BuildLine(RData, 1, true, false);
			Header2 := StringOfChar('-', Length(Header1));
		  if not ReportSummary then Foot := ''
      else Foot := Header2 + #13#10 + BuildLine(SData, 1, false, true);
    end;
	end;

  OLabel.Caption := OLabel.Hint;
	Result := true;
end;

// -----------------------------------------------------------------------------

procedure TReportThread.WriteReport;
var
	Index: longint;
	RFile: TextFile;
begin
	AssignFile(RFile, LastReportFile);

	try
	begin
		Rewrite(RFile);

		WriteLn(RFile, Header1);
		WriteLn(RFile, Header2);

		Progress.Max := TempTree.Items.Count - 1;
		for Index := 1 to Progress.Max do
		begin
			if Terminated then raise EInOutError.Create('');
			Progress.Position := Index;

			WriteLn(RFile, TempTree.Items[Index].Text);
		end;

    if Foot <> '' then WriteLn(RFile, Foot);
	end;
	finally
	begin
		Flush(RFile);
		CloseFile(RFile);
	end;
	end;
end;

// -----------------------------------------------------------------------------

end.
