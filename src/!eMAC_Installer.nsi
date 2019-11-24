; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "Enhanced MPEG Audio Collection"
!define APPNAMEANDVERSION "Enhanced MPEG Audio Collection 2.92.52 (07. October 2007)"
!define INSTALLEREXENAME "eMAC292(07_10_2007)"

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES\Enhanced MPEG Audio Collection"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile ".\${INSTALLEREXENAME}.exe"

; Use compression
SetCompressor LZMA

; Modern interface settings
!include "MUI.nsh"

!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_RUN "$INSTDIR\Mac.exe"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "Data\History.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Set languages (first is default language)
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Arabic"
!insertmacro MUI_LANGUAGE "Bulgarian"
!insertmacro MUI_LANGUAGE "Catalan"
!insertmacro MUI_LANGUAGE "Croatian"
!insertmacro MUI_LANGUAGE "Czech"
!insertmacro MUI_LANGUAGE "Danish"
!insertmacro MUI_LANGUAGE "Dutch"
!insertmacro MUI_LANGUAGE "Estonian"
!insertmacro MUI_LANGUAGE "Finnish"
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "German"
!insertmacro MUI_LANGUAGE "Greek"
!insertmacro MUI_LANGUAGE "Hungarian"
!insertmacro MUI_LANGUAGE "Italian"
!insertmacro MUI_LANGUAGE "Latvian"
!insertmacro MUI_LANGUAGE "Lithuanian"
!insertmacro MUI_LANGUAGE "Norwegian"
!insertmacro MUI_LANGUAGE "Polish"
!insertmacro MUI_LANGUAGE "Portuguese"
!insertmacro MUI_LANGUAGE "Romanian"
!insertmacro MUI_LANGUAGE "Russian"
!insertmacro MUI_LANGUAGE "Serbian"
;!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "Slovak"
!insertmacro MUI_LANGUAGE "Slovenian"
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "Swedish"
!insertmacro MUI_LANGUAGE "Thai"
;!insertmacro MUI_LANGUAGE "TradChinese"
!insertmacro MUI_LANGUAGE "Turkish"
!insertmacro MUI_LANGUAGE "Ukrainian"
!insertmacro MUI_RESERVEFILE_LANGDLL

Section "Enhanced MPEG Audio Collection" Section1

        ; Set Section properties
        SetOverwrite on

        ; Set Section Files and Shortcuts
        SetOutPath "$INSTDIR\"
        File "Data\Col.html"
        File "Data\Todo_Translate.txt"
        File "Data\Mac.cnt"
        File "Data\Mac.exe"
        File "Data\Mac.hlp"
        File "Data\Copying.txt"
        File "Data\History.txt"
        File "Data\Info.txt"
        File "Data\License.txt"
        SetOutPath "$INSTDIR\Doc\"
        File "Data\Doc\Col.html"
        File "Data\Doc\Download.html"
        File "Data\Doc\Faq.html"
        File "Data\Doc\Index.html"
        File "Data\Doc\Links.html"
        File "Data\Doc\Mac.html"
        File "Data\Doc\Mac_Cdcover-tn.png"
        File "Data\Doc\Mac_Cdcover.png"
        File "Data\Doc\Mac_Main-tn.png"
        File "Data\Doc\Mac_Report-tn.png"
        File "Data\Doc\Mac_Report.png"
        File "Data\Doc\Mac_Search-tn.png"
        File "Data\Doc\Mac_Search.png"
        File "Data\Doc\Mac_Statistics-tn.png"
        File "Data\Doc\Mac_Statistics.png"
        File "Data\Doc\Mac_Tagger-tn.png"
        File "Data\Doc\Mac_Tagger.png"
        File "Data\Doc\Menu.html"
        File "Data\Doc\News.html"
        File "Data\Doc\Other.html"
        File "Data\Doc\Sc_Cdcover.html"
        File "Data\Doc\Sc_Report.html"
        File "Data\Doc\Sc_Search.html"
        File "Data\Doc\Sc_Statistics.html"
        File "Data\Doc\Sc_Tagger.html"
        File "Data\Doc\Screenshots.html"
        File "Data\Doc\Translation.html"
        File "Data\Doc\Mac_Main.png"
        File "Data\Doc\Main.css"
        File "Data\Doc\Menu.css"
        File "Data\Doc\Pad_File.xml"
        SetOutPath "$INSTDIR\Language\"
        File "Data\Language\Afrikaans.lng"
        File "Data\Language\Bulgarian.lng"
        File "Data\Language\German_Swiss.lng"
        File "Data\Language\Hungarian.lng"
        File "Data\Language\Chinese_Simplified.lng"
        File "Data\Language\Chinese_Traditional.lng"
        File "Data\Language\Lithuanian.lng"
        File "Data\Language\Norwegian.lng"
        File "Data\Language\Polish_Ascii.lng"
        File "Data\Language\Portuguese.lng"
        File "Data\Language\Slovenian.lng"
        File "Data\Language\Ukrainian.lng"
        File "Data\Language\Arabic.lng"
        File "Data\Language\Catalan.lng"
        File "Data\Language\Croatian.lng"
        File "Data\Language\Czech.lng"
        File "Data\Language\Danish.lng"
        File "Data\Language\Dutch.lng"
        File "Data\Language\English.lng"
        File "Data\Language\Estonian.lng"
        File "Data\Language\Finnish.lng"
        File "Data\Language\French.lng"
        File "Data\Language\Galician.lng"
        File "Data\Language\German.lng"
        File "Data\Language\Greek.lng"
        File "Data\Language\Italian.lng"
        File "Data\Language\Latvian.lng"
        File "Data\Language\Polish.lng"
        File "Data\Language\Romanian.lng"
        File "Data\Language\Russian.lng"
        File "Data\Language\Serbian.lng"
        File "Data\Language\Slovak.lng"
        File "Data\Language\Spanish.lng"
        File "Data\Language\Swedish.lng"
        File "Data\Language\Thai.lng"
        File "Data\Language\Turkish.lng"
        CreateShortCut "$DESKTOP\Enhanced MPEG Audio Collection.lnk" "$INSTDIR\Mac.exe"
        CreateDirectory "$SMPROGRAMS\Enhanced MPEG Audio Collection"
        CreateShortCut "$SMPROGRAMS\Enhanced MPEG Audio Collection\Enhanced MPEG Audio Collection.lnk" "$INSTDIR\Mac.exe"
        CreateShortCut "$SMPROGRAMS\Enhanced MPEG Audio Collection\Uninstall.lnk" "$INSTDIR\uninstall.exe"
        CreateShortCut "$SMPROGRAMS\Enhanced MPEG Audio Collection\MAC Help.lnk" "$INSTDIR\Mac.hlp"
        CreateShortCut "$SMPROGRAMS\Enhanced MPEG Audio Collection\History.lnk" "$INSTDIR\History.txt"
        CreateShortCut "$SMPROGRAMS\Enhanced MPEG Audio Collection\MAC WebPage (Browse Offline).lnk" "$INSTDIR\Doc\Index.html"

SectionEnd

Section -FinishSection

        WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
        WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
        WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
        WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

; Modern install component descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
        !insertmacro MUI_DESCRIPTION_TEXT ${Section1} ""
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Uninstall section
Section Uninstall

        ;Remove from registry...
        DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
        DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

        ; Delete self
        Delete "$INSTDIR\uninstall.exe"

        ; Delete Shortcuts
        Delete "$DESKTOP\Enhanced MPEG Audio Collection.lnk"
        Delete "$SMPROGRAMS\Enhanced MPEG Audio Collection\Enhanced MPEG Audio Collection.lnk"
        Delete "$SMPROGRAMS\Enhanced MPEG Audio Collection\Uninstall.lnk"
        Delete "$SMPROGRAMS\Enhanced MPEG Audio Collection\MAC Help.lnk"
        Delete "$SMPROGRAMS\Enhanced MPEG Audio Collection\History.lnk"
        Delete "$SMPROGRAMS\Enhanced MPEG Audio Collection\MAC WebPage (Browse Offline).lnk"

        ; Clean up Enhanced MPEG Audio Collection
        Delete "$INSTDIR\Col.html"
        Delete "$INSTDIR\Todo_Translate.txt"
        Delete "$INSTDIR\Mac.cnt"
        Delete "$INSTDIR\Mac.exe"
        Delete "$INSTDIR\Mac.hlp"
        Delete "$INSTDIR\Copying.txt"
        Delete "$INSTDIR\History.txt"
        Delete "$INSTDIR\Info.txt"
        Delete "$INSTDIR\License.txt"
        Delete "$INSTDIR\Doc\Col.html"
        Delete "$INSTDIR\Doc\Download.html"
        Delete "$INSTDIR\Doc\Faq.html"
        Delete "$INSTDIR\Doc\Index.html"
        Delete "$INSTDIR\Doc\Links.html"
        Delete "$INSTDIR\Doc\Mac.html"
        Delete "$INSTDIR\Doc\Mac_Cdcover-tn.png"
        Delete "$INSTDIR\Doc\Mac_Cdcover.png"
        Delete "$INSTDIR\Doc\Mac_Main-tn.png"
        Delete "$INSTDIR\Doc\Mac_Report-tn.png"
        Delete "$INSTDIR\Doc\Mac_Report.png"
        Delete "$INSTDIR\Doc\Mac_Search-tn.png"
        Delete "$INSTDIR\Doc\Mac_Search.png"
        Delete "$INSTDIR\Doc\Mac_Statistics-tn.png"
        Delete "$INSTDIR\Doc\Mac_Statistics.png"
        Delete "$INSTDIR\Doc\Mac_Tagger-tn.png"
        Delete "$INSTDIR\Doc\Mac_Tagger.png"
        Delete "$INSTDIR\Doc\Menu.html"
        Delete "$INSTDIR\Doc\News.html"
        Delete "$INSTDIR\Doc\Other.html"
        Delete "$INSTDIR\Doc\Sc_Cdcover.html"
        Delete "$INSTDIR\Doc\Sc_Report.html"
        Delete "$INSTDIR\Doc\Sc_Search.html"
        Delete "$INSTDIR\Doc\Sc_Statistics.html"
        Delete "$INSTDIR\Doc\Sc_Tagger.html"
        Delete "$INSTDIR\Doc\Screenshots.html"
        Delete "$INSTDIR\Doc\Translation.html"
        Delete "$INSTDIR\Doc\Mac_Main.png"
        Delete "$INSTDIR\Doc\Main.css"
        Delete "$INSTDIR\Doc\Menu.css"
        Delete "$INSTDIR\Doc\Pad_File.xml"
        Delete "$INSTDIR\Language\Afrikaans.lng"
        Delete "$INSTDIR\Language\Bulgarian.lng"
        Delete "$INSTDIR\Language\German_Swiss.lng"
        Delete "$INSTDIR\Language\Hungarian.lng"
        Delete "$INSTDIR\Language\Chinese_Simplified.lng"
        Delete "$INSTDIR\Language\Chinese_Traditional.lng"
        Delete "$INSTDIR\Language\Lithuanian.lng"
        Delete "$INSTDIR\Language\Norwegian.lng"
        Delete "$INSTDIR\Language\Polish_Ascii.lng"
        Delete "$INSTDIR\Language\Portuguese.lng"
        Delete "$INSTDIR\Language\Slovenian.lng"
        Delete "$INSTDIR\Language\Ukrainian.lng"
        Delete "$INSTDIR\Language\Arabic.lng"
        Delete "$INSTDIR\Language\Catalan.lng"
        Delete "$INSTDIR\Language\Croatian.lng"
        Delete "$INSTDIR\Language\Czech.lng"
        Delete "$INSTDIR\Language\Danish.lng"
        Delete "$INSTDIR\Language\Dutch.lng"
        Delete "$INSTDIR\Language\English.lng"
        Delete "$INSTDIR\Language\Estonian.lng"
        Delete "$INSTDIR\Language\Finnish.lng"
        Delete "$INSTDIR\Language\French.lng"
        Delete "$INSTDIR\Language\Galician.lng"
        Delete "$INSTDIR\Language\German.lng"
        Delete "$INSTDIR\Language\Greek.lng"
        Delete "$INSTDIR\Language\Italian.lng"
        Delete "$INSTDIR\Language\Latvian.lng"
        Delete "$INSTDIR\Language\Polish.lng"
        Delete "$INSTDIR\Language\Romanian.lng"
        Delete "$INSTDIR\Language\Russian.lng"
        Delete "$INSTDIR\Language\Serbian.lng"
        Delete "$INSTDIR\Language\Slovak.lng"
        Delete "$INSTDIR\Language\Spanish.lng"
        Delete "$INSTDIR\Language\Swedish.lng"
        Delete "$INSTDIR\Language\Thai.lng"
        Delete "$INSTDIR\Language\Turkish.lng"

        ; Remove remaining directories
        RMDir "$SMPROGRAMS\Enhanced MPEG Audio Collection"
        RMDir "$INSTDIR\Language\"
        RMDir "$INSTDIR\Doc\"
        RMDir "$INSTDIR\"

SectionEnd

; On initialization
Function .onInit

        !insertmacro MUI_LANGDLL_DISPLAY

FunctionEnd

BrandingText "Enhanced MPEG Audio Collection (PinterPeti's version)"

; eof