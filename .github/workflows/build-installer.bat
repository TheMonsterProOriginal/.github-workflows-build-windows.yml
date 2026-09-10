@echo off
setlocal

call "%~dp0build-release.bat"
if errorlevel 1 exit /b 1

if not exist "%~dp0redist\NDP472-Web.exe" (
  echo.
  echo Manca redist\NDP472-Web.exe.
  echo Scarica il web installer ufficiale .NET Framework 4.7.2 e salvalo con questo nome.
  exit /b 1
)

where iscc >nul 2>&1
if errorlevel 1 (
  echo Inno Setup non trovato. Installa Inno Setup 6 e riprova.
  exit /b 1
)

iscc "%~dp0installer\AdBloker.iss"
if errorlevel 1 exit /b 1

echo.
echo Installer creato: "%~dp0dist\AdBloker-Setup.exe"