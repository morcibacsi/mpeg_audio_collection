program MAC;

uses
  Forms,
  Main in 'Units\Main.pas' {frmMain},
  Global in 'Units\Global.pas',
  MessageDialog in 'Units\MessageDialog.pas' {frmMessageDialog},
  WaitWindow in 'Units\WaitWindow.pas' {frmWaitWindow},
  About in 'Units\About.pas' {frmAbout},
  Statistic in 'Units\Statistic.pas' {frmStatistic},
  SourcePath in 'Units\SourcePath.pas' {frmSourcePath},
  ScanDialog in 'Units\ScanDialog.pas' {frmScanDialog},
  ScanThread in 'Units\ScanThread.pas',
  TagEditor in 'Units\TagEditor.pas' {frmTagEditor},
  SelectVolume in 'Units\SelectVolume.pas' {frmSelectVolume},
  Find in 'Units\Find.pas' {frmFind},
  Options in 'Units\Options.pas' {frmOptions},
  ReportDialog in 'Units\ReportDialog.pas' {frmReportDialog},
  ReportProcess in 'Units\ReportProcess.pas' {frmReportProcess},
  ReportThread in 'Units\ReportThread.pas',
  PrintCover in 'Units\PrintCover.pas' {frmPrintCover},
  Stretch in 'Units\Stretch.pas' {frmStretch},
  DuplicatesResults in 'Units\DuplicatesResults.pas' {frmDuplicatesResults},
  NameResults in 'Units\NameResults.pas' {frmNameResults},
  TagResults in 'Units\TagResults.pas' {frmTagResults},
  PropertyResults in 'Units\PropertyResults.pas' {frmPropertyResults},
  ColumnsDialog in 'Units\ColumnsDialog.pas' {frmColumnsDialog},
  RenameLabel in 'Units\RenameLabel.pas' {frmRenameLabel},
  FileInfo in 'Units\FileInfo.pas' {frmFileInfo},
  FolderInfo in 'Units\FolderInfo.pas' {frmFolderInfo},
  FileRenamer in 'Units\FileRenamer.pas' {frmFileRenamer},
  MPEGplus in 'Units\MPEGplus.pas',
  Filter in 'Units\Filter.pas' {frmFilter},
  ProgressWindow in 'Units\ProgressWindow.pas' {frmProgressWindow},
  OggVorbis in 'Units\OggVorbis.pas',
  TwinVQ in 'Units\TwinVQ.pas',
  WAVfile in 'Units\WAVfile.pas',
  Monkey in 'Units\Monkey.pas',
  ID3v1 in 'Units\ID3v1.pas',
  ID3v2 in 'Units\ID3v2.pas',
  MPEGaudio in 'Units\MPEGaudio.pas',
  APEtag in 'Units\APEtag.pas',
  WMAfile in 'Units\WMAfile.pas',
  AACfile in 'Units\AACfile.pas',
  CDAtrack in 'Units\CDAtrack.pas',
  FLACfile in 'Units\FLACfile.pas',
  VorbisComment in 'Units\VorbisComment.pas',
  WideStrings in 'Units\WideStrings.pas',
  OptimFROG in 'Units\OptimFROG.pas';

{$R *.RES}
{$R Units\XPThemes.res}

begin
  Application.Initialize;
  Application.Title := '';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
