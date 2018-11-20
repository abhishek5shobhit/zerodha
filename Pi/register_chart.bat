::Author : Tradelab Software



@echo off

setlocal


regsvr32 "%~dp0\PiChart.ocx" /s
regsvr32 "%~dp0\Tradescript.dll" /s

cd /d "%WINDIR%\Microsoft.NET\Framework\v4.0*"
regasm "%~dp0\ExcelDataStream.dll" /silent