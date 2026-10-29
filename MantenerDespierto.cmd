@echo off
setlocal
powershell.exe -NoLogo -NoProfile -File "%~dp0MantenerDespierto.ps1" %*
if errorlevel 1 (
    echo.
    echo No se pudo ejecutar el programa. Revisa el mensaje anterior.
    pause
)
