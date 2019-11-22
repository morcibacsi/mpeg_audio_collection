;MPEG Audio Collection Installer Script

!define MUI_PRODUCT "MPEG Audio Collection" ;Define your own software name here
!define MUI_VERSION "2.92" ;Define your own software version here

!include "MUI.nsh"

;--------------------------------
;Configuration

  ;General
  OutFile "mac292.exe"

  ;Folder selection page
  InstallDir "$PROGRAMFILES\${MUI_PRODUCT}"
  
  ;Remember install folder
  InstallDirRegKey HKCU "Software\${MUI_PRODUCT}" ""
  
  ;$9 is being used to store the Start Menu Folder.
  ;Do not use this variable in your script (or Push/Pop it)!

  ;To change this variable, use MUI_STARTMENUPAGE_VARIABLE.
  ;Have a look at the Readme for info about other options (default folder,
  ;registry).

  ;Remember the Start Menu Folder
  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\${MUI_PRODUCT}" 
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"

  !define TEMP $R0
  
;--------------------------------
;Modern UI Configuration

  !define MUI_LICENSEPAGE
;  !define MUI_COMPONENTSPAGE
  !define MUI_DIRECTORYPAGE
  !define MUI_STARTMENUPAGE
  
  !define MUI_ABORTWARNING
  
  !define MUI_UNINSTALLER
  !define MUI_UNCONFIRMPAGE
  
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"
  
;--------------------------------
;Language Strings

  ;Description
  LangString DESC_SecCopyUI ${LANG_ENGLISH} "Will install MPEG Audio Collection 2.92"

;--------------------------------
;Data
  
  LicenseData "license.txt"

;--------------------------------
;Installer Sections

Section "MPEG Audio Collection" SecCopyUI

  ;ADD YOUR OWN STUFF HERE!

  SetOutPath "$INSTDIR\Doc"
  File "Doc\col.html"
  File "Doc\download.html"
  File "Doc\faq.html"
  File "Doc\index.html"
  File "Doc\links.html"
  File "Doc\mac.html"
  File "Doc\mac_cdcover.png"
  File "Doc\mac_cdcover-tn.png"
  File "Doc\mac_main.png"
  File "Doc\mac_main-tn.png"
  File "Doc\mac_report.png"
  File "Doc\mac_report-tn.png"
  File "Doc\mac_search.png"
  File "Doc\mac_search-tn.png"
  File "Doc\mac_statistics.png"
  File "Doc\mac_statistics-tn.png"
  File "Doc\mac_tagger.png"
  File "Doc\mac_tagger-tn.png"
  File "Doc\main.css"
  File "Doc\menu.css"
  File "Doc\menu.html"
  File "Doc\news.html"
  File "Doc\other.html"
  File "Doc\pad_file.xml"
  File "Doc\sc_cdcover.html"
  File "Doc\sc_report.html"
  File "Doc\sc_search.html"
  File "Doc\sc_statistics.html"
  File "Doc\sc_tagger.html"
  File "Doc\screenshots.html"
  File "Doc\translation.html"

  SetOutPath "$INSTDIR\Language"
  File "Language\afrikaans.lng"
  File "Language\arabic.lng"
  File "Language\bulgarian.lng"
  File "Language\catalan.lng"
  File "Language\croatian.lng"
  File "Language\czech.lng"
  File "Language\danish.lng"
  File "Language\dutch.lng"
  File "Language\english.lng"
  File "Language\estonian.lng"
  File "Language\finnish.lng"
  File "Language\french.lng"
  File "Language\galician.lng"
  File "Language\german.lng"
  File "Language\german_swiss.lng"
  File "Language\greek.lng"
  File "Language\hungarian.lng"
  File "Language\chinese_simplified.lng"
  File "Language\chinese_traditional.lng"
  File "Language\italian.lng"
  File "Language\latvian.lng"
  File "Language\lithuanian.lng"
  File "Language\norwegian.lng"
  File "Language\polish.lng"
  File "Language\polish_ascii.lng"
  File "Language\portuguese.lng"
  File "Language\romanian.lng"
  File "Language\russian.lng"
  File "Language\serbian.lng"
  File "Language\slovak.lng"
  File "Language\slovenian.lng"
  File "Language\spanish.lng"
  File "Language\swedish.lng"
  File "Language\thai.lng"
  File "Language\turkish.lng"
  File "Language\ukrainian.lng"

  SetOutPath "$INSTDIR"
  File "copying.txt"
  File "history.txt"
  File "info.txt"
  File "license.txt"
  File "mac.cnt"
  File "mac.exe"
  File "mac.hlp"
  File "todo_translate.txt"

  ;Store install folder
  WriteRegStr HKCU "Software\${MUI_PRODUCT}" "" $INSTDIR

  ;Register col files
  WriteRegStr HKCR ".col" "" "MPEG Audio Collection"
  WriteRegStr HKCR "MPEG Audio Collection" "" "MPEG Audio Collection File"
  WriteRegStr HKCR "MPEG Audio Collection\DefaultIcon" "" "$INSTDIR\mac.exe"
  WriteRegStr HKCR "MPEG Audio Collection\Shell\Open\Command" "" "$\"$INSTDIR\mac.exe$\" $\"%1$\""
  
  !insertmacro MUI_STARTMENU_WRITE_BEGIN
    
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\${MUI_STARTMENUPAGE_VARIABLE}"
    CreateShortCut "$SMPROGRAMS\${MUI_STARTMENUPAGE_VARIABLE}\MPEG Audio Collection.lnk" "$INSTDIR\mac.exe"
    CreateShortCut "$SMPROGRAMS\${MUI_STARTMENUPAGE_VARIABLE}\MAC Help.lnk" "$INSTDIR\mac.hlp"
    CreateShortCut "$SMPROGRAMS\${MUI_STARTMENUPAGE_VARIABLE}\History.lnk" "$INSTDIR\history.txt"
    CreateShortCut "$SMPROGRAMS\${MUI_STARTMENUPAGE_VARIABLE}\MAC WebPage (Browse Offline).lnk" "$INSTDIR\Doc\index.html"
    CreateShortCut "$SMPROGRAMS\${MUI_STARTMENUPAGE_VARIABLE}\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
  
  !insertmacro MUI_STARTMENU_WRITE_END
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

;Display the Finish header
;Insert this macro after the sections if you are not using a finish page
!insertmacro MUI_SECTIONS_FINISHHEADER

;--------------------------------
;Descriptions

!insertmacro MUI_FUNCTIONS_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SecCopyUI} $(DESC_SecCopyUI)
!insertmacro MUI_FUNCTIONS_DESCRIPTION_END
 
;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN STUFF HERE!

  Delete "$INSTDIR\Doc\col.html"
  Delete "$INSTDIR\Doc\download.html"
  Delete "$INSTDIR\Doc\faq.html"
  Delete "$INSTDIR\Doc\index.html"
  Delete "$INSTDIR\Doc\links.html"
  Delete "$INSTDIR\Doc\mac.html"
  Delete "$INSTDIR\Doc\mac_cdcover.png"
  Delete "$INSTDIR\Doc\mac_cdcover-tn.png"
  Delete "$INSTDIR\Doc\mac_main.png"
  Delete "$INSTDIR\Doc\mac_main-tn.png"
  Delete "$INSTDIR\Doc\mac_report.png"
  Delete "$INSTDIR\Doc\mac_report-tn.png"
  Delete "$INSTDIR\Doc\mac_search.png"
  Delete "$INSTDIR\Doc\mac_search-tn.png"
  Delete "$INSTDIR\Doc\mac_statistics.png"
  Delete "$INSTDIR\Doc\mac_statistics-tn.png"
  Delete "$INSTDIR\Doc\mac_tagger.png"
  Delete "$INSTDIR\Doc\mac_tagger-tn.png"
  Delete "$INSTDIR\Doc\main.css"
  Delete "$INSTDIR\Doc\menu.css"
  Delete "$INSTDIR\Doc\menu.html"
  Delete "$INSTDIR\Doc\news.html"
  Delete "$INSTDIR\Doc\other.html"
  Delete "$INSTDIR\Doc\pad_file.xml"
  Delete "$INSTDIR\Doc\sc_cdcover.html"
  Delete "$INSTDIR\Doc\sc_report.html"
  Delete "$INSTDIR\Doc\sc_search.html"
  Delete "$INSTDIR\Doc\sc_statistics.html"
  Delete "$INSTDIR\Doc\sc_tagger.html"
  Delete "$INSTDIR\Doc\screenshots.html"
  Delete "$INSTDIR\Doc\translation.html"

  Delete "$INSTDIR\Language\afrikaans.lng"
  Delete "$INSTDIR\Language\arabic.lng"
  Delete "$INSTDIR\Language\bulgarian.lng"
  Delete "$INSTDIR\Language\catalan.lng"
  Delete "$INSTDIR\Language\croatian.lng"
  Delete "$INSTDIR\Language\czech.lng"
  Delete "$INSTDIR\Language\danish.lng"
  Delete "$INSTDIR\Language\dutch.lng"
  Delete "$INSTDIR\Language\english.lng"
  Delete "$INSTDIR\Language\estonian.lng"
  Delete "$INSTDIR\Language\finnish.lng"
  Delete "$INSTDIR\Language\french.lng"
  Delete "$INSTDIR\Language\galician.lng"
  Delete "$INSTDIR\Language\german.lng"
  Delete "$INSTDIR\Language\german_swiss.lng"
  Delete "$INSTDIR\Language\greek.lng"
  Delete "$INSTDIR\Language\hungarian.lng"
  Delete "$INSTDIR\Language\chinese_simplified.lng"
  Delete "$INSTDIR\Language\chinese_traditional.lng"
  Delete "$INSTDIR\Language\italian.lng"
  Delete "$INSTDIR\Language\latvian.lng"
  Delete "$INSTDIR\Language\lithuanian.lng"
  Delete "$INSTDIR\Language\norwegian.lng"
  Delete "$INSTDIR\Language\polish.lng"
  Delete "$INSTDIR\Language\polish_ascii.lng"
  Delete "$INSTDIR\Language\portuguese.lng"
  Delete "$INSTDIR\Language\romanian.lng"
  Delete "$INSTDIR\Language\russian.lng"
  Delete "$INSTDIR\Language\serbian.lng"
  Delete "$INSTDIR\Language\slovak.lng"
  Delete "$INSTDIR\Language\slovenian.lng"
  Delete "$INSTDIR\Language\spanish.lng"
  Delete "$INSTDIR\Language\swedish.lng"
  Delete "$INSTDIR\Language\thai.lng"
  Delete "$INSTDIR\Language\turkish.lng"
  Delete "$INSTDIR\Language\ukrainian.lng"

  Delete "$INSTDIR\copying.txt"
  Delete "$INSTDIR\history.txt"
  Delete "$INSTDIR\info.txt"
  Delete "$INSTDIR\license.txt"
  Delete "$INSTDIR\mac.cnt"
  Delete "$INSTDIR\mac.exe"
  Delete "$INSTDIR\mac.hlp"
  Delete "$INSTDIR\todo_translate.txt"

  Delete "$INSTDIR\Uninstall.exe"
  
  ;Remove shortcut
  ReadRegStr ${TEMP} "${MUI_STARTMENUPAGE_REGISTRY_ROOT}" "${MUI_STARTMENUPAGE_REGISTRY_KEY}" "${MUI_STARTMENUPAGE_REGISTRY_VALUENAME}"
  
  StrCmp ${TEMP} "" noshortcuts
  
    Delete "$SMPROGRAMS\${TEMP}\MPEG Audio Collection.lnk"
    Delete "$SMPROGRAMS\${TEMP}\MAC Help.lnk"
    Delete "$SMPROGRAMS\${TEMP}\History.lnk"
    Delete "$SMPROGRAMS\${TEMP}\MAC WebPage (Browse Offline).lnk"
    Delete "$SMPROGRAMS\${TEMP}\Uninstall.lnk"
    RMDir "$SMPROGRAMS\${TEMP}" ;Only if empty, so it won't delete other shortcuts
    
  noshortcuts:

  RMDir "$INSTDIR\Doc"
  RMDir "$INSTDIR\Language"
  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\${MUI_PRODUCT}"
  DeleteRegKey HKCR ".col"
  DeleteRegKey HKCR "MPEG Audio Collection"

  ;Display the Finish header
  !insertmacro MUI_UNFINISHHEADER

SectionEnd