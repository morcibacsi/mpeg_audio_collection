unit WAVPackFile;

interface

uses
	Classes, SysUtils, ID3v1, ID3v2, APEtag;

type
	{ Class TWAVPackfile }
  	TWAVPackfile = class(TObject)
   private
      { Private declarations }

   	FFileSize  		: int64;
		FValid     		: boolean;
		FFormatTag 		: integer;
      FVersion       : integer;
		FChannels  		: integer;
		FSampleRate		: integer;
		FBits      		: integer;
		FBitrate  		: double;
		FDuration		: double;

      FID3v1         : TID3v1;
      FID3v2         : TID3v2;
      FAPEtag        : TAPEtag;

      procedure FResetData;

   public
      { Public declarations }
      constructor Create;                                     { Create object }
      destructor Destroy; override;                          { Destroy object }

      function ReadFromFile(const FileName: string): Boolean;   { Load header }
      
      property FileSize 	: int64		read FFileSize;
		property Valid     	: boolean	read FValid;
		property FormatTag 	: integer	read FFormatTag;
      property Version     : integer   read FVersion;
		property Channels  	: integer	read FChannels;
		property SampleRate	: integer	read FSamplerate;
		property Bits      	: integer	read FBits;
		property Bitrate  	: double		read FBitrate;
		property Duration		: double		read FDuration;

      property ID3v1: TID3v1 read FID3v1;                    { ID3v1 tag data }
      property ID3v2: TID3v2 read FID3v2;                    { ID3v2 tag data }
      property APEtag: TAPEtag read FAPEtag;                   { APE tag data }
	end;

implementation

type
   
	// Used only when loading data from disk

	wavpack_header = packed record
		ckID : array[0..3] of char;
		ckSize : longword;
		version : word;
		bits    : word  ;
		flags: word;
		shift: word;
		total_samples : longword;
		crc    : longword;
		crc2   : longword;
		extension : array[0..3] of char;
		extra_bc : byte;
		extras   : array[0..2] of char;
	end;

	fmt_chunk = packed record
		wformattag       : word;
		wchannels        : word;
		dwsamplespersec  : longword;
		dwavgbytespersec : longword;
		wblockalign      : word;
		wbitspersample   : word;
	end;
	
	riff_chunk = packed record
		id   : array[0..3] of char;
		size : longword;
	end;


{ ********************** Private functions & procedures ********************* }

procedure TWAVPackfile.FResetData;
begin
	{ Reset all data }
	FFileSize  		:= 0;
	FValid     		:= false;
	FFormatTag 		:= 0;
	FChannels  		:= 0;
	FSampleRate		:= 0;
	FBits      		:= 0;
	FBitrate  		:= 0;
	FDuration		:= 0;
   FID3v1.ResetData;
   FID3v2.ResetData;
   FAPEtag.ResetData;
end;


{ ********************** Public functions & procedures ********************** }

constructor TWAVPackfile.Create;
begin
	{ Create object }
	inherited;
   FID3v1   := TID3v1.Create;
   FID3v2   := TID3v2.Create;
   FAPEtag  := TAPEtag.Create;
	FResetData;
end;

destructor TWAVPackfile.Destroy;
begin
  FID3v1.Free;
  FID3v2.Free;
  FAPEtag.Free;
  inherited;
end;
{ --------------------------------------------------------------------------- }

function TWAVPackfile.ReadFromFile(const FileName: string): Boolean; 
var
   f					: TFileStream;
   bytesread 		: int64;
   wavchunk  		: array[0..3] of char;
   chunk 			: riff_chunk;
   fmt   			: fmt_chunk;
   hasfmt 			: boolean;
   temp 				: int64;
   fpos 				: int64;
   wvh 				: wavpack_header;
   TagSize        : int64;
begin
   // load tags first
   FID3v2.ReadFromFile(FileName);
   FID3v1.ReadFromFile(FileName);
   FAPEtag.ReadFromFile(FileName);
   // calulate total tag size
   TagSize := 0;
   if FID3v1.Exists then inc(TagSize,128);
   if FID3v2.Exists then inc(TagSize, FID3v2.Size);
   if FAPEtag.Exists then inc(TagSize, FAPETag.Size);
   // begin reading data from file
   hasfmt := false;
   f:=nil;
   try
      try
         f := TFileStream.create(FileName, fmOpenRead or fmShareDenyNone);
         // seek past id3v2-tag
         if FID3v2.Exists then begin
            f.Seek(FID3v2.Size, soFromBeginning);
         end;

         // start reading RIFF data
			if (f.Read(chunk, sizeof(chunk))=sizeof(chunk)) and (StrLComp(chunk.id, 'RIFF',4)=0) then begin
				if (f.Read(wavchunk, sizeof(wavchunk))=sizeof(wavchunk)) and (StrLComp(wavchunk,'WAVE',4)=0) then begin
					
					// start looking for chunks 
				 	fillchar(chunk,sizeof(chunk),0);
				 	while (f.Position < f.Size) do begin
				   	bytesread := f.read(chunk, sizeof(chunk));
				    	if chunk.size = 0 then break;
				      fpos := f.Position;
				      if bytesread=sizeof(chunk) then begin
	               	if ( StrLComp(chunk.id, 'fmt ', 4) = 0) then begin
	                  	// Format chunk found
	               		if ( chunk.size >= sizeof(fmt) ) then begin
	                        if ( f.Read(fmt, sizeof(fmt)) = sizeof(fmt) ) then begin
										hasfmt 		:= true;
										FFileSize  	:= f.Size;
										FValid     	:= true;
										FFormatTag 	:= fmt.wformattag;
										FChannels  	:= fmt.wchannels;
										FSampleRate	:= fmt.dwsamplespersec;
										FBits      	:= fmt.wbitspersample;
										FBitrate  	:= fmt.dwavgbytespersec / 125.0; // 125 = 1/8*1000

	                       	end else break;
	                     end;
	                  end else if ( strLcomp(chunk.id, 'data',4)=0 ) and(hasfmt) then begin

                        fillchar(wvh, sizeof(wvh) ,0);
                        f.Read(wvh, sizeof(wvh) );
                       	// check for wavpack header
                        if( StrLComp(wvh.ckID, 'wvpk', 4) = 0) then begin
                           (* wavpack header found *)
									FValid		:= TRUE;
                           FVersion 	:= wvh.version;
                           FChannels 	:= 2 - (wvh.flags and 1);  // mono flag

                           if FSampleRate>0 then begin
                              FDuration := wvh.total_samples / FSampleRate;
	                           if FDuration>0 then begin
	                           	FBitrate := 8.0*(FFileSize  - int64( TagSize )  - int64(wvh.ckSize))/(FDuration*1000.0)
										end;
	                        end;
	                        
                     	end else begin
									// not wavpack, but maybe some other WAV format
                     	   if chunk.size>f.Size-f.Position then temp := f.Size-f.Position else temp := chunk.size;
	                        if (temp>0) and (fmt.dwavgbytespersec>0) then begin
	                           FDuration  := temp / fmt.dwavgbytespersec;
	                        end;
	                     end;
	                     break;
	                  end;
	                  f.seek(fpos+chunk.size, soFromBeginning);
	               end else break;
	            end; // while
	         end;
	      end;
   	finally
      	f.free;
   	end;
 	except
	end;
end;


end.
