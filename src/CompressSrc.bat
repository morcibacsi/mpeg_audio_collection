@del /q dcu\*.*
@move data\Mac.exe .\Mac.exe
@7za a -r -mx eMAC292()_src.7z @CompressSrc.lst
@move Mac.exe data\Mac.exe