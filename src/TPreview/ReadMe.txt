TPrintPreview v3.01 for all versions of Delphi
----------------------------------------------

Author: Kambiz R. Khojasteh
e-mail: khojasteh@mail.com
http://www.crosswinds.net/~khojasteh/
   
Special thanks to:
  
  Rinaldo Andrea (Italy)  <laser@nuovacs.it>                               
  Jens Christian Fogtmann <jefo@post2.tele.dk>                             
  Damian Tarnawsky        <tarnawsky@ali.com.au>
  Bill Miller             <w2m@netheaven.com>
  Peter Hedlund           <peter@peterandlinda.com>                        
  Pavel Zidek (Czech)     <delphi@kopr.cz>                                 

Last modified: April 26, 2001



D E S C R I P T I O N
---------------------

TPrintPreview is a decendent of TScrollBox. Drop it on your form and 
instead of using Printer object use PrintPreview. To send the result to
the printer just call Print method of TPrintPreview. 



C H A N G E S   I N   T H I S   R E L E A S E
---------------------------------------------

* New property ZoomSavePos added to 32bit version. Thanks to Pavel Zidek 
  for adding this property.


K N O W N   B U G S 
-------------------

* When you use a paper size with width or height larger than 32767 units, 
  the page will not display correctly. SetWindowExtEx expects two bytes 
  signed integers (Smallint) as its X and Y parameter, so values larger 
  than 32767 will interpreted as negative values. If you do not set Units 
  property to mmHiMetric, all predefined paper types will fit within the 
  correct range.



K E Y   P R O P E R T I E S   (in addition to TScrollBox)
---------------------------------------------------------

* Aborted: Boolean (ReadOnly)
  If sets to True, an user abort occurred.

* Canvas: TCanvas (ReadOnly)
  The PrintPreview canvas

* CurrentPage: Integer
  Determines the current visible page

* FastDraw: Boolean
  Determines the control uses which method for draw the page on the control. 
  If you discover that your used font in the printed pages are displaying 
  improperly, change this property to False, otherwise leave it as default
  value for faster scrolling.

* FastPrint: Boolean
  Determines the control uses which method for sending pages to the printer. 
  If pages contain image, set FastPrint to false to ensure the images will 
  be printed with the best possible quality on most printers, otherwise set
  FastPrint to True for fastest printing speed.

* MarginLeft: Integer
  Determines the left margin of paper in logical unit.

* MarginTop: Integer
  Determines the top margin of paper in logical unit.

* MarginRight: Integer
  Determines the Right margin of paper in logical unit.

* MarginBottom: Integer
  Determines the bottom margin of paper in logical unit.

* Orientation: TPrinterOrientation
  TPrinterOrientation = (poPortrait, poLanscape)
  Determines the paper orientation

* PageRect: TRect (ReadOnly)
  Determines the page boundary in logical unit and according to page margins.

* PageHeight: Integer (ReadOnly)
  Determines the available vertical size of page in logical unit and according 
  to page margins.

* PageWidth: Integer (ReadOnly)
  Determines the available horizontal size of page in logical unit and according 
  to page margins.
  
* Pages[PageNo: Integer]: TMetaFile (ReadOnly)
  This property provides an access to printered pages

* PaperType: TPaperType;
  Determines the paper size. There are 68 predefined sizes but by setting this 
  property to pCustom you can use PaperWidth and PaperHeight properties to
  set your custom paper size.
  
* PaperWidth: Integer
  Determines physical width of paper in logical unit. Chaning this peoperty will
  set PaperType to pCustom. PaperWidth must be an integer number between 1 and 32767.

* PaperHeight: Integer
  Determines physical height of paper in logical unit. Chaning this peoperty will
  set PaperType to pCustom. PaperWidth must be an integer number between 1 and 32767.

* PrinterInstalled: Boolean (Readonly)
  Determines whether any printer installed on the system.

* PrintJobTitle: String
  Determines title of document

* State: TPreviewState (ReadOnly)
  TPreviewState = (psReady, psCreating, psPrinting);
  Determines the state of component

* TotalPages: Integer (ReadOnly)
  Determines the number of available pages

* Units: TUnits
  TUnits = (mmPixel, mmLoMetric, mmHiMetric, mmLoEnglish, mmHiEnglish, mmTWIPS)
  Determines the mapping mode of canvas. By changing of this property all
  measurement values change to new logical unit (for example: PageRect, Margins,
  Font.Size, Canvas.Pen.Size, ...).

* ZoomState: TSoomState
  TZoomState = (zsZoomOther, zsZoomToWidth, zsZoomToHeight, zsZoomToFit)
  Determines the state of zoom. If sets to zsZoomOther, PrintPreview use Zoom property.

* Zoom: Integer
  Determines the zoom factor of PrintPreview in  precent. If sets the ZoomState will
  change to zsZoomOther.

* ZoomSavePos: Boolean (32bit only)
  Determines whether the control keeps the old scroll positions when zoom is changed.

* UseTempFile: Boolean
  Determines whether TPrintPreview use temporary file for printed pages. If number of
  pages can be more than 500 pages, setting this property to true is recommended.



K E Y   E V E N T S   (in addition to TScrollBox)
-------------------------------------------------

* OnBeginDoc: TNotifyEvent
  This event is triggered just after BeginDoc method called.

* OnEndDoc: TNotifyEvent
  This event is triggered just after EndDoc method called.

* OnNewPage: TNotifyEvent
  This event will trigger on every new page creation.

* OnAbort: TNotifyEvent
  This event will trigger when user abort the PrintPreview operation.

* OnChange: TNotifyEvent
  Every change to PrintPreview trigger this event (for example: change to
  CurrentPage, adding new page, ...)

* OnBeforePrint: TNotifyEvent
  This event is triggered just after Print method called.

* OnAfterPrint: TNotifyEvent
  This event is triggered just after printing of pages on the Printer
  object compeleted.

* OnPrintProgres: TPreviewPrintProgress
  TPreviewPrintProgress = procedure(Sender: TObject; PageNum, Progress:
  Integer; var AbortIt: Boolean) of object;
  This event will trigger on printing of pages on the Printer object.
  Set the AbortIt to True, if you want abort the printing.



K E Y   M E T H O D S   (in addition to TScrollBox)
---------------------------------------------------

* procedure BeginDoc;
  Initiates a new job and create preview canvas.

* procedure EndDoc;
  Terminates the current job.

* procedure NewPage;
  Starts a new page.

* procedure Clear;
  Clears all pages and reset PrintPreview.

* procedure Abort;
  Aborts creating or printing of pages.

* procedure Print;
  Print all available pages to Printer object.

* procedure PrintPages(StartPage, StopPage: Integer);
  Print specified range of pages to Printer object.

* procedure LoadFromFile(const FileName: String);
  Loades pages from a previously saved file.

* procedure SaveToFile(const FileName: String);
  Saves pages into the file.

* procedure UpdateZoom;
  Forces PrintPreview to update its display.

* function ConvertUnit(Value: Integer; FromUnit, ToUnit: TUnits): Integer;
  Converts value from one measurement unit to another unit.

* function ToPrinterUnit(Value, resolution: Integer): Integer;
  Converts pixels in the given resolution to TPrintPreview measurment unit.

* function Screen2PrinterUnit(Value: Integer): Integer;
  Converts pixels in screen resolution to TPrintPreview measurment unit.

* procedure PaintGraphic(X, Y: Integer; Graphic: TGraphic);
  Draws the Graphic on the preview canvas at X and Y position independent of
  current value of Units property and printer resolution.

* procedure PaintWinControl(X, Y: Integer; WinControl: TWinControl);
  Draws a windowed control on the preview canvas at X and Y position independent of
  current value of Units property and printer resolution. This procedure does not 
  exist on TPrintPreview for Delphi 1.


D I S C L A I M E R
-------------------

TPrintPreview is freeware. You may copy component's files AS LONG AS YOU COPY ALL 
OF THEM. If you want to change the source code in order to improve the component's 
features, performance, etc. please send me the new source code so that I can have 
a look at it. The changed source code should contain descriptions what you have 
changed, and of course your name. The only thing you MAY NOT CHANGE is the ORIGINAL
COPYRIGHT INFORMATION. 

The author is NOT liable for any DAMAGES resulting from the use and misuse of the 
component, especially he is NOT liable for DAMAGES that were caused BY ANY VERSION 
WHICH HAS NOT BEEN PROGRAMMED BY THE AUTHOR HIMSELF.



Have fun,
Kambiz
