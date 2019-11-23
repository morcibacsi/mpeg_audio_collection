@echo off
del /Q *~*.*~* >nul
cd dcu
del /Q *.* >nul
cd..
cd units
del /Q *~*.*~* >nul
del /Q *.ddp >nul
cd..
cd data
del /Q Mac.exe >nul
cd..
