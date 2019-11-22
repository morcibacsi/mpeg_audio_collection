unit ScanThread;

interface

uses
	Monkey, WAVfile, OggVorbis, TwinVQ, MPEGplus, ID3v2, MPEGaudio, WMAfile, WavPackfile,
  FlacFile, OptimFROG, AACfile, Global, Classes, StdCtrls,ComCtrls, SysUtils,
  Masks;

type
   TScanThread = class(TThread)
	private
		SourcePath: string;
		UpdatedNode: TTreeNode;
		UpdateInfo: boolean;
		SourceLabel: string;
		SourceSerial: longint;
    SourceType: Integer;
		VLabel, DLabel, FLabel: TLabel;
		MPEGFile: TMPEGaudio;
    MPPFile: TMPEGplus;
    VQFFile: TTwinVQ;
    WMAFile: TWMAfile;
    OGGFile: TOggVorbis;
    WAVFile: TWAVfile;
    FlacFile: TFLACFile;
    OfrFile: TOptimFROG;
    AACfile: TAACfile;
    Monkey: TMonkey;
    ID3v2: TID3v2;
    WAVPackFile: TWAVPackFile;
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


  if AllFiles then
    FileList.Mask := '*.*'
  else
	  FileList.Mask := SupportedExtension;

	MPEGFile := TMPEGaudio.Create;
  MPPFile := TMPEGplus.Create;
  VQFFile := TTwinVQ.Create;
  WMAFile := TWMAfile.Create;
  OGGFile := TOggVorbis.Create;
  WAVFile := TWAVfile.Create;
  FlacFile := TFlacFile.Create;
  AACfile := TAACfile.Create;
  Monkey := TMonkey.Create;
  OfrFile := TOptimFROG.Create;
  ID3v2 := TID3v2.Create;
  WAVPackFile := TWAVPackFile.Create;

	inherited Create(false);
end;

// -----------------------------------------------------------------------------

procedure TScanThread.Execute;
var
	Index: longint;
	VolumeNode: TTreeNode;
begin
	if not VolumeDataOK(SourcePath[1], SourceLabel, SourceSerial, SourceType) then exit;

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
  FlacFile.Free;
  AACfile.Free;
  VQFFile.Free;
  WMAFile.Free;
  OGGFile.Free;
  WAVFile.Free;
  ID3v2.Free;
  Monkey.Free;
  WavPackfile.Free;

  if Terminated then exit;

	if VolumeData[4] > 0 then
	begin
		VolumeData[5] := Trunc(Date);
		VolumeData[6] := SourceSerial;
    VolumeData[7] := SourceType;

		for Index := 1 to 7 do
			VolumeNode.Text := VolumeNode.Text + Chr(Index) + IntToStr(VolumeData[Index]);
    // saves the volume info and adds the end symbol
		VolumeNode.Text := VolumeNode.Text + #8;

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
  FileUnknown: file of Byte;
  SizeUnknown: Longint;
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

    // File size for non-audio files
    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), SupportedExtension) = 0 then
    begin
      AssignFile(FileUnknown, FileList.FileName);
      // set's read-only access
      FileMode := 0;
      Reset(FileUnknown);
      try
        SizeUnknown := FileSize(FileUnknown);
      finally
        CloseFile(FileUnknown);
      end;
      FileData[1] := SizeUnknown div 1024;
    end;

    if FlacMaskObj.Matches(FileList.FileName) then
    begin
      FlacFile.ReadFromFile(FileList.FileName);
      FileData[1] := FlacFile.FileLength div 1024;
      if FlacFile.Valid then
      begin
        FileData[2] := -Round(FlacFile.Duration); //Always variable bitrate
        FileData[3] := FlacFile.SampleRate div 10;
        if FlacFile.Channels = 1 then FileData[4] := 4;
        if FlacFile.Channels = 2 then FileData[4] := 1;
        FileData[5] := 35;
        FileData[6] := FlacFile.BitsPerSample;

        if FlacFile.VorbisComment.Valid then
        begin
          FileTag[1] := TextFilter(FlacFile.VorbisComment.Value['Title'], 0);
					FileTag[2] := TextFilter(FlacFile.VorbisComment.Value['Artist'], 0);
					FileTag[3] := TextFilter(FlacFile.VorbisComment.Value['Album'], 0);
					FileTag[4] := TextFilter(FlacFile.VorbisComment.Value['Track'], 0);
					FileTag[5] := TextFilter(FlacFile.VorbisComment.Value['Date'], 0);
					FileTag[6] := TextFilter(FlacFile.VorbisComment.Value['Comment'], 0);
        end;

        if GuessedEncoder then begin
            if FlacFile.VorbisComment.Vendor <> '' then
               FileTag[6] := FlacFile.VorbisComment.Vendor
            else
               FileTag[6] := 'FLAC';
        end;
      end
      else if ValidFiles then continue;
    end;


    if AacMaskObj.Matches(FileList.FileName) then
    begin
			AacFile.ReadFromFile(FileList.FileName);
			FileData[1] := AacFile.FileSize div 1024;
			if AacFile.Valid then
			begin
				FileData[2] := Round(AacFile.Duration);
				FileData[3] := AacFile.SampleRate div 10;
        if AacFile.Channels = 1 then FileData[4] := 4;
        if AacFile.Channels = 2 then FileData[4] := 1;
        FileData[5] := 45;
        FileData[6] := 45;

				if AacFile.BitRateTypeID <> AAC_BITRATE_TYPE_CBR then FileData[2] := -FileData[2];

				if (AacFile.ID3v1.Exists) or (AacFile.ID3v2.Exists) or (AacFile.APEtag.Exists) then
          FileTag := GetFileTag(FileList.FileName, 0, 0);

        if GuessedEncoder then
          if AACfile.MPEGVersionID = AAC_MPEG_VERSION_UNKNOWN then
            FileTag[6] := AACfile.Profile
          else
            FileTag[6] := AACfile.MPEGVersion + ' ' + AACfile.Profile;
			end
			else if ValidFiles then continue;
    end;


    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), MPPFileMask) > 0 then
    begin
      MPPFile.ReadFromFile(FileList.FileName);
			FileData[1] := MPPFile.FileSize div 1024;

			if not MPPFile.Corrupted then
			begin
				FileData[2] := -Round(MPPFile.Duration);
				FileData[3] := MPPFile.SampleRate div 10;
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

	      if GuessedEncoder then FileTag[6] := MPPFile.Encoder;
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

	      if GuessedEncoder then FileTag[6] := OGGFile.Vendor; //'Ogg Vorbis';
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

    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), '.' + WAVPackExt) > 0 then
    begin
    	WAVPackFile.ReadFromFile(FileList.FileName);
			FileData[1] := WAVPackFile.FileSize div 1024;

			if WAVPackFile.Valid then
			begin
				FileData[2] := -Round(WAVPackFile.Duration); // always variable bitrate
				FileData[3] := WAVPackFile.SampleRate div 10;
            if WAVPackFile.Channels = 1 then FileData[4] := 4;
            if WAVPackFile.Channels = 2 then FileData[4] := 1;
				FileData[5] := 50;
				FileData[6] := WAVPackFile.Bits;

      		if (WAVPackFile.ID3v1.Exists) or (WAVPackFile.ID3v2.Exists) then
               FileTag2 := GetFileTag(FileList.FileName, 0, 0);

				if WAVPackFile.APEtag.Exists then
				begin
					FileTag[1] := TextFilter(WAVPackFile.APEtag.Title, 0);
					FileTag[2] := TextFilter(WAVPackFile.APEtag.Artist, 0);
					FileTag[3] := TextFilter(WAVPackFile.APEtag.Album, 0);
					if MPPFile.APEtag.Track in [1..99] then FileTag[4] := IntToStr(WAVPackFile.APEtag.Track);
					FileTag[5] := TextFilter(WAVPackFile.APEtag.Year, 0);
					FileTag[6] := TextFilter(WAVPackFile.APEtag.Comment, 0);
				end;

  			   for Index2 := 1 to 6 do
               if FileTag[Index2] = '' then FileTag[Index2] := FileTag2[Index2];


	      if GuessedEncoder then FileTag[6] := 'WavPack ' + inttostr(WAVPackFile.Version);
			end
   	  else if ValidFiles then continue;
    end;

    if OfrMaskObj.Matches(FileList.FileName) then
    begin
    	OfrFile.ReadFromFile(FileList.FileName);
			FileData[1] := OfrFile.FileLength div 1024;

			if OfrFile.Valid then
			begin
				FileData[2] := -Round(OfrFile.Duration);
				FileData[3] := OfrFile.SampleRate div 10;
        if OfrFile.Header.ChannelMode = 0 then FileData[4] := 4;
        if OfrFile.Header.ChannelMode = 1 then FileData[4] := 1;
				FileData[5] := 40;
				FileData[6] := Abs(OfrFile.Bits) or OfrFile.Header.CompressionID shl 8;

				if (OfrFile.ID3v1.Exists) or (OfrFile.ID3v2.Exists) then
          FileTag2 := GetFileTag(FileList.FileName, 0, 0);

				if OfrFile.APEtag.Exists then
				begin
					FileTag[1] := TextFilter(OfrFile.APEtag.Title, 0);
					FileTag[2] := TextFilter(OfrFile.APEtag.Artist, 0);
					FileTag[3] := TextFilter(OfrFile.APEtag.Album, 0);
					if Monkey.APEtag.Track in [1..99] then FileTag[4] :=
            IntToStr(OfrFile.APEtag.Track);
					FileTag[5] := TextFilter(OfrFile.APEtag.Year, 0);
					FileTag[6] := TextFilter(OfrFile.APEtag.Comment, 0);
				end;

  			for Index2 := 1 to 6 do
          if FileTag[Index2] = '' then FileTag[Index2] := FileTag2[Index2];

	      if GuessedEncoder then FileTag[6] := 'OptimFROG ' + OfrFile.Version;
			end
   	  else if ValidFiles then continue;
    end;

    if Pos(LowerCase(ExtractFileExt(FileList.FileName)), MonkeyMask) > 0 then
    begin
    	Monkey.ReadFromFile(FileList.FileName);
			FileData[1] := Monkey.FileLength div 1024;

			if Monkey.Valid then
			begin
				FileData[2] := -Round(Monkey.Duration);
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

    // file info
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
