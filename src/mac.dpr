program MAC;

uses
  Fastcode       in 'FastCode\FastCode.pas',                     //PP
  RtlVclOptimize in 'FastCode\RtlVclOptimize.pas',               //PP

  AACfile        in 'ATL\AACfile.pas',
  APEtag         in 'ATL\APEtag.pas',
  CDAtrack       in 'ATL\CDAtrack.pas',
  CommonATL      in 'ATL\CommonATL.pas',
  FLACfile       in 'ATL\FLACfile.pas',
  ID3v1          in 'ATL\ID3v1.pas',
  ID3v2          in 'ATL\ID3v2.pas',
  Monkey         in 'ATL\Monkey.pas',
  MPEGaudio      in 'ATL\MPEGaudio.pas',
  MPEGplus       in 'ATL\MPEGplus.pas',
  OggVorbis      in 'ATL\OggVorbis.pas',
  OptimFROG      in 'ATL\OptimFROG.pas',
  TwinVQ         in 'ATL\TwinVQ.pas',
  VorbisComment  in 'ATL\VorbisComment.pas',
  WAVfile        in 'ATL\WAVfile.pas',
  WAVPackFile    in 'ATL\WAVPackfile.pas',
  WMAfile        in 'ATL\WMAfile.pas',

  Forms,
  About          in 'Units\About.pas'         {frmAbout},
  AspiCD         in 'Units\AspiCD.pas',
  AutoNumber     in 'Units\AutoNumber.pas'    {frmAutoNumber},
  CDROMIOCTL     in 'Units\CDROMIOCTL.PAS',
  ColumnsDialog  in 'Units\ColumnsDialog.pas' {frmColumnsDialog},
  EditOggTag     in 'Units\EditOggTag.pas'    {FormEditOggTag},//PinterPeti
  EditTag        in 'Units\EditTag.pas'       {FormEditTag},   //PinterPeti
  FileInfo       in 'Units\FileInfo.pas'      {frmFileInfo},
  FilenameToTag  in 'Units\FilenameToTag.pas' {frmFilenameToTag},
  FileRenamer    in 'Units\FileRenamer.pas'   {frmFileRenamer},
  Filter         in 'Units\Filter.pas'        {frmFilter},
  Find           in 'Units\Find.pas'          {frmFind},
  FolderInfo     in 'Units\FolderInfo.pas'    {frmFolderInfo},
  Freedb         in 'Units\Freedb.pas'        {frmFreedb},
  Global         in 'Units\Global.pas',
  Main           in 'Units\Main.pas'          {frmMain},
  MessageDialog  in 'Units\MessageDialog.pas' {frmMessageDialog},
  Options        in 'Units\Options.pas'       {frmOptions},
  Helpers        in 'Units\Helpers.pas',                      //PinterPeti
  PrintCover     in 'Units\PrintCover.pas'    {frmPrintCover},
  ProgressWindow in 'Units\ProgressWindow.pas'{frmProgressWindow},
  RemTags        in 'Units\RemTags.pas'       {frmRemTags},
  RenameLabel    in 'Units\RenameLabel.pas'   {frmRenameLabel},
  ReportDialog   in 'Units\ReportDialog.pas'  {frmReportDialog},
  ReportProcess  in 'Units\ReportProcess.pas' {frmReportProcess},
  ReportThread   in 'Units\ReportThread.pas',
  RepTagDialog   in 'Units\RepTagDialog.pas'  {frmReplTag},
  ScanDialog     in 'Units\ScanDialog.pas'    {frmScanDialog},
  ScanThread     in 'Units\ScanThread.pas',
  scsidefs       in 'Units\scsidefs.pas',
  SelectVolume   in 'Units\SelectVolume.pas'  {frmSelectVolume},
  SourcePath     in 'Units\SourcePath.pas'    {frmSourcePath},
  SptiCD         in 'Units\SptiCD.pas',
  Statistic      in 'Units\Statistic.pas'     {frmStatistic},
  Stretch        in 'Units\Stretch.pas'       {frmStretch},
  TagEditor      in 'Units\TagEditor.pas'     {frmTagEditor},
  TagPreview     in 'Units\TagPreview.pas'    {frmPreview},
  WaitWindow     in 'Units\WaitWindow.pas'    {frmWaitWindow},
  wnaspi32       in 'Units\wnaspi32.pas';

//  DuplicatesResults in 'Units\DuplicatesResults.pas' {frmDuplicatesResults} //PinterPeti
//  JclUnicode        in 'Units\JclUnicode.pas',
//  NameResults       in 'Units\NameResults.pas'       {frmNameResults},      //PinterPeti
//  PropertyResults   in 'Units\PropertyResults.pas'   {frmPropertyResults},  //PinterPeti
//  TagResults        in 'Units\TagResults.pas'        {frmTagResults},       //PinterPeti

{$R *.RES}
{$R Units\XPThemes.res}

begin
  Application.Initialize;
  Application.Title := '';
  Application.CreateForm(TfrmMain, frmMain);
//  Application.CreateForm(TfrmFind, frmFind);
//  Application.CreateForm(TFormEditTag, FormEditTag);
//  Application.CreateForm(TFormEditOggTag, FormEditOggTag);
  Application.CreateForm(TfrmPreview, frmPreview);
  Application.CreateForm(TfrmRemTags, frmRemTags);
  Application.CreateForm(TfrmFilenameToTag, frmFilenameToTag);
  Application.CreateForm(TfrmAutoNumber, frmAutoNumber);
  Application.CreateForm(TfrmReplTag, frmReplTag);
  Application.CreateForm(TfrmFreedb, frmFreedb);
  Application.Run;
end.
