unit ScanThread;

interface

uses
	Monkey, WAVfile, OggVorbis, TwinVQ, MPEGplus, ID3v2, MPEGaudio, WMAfile,
  Global, Classes, StdCtrls,ComCtrls, SysUtils;

type
	TScanThread = class(TThread)
	private
		SourcePath: string;
		UpdatedNode: TTreeNode;
		UpdateInfo: boolean;
		SourceLabel: string;
		SourceSerial: longint;
		VLabel, DLabel, FLabel: TLabel;
		MPEGFile: TMPEGaudio;
    MPPFile: TMPEGplus;
    VQFFile: TTwinVQ;
    WMAFile: TWMAfile;
    OGGFile: TOggVorbis;
    WAVFile: TWAVfile;
    Monkey: TMonkey;
    ID3v2: TID3v2;
		VolumeData: DataArray;
		function ScanDir(Root: TTreeNode; Path: string): DataArray;
		procedure UpdateCollectionInfo(VolumeInfo: DataArray);
	protected
		procedure Execute; override;
	public
		constructor Create(SPath: string; UNode: TTreeNode; UInfo: boolean; Label1, Label2, Label3: TLabel);
	end;

implementation

// -----------------------------------------------------------------------------

constructor TScanThread.Create(SPath: string; UNode: TTreeNode; UInfo: boolean; Label1, Label2, Label3: TLabel);
begin
	SourcePath := SPath;
	UpdatedNode := UNode;
	UpdateInfo := UInfo;

	VLabel := Label3;
	DLabel := Label1;
	FLabel := Label2;

	FileList.Mask := FileMask + ';' + MPPFileMask + ';*.' + VQFExt + ';*.' + WMAExt + ';*.' + OGGExt + ';*.' + WAVExt + ';' + MonkeyMask;

	MPEGFile := TMPEGaudio.Create;
  MPPFile := TMPEGplus.Create;
  VQFFile := TTwinVQ.Create;
  WMAFile := TWMAfile.Create;
  OGGFile := TOggVorbis.Create;
  WAVFile := TWAVfile.Create;
  ID3v2 := TID3v2.Create;
  Monkey := TMonkey.Create;

	inherited Create(false);
end;

// -----------------------------------------------------------------------------

procedure TScanThread.Execute;
var
	Index: longint;
	VolumeNode: TTreeNode;
begin
	if not VolumeDataOK(SourcePath[1], SourceLabel, SourceSerial) then exit;

  if UserVolumeLabel <> '' then SourceLabel := UserVolumeLabel;
	if Length(SourcePath) > 3 then
		SourceLabel := SourceLabel + Copy(SourcePath, 3, Length(SourcePath) - 2);

	if UpdatedNode = nil then VolumeNode := Tree.Items.AddChild(Tree.Items[0], SourceLabel)
	else
  begin
  	if GetVolumePath(SourceLabel) = GetVolumePath(ExtractName(UpdatedNode.Text)) then
    	SourceLabel := ExtractName(UpdatedNode.Text);
  	VolumeNode := Tree.Items.Insert(UpdatedNode, SourceLabel);
  end;
  VLabel.Caption := VLabel.Hint + SourceLabel;
	VolumeData := ScanDir(VolumeNode, SourcePath);

 	MPEGFile.Free;
  MPPFile.Free;
  VQFFile.Free;
  WMAFile.Free;
  OGGFile.Free;
  WAVFile.Free;
  ID3v2.Free;
  Monkey.Free;

  if Terminated then exit;

	if VolumeData[4] > 0 then
	begin
		VolumeData[5] := Trunc(Date);
		VolumeData[6] := SourceSerial;

		for Index := 1 to 6 do
			VolumeNode.Text := VolumeNode.Text + Chr(Index) + IntToStr(VolumeData[Index]);
		VolumeNode.Text := VolumeNode.Text + #7;

		if UpdateInfo then UpdateCollectionInfo(VolumeData);
	end
	else
		Tree.Items.Delete(VolumeNode);
end;

// -----------------------------------------------------------------------------

procedure TScanThread.UpdateCollectionInfo(VolumeInfo: DataArray);
var
	CollectionInfo, UpdatedInfo: DataArray;
	Index: longint;
begin
	CollectionInfo := ExtractData(Tree.Items[0].Text);

	Inc(CollectionInfo[1], VolumeInfo[1]);
	Inc(CollectionInfo[2], VolumeInfo[2]);
	Inc(CollectionInfo[3], 1);
	Inc(CollectionInfo[4], VolumeInfo[4]);
	CollectionInfo[5] := VolumeInfo[5];

	if UpdatedNode <> nil then
	begin
		UpdatedInfo := ExtractData(UpdatedNode.Text);

		Dec(CollectionInfo[1], UpdatedInfo[1]);
		Dec(CollectionInfo[2], UpdatedInfo[2]);
		Dec(CollectionInfo[3], 1);
		Dec(CollectionInfo[4], UpdatedInfo[4]);
	end;

	Tree.Items[0].Text := #1;
	for Index := 1 to 5 do
			Tree.Items[0].Text := Tree.Items[0].Text + IntToStr(CollectionInfo[Index])+ Chr(Index + 1);
end;

// -----------------------------------------------------------------------------

function TScanThread.ScanDir(Root: TTreeNode; Path: string): DataArray;
var
	Index, Index2: longint;
	CurrentItem, CurrentDir, TagString, DataString, ExtString: string;
	DirData, FileData: DataArray;
	FileTag, FileTag2: TagArray;
	Child: TTreeNode;
begin
	for Index := 1 to 4 do Result[Index] := 0;

	DLabel.Caption := DLabel.Hint + Path;

  try
		DirList.Directory := Path;
 		DirList.Update;
    FileList.Update;
  except
  	DirList.Tag := -1;
    exit;
  end;

	if Length(Path) = 3 then DirList.ItemIndex := 0;

	for Index := DirList.ItemIndex + 1 to DirList.Items.Count - 1 do
	begin
		if Terminated then exit;

		CurrentItem := DirList.Items.Strings[Index];

		CurrentDir := DirList.Directory;

		if Length(CurrentDir) > 3 then CurrentDir := CurrentDir + '\' + CurrentItem
		else CurrentDir := CurrentDir + CurrentItem;

		Child := Tree.Items.AddChild(Root, Trim(CurrentItem));
		DirData := ScanDir(Child, CurrentDir);

		if DirData[4] > 0 then
		begin
			for Index2 := 1 to 4 do
				Child.Text := Child.Text + Chr(Index2) + IntToStr(DirData[Index2]);
			Child.Text := Child.Text + #5;

			Inc(Result[1], DirData[1]);
			Inc(Result[2], DirData[2]);
			Inc(Result[3], DirData[3] + 1);
			Inc(Result[4], DirData[4]);
		end
		else
			Tree.Items.Delete(Child);

		DirList.Directory := Path;
		DLabel.Caption := DLabel.Hint + Path;
	end;

	for Index := 0 to FileList.Items.Count - 1 do
	begin
		if Terminated then exit;

		FileList.ItemIndex := Index;
		CurrentItem := Trim(FileList.Items.Strings[Index]);
		FLabel.Caption := FLabel.Hint + CurrentItem;

		for Index2 := 1 to 6 do
		begin
			FileData[Index2] := 0;
			FileTag[Index2] := '';
      FileTag2[Index2] := '';
		end;

    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), MPPFileMask) > 0 then
    begin
      MPPFile.ReadFromFile(FileList.FileName);
			FileData[1] := MPPFile.FileSize div 1024;

			if not MPPFile.Corrupted then
			begin
				FileData[2] := -Round(MPPFile.Duration);
				FileData[3] := 4410;
				FileData[4] := MPPFile.ChannelModeID;
				FileData[5] := MPPFile.StreamVersion;
				FileData[6] := MPPFile.ProfileID;

				if (MPPFile.ID3v1.Exists) or (MPPFile.ID3v2.Exists) then
          FileTag2 := GetFileTag(FileList.FileName, 0, 0);

				if MPPFile.APEtag.Exists then
				begin
					FileTag[1] := TextFilter(MPPFile.APEtag.Title, 0);
					FileTag[2] := TextFilter(MPPFile.APEtag.Artist, 0);
					FileTag[3] := TextFilter(MPPFile.APEtag.Album, 0);
					if MPPFile.APEtag.Track in [1..99] then FileTag[4] := IntToStr(MPPFile.APEtag.Track);
					FileTag[5] := TextFilter(MPPFile.APEtag.Year, 0);
					FileTag[6] := TextFilter(MPPFile.APEtag.Comment, 0);
				end;

  			for Index2 := 1 to 6 do
          if FileTag[Index2] = '' then FileTag[Index2] := FileTag2[Index2];

	      if GuessedEncoder then FileTag[6] := 'MPEGplus';
			end
   	  else if ValidFiles then continue;
    end;

    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), '.' + VQFExt) > 0 then
    begin
    	VQFFile.ReadFromFile(FileList.FileName);
			FileData[1] := VQFFile.FileSize div 1024;

			if (VQFFile.Valid) and (not VQFFile.Corrupted) then
			begin
				FileData[2] := Round(VQFFile.Duration);
				FileData[3] := VQFFile.SampleRate div 10;
        if VQFFile.ChannelModeID = 1 then FileData[4] := 4;
        if VQFFile.ChannelModeID = 2 then FileData[4] := 1;
				FileData[5] := 10;
				FileData[6] := 10;

        FileTag[1] := TextFilter(VQFFile.Title, 0);
				FileTag[2] := TextFilter(VQFFile.Author, 0);
        FileTag[3] := TextFilter(VQFFile.Album, 0);
				FileTag[6] := TextFilter(VQFFile.Comment, 0);

	      if GuessedEncoder then FileTag[6] := 'TwinVQ';
			end
   	  else if ValidFiles then continue;
    end;

    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), '.' + WMAExt) > 0 then
    begin
    	WMAFile.ReadFromFile(FileList.FileName);
			FileData[1] := WMAFile.FileSize div 1024;

			if WMAFile.Valid then
			begin
				FileData[2] := Round(WMAFile.Duration);
				FileData[3] := WMAFile.SampleRate div 10;
        if WMAFile.ChannelModeID = 1 then FileData[4] := 4;
        if WMAFile.ChannelModeID = 2 then FileData[4] := 1;
				FileData[5] := 25;
				FileData[6] := 25;

        FileTag[1] := TextFilter(WMAFile.Title, 0);
				FileTag[2] := TextFilter(WMAFile.Artist, 0);
        FileTag[3] := TextFilter(WMAFile.Album, 0);
        if WMAFile.Track in [1..99] then FileTag[4] := IntToStr(WMAFile.Track);
        FileTag[5] := TextFilter(WMAFile.Year, 0);
				FileTag[6] := TextFilter(WMAFile.Comment, 0);

	      if GuessedEncoder then FileTag[6] := 'WMA';
			end
   	  else if ValidFiles then continue;
    end;

    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), '.' + OGGExt) > 0 then
    begin
    	OGGFile.ReadFromFile(FileList.FileName);
			FileData[1] := OGGFile.FileSize div 1024;

			if OGGFile.Valid then
			begin
				FileData[2] := -Round(OGGFile.Duration);
				FileData[3] := OGGFile.SampleRate div 10;
        if OGGFile.ChannelModeID = 1 then FileData[4] := 4;
        if OGGFile.ChannelModeID = 2 then FileData[4] := 1;
				FileData[5] := 20;
				FileData[6] := 20;

        FileTag[1] := TextFilter(OGGFile.Title, 0);
				FileTag[2] := TextFilter(OGGFile.Artist, 0);
				FileTag[3] := TextFilter(OGGFile.Album, 0);
        if OGGFile.Track in [1..99] then FileTag[4] := IntToStr(OGGFile.Track);
				FileTag[5] := TextFilter(OGGFile.Date, 0);
				FileTag[6] := TextFilter(OGGFile.Comment, 0);

	      if GuessedEncoder then FileTag[6] := 'Ogg Vorbis';
			end
   	  else if ValidFiles then continue;
    end;

    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), '.' + WAVExt) > 0 then
    begin
    	WAVFile.ReadFromFile(FileList.FileName);
			FileData[1] := WAVFile.FileSize div 1024;

			if WAVFile.Valid then
			begin
				FileData[2] := Round(WAVFile.Duration);
				FileData[3] := WAVFile.SampleRate div 10;
        if WAVFile.ChannelNumber = 1 then FileData[4] := 4;
        if WAVFile.ChannelNumber = 2 then FileData[4] := 1;
				FileData[5] := 9;
				FileData[6] := WAVFile.BitsPerSample;

	      if GuessedEncoder then FileTag[6] := WAVFile.Format;
			end
   	  else if ValidFiles then continue;
    end;

    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), MonkeyMask) > 0 then
    begin
    	Monkey.ReadFromFile(FileList.FileName);
			FileData[1] := Monkey.FileLength div 1024;

			if Monkey.Valid then
			begin
				FileData[2] := Round(Monkey.Duration);
				FileData[3] := Monkey.Header.SampleRate div 10;
        if Monkey.Header.Channels = 1 then FileData[4] := 4;
        if Monkey.Header.Channels = 2 then FileData[4] := 1;
				FileData[5] := 30;
				FileData[6] := Monkey.Bits;

				if (Monkey.ID3v1.Exists) or (Monkey.ID3v2.Exists) then
          FileTag2 := GetFileTag(FileList.FileName, 0, 0);

				if Monkey.APEtag.Exists then
				begin
					FileTag[1] := TextFilter(Monkey.APEtag.Title, 0);
					FileTag[2] := TextFilter(Monkey.APEtag.Artist, 0);
					FileTag[3] := TextFilter(Monkey.APEtag.Album, 0);
					if Monkey.APEtag.Track in [1..99] then FileTag[4] := IntToStr(Monkey.APEtag.Track);
					FileTag[5] := TextFilter(Monkey.APEtag.Year, 0);
					FileTag[6] := TextFilter(Monkey.APEtag.Comment, 0);
				end;

  			for Index2 := 1 to 6 do
          if FileTag[Index2] = '' then FileTag[Index2] := FileTag2[Index2];

	      if GuessedEncoder then FileTag[6] := 'Monkey' + #39 + 's Audio' + #32 + Monkey.Version;
			end
   	  else if ValidFiles then continue;
    end;

    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), FileMask) > 0 then
    begin
			MPEGFile.ReadFromFile(FileList.FileName);
			FileData[1] := MPEGFile.FileLength div 1024;
			if MPEGFile.Valid then
			begin
				FileData[2] := Round(MPEGFile.Duration);
				FileData[3] := MPEGFile.SampleRate div 10;
				FileData[4] := MPEGFile.Frame.ModeID + 1;
        case MPEGFile.Frame.VersionID of
          0: FileData[5] := 3;
          2: FileData[5] := 2;
          3: FileData[5] := 1
          else FileData[5] := 0;
        end;
        case MPEGFile.Frame.LayerID of
          1: FileData[6] := 3;
          2: FileData[6] := 2;
          3: FileData[6] := 1
          else FileData[6] := 0;
        end;

				if MPEGFile.VBR.Found then FileData[2] := -FileData[2];

				if (MPEGFile.ID3v1.Exists) or (MPEGFile.ID3v2.Exists) or (MPEGFile.APEtag.Exists) then
          FileTag := GetFileTag(FileList.FileName, 0, 0);

        if GuessedEncoder then FileTag[6] := MPEGFile.Encoder;
			end
			else if ValidFiles then continue;
    end;

		TagString := #21;
    DataString := '';
		for Index2 := 1 to 6 do
		begin
			DataString := DataString + Chr(Index2) + IntToStr(FileData[Index2]);
			TagString := TagString + FileTag[Index2] + Chr(Index2 + 21);
		end;

    DataString := DataString + #7 + TagString;

		Tree.Items.AddChild(Root, CurrentItem + DataString);

		Inc(Result[1], FileData[1]);
		Inc(Result[2], Abs(FileData[2]));
		Inc(Result[4], 1);
	end;

	FLabel.Caption := FLabel.Hint;
end;

// -----------------------------------------------------------------------------

end.
