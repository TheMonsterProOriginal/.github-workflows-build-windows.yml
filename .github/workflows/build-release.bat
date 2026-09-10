@echo off
setlocal

set "ROOT=%~dp0"
set "SOLUTION=%ROOT%AdBloker.sln"

where msbuild >nul 2>&1
if %errorlevel% equ 0 goto build

if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" (
  for /f "usebackq delims=" %%i in (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -products * -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) do set "MSBUILD=%%i"
)

if not defined MSBUILD (
  echo MSBuild non trovato.
  echo Installa Visual Studio con il workload .NET desktop e il Developer Pack .NET Framework 4.7.2.
  exit /b 1
)

:build
if defined MSBUILD (
  "%MSBUILD%" "%SOLUTION%" /t:Rebuild /p:Configuration=Release /p:Platform=AnyCPU
) else (
  msbuild "%SOLUTION%" /t:Rebuild /p:Configuration=Release /p:Platform=AnyCPU
)

if errorlevel 1 (
  echo.
  echo Compilazione fallita.
  exit /b 1
)

echo.
echo Compilazione completata.
echo Eseguibile: "%ROOT%AdBloker\bin\Release\AdBloker.exe"
exit /b 0