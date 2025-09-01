@echo off
setlocal ENABLEDELAYEDEXPANSION

REM REQUIREMENTS: yt-dlp, ffmpeg (must be on PATH)
REM Install via winget (PowerShell):
REM   winget install yt-dlp.yt-dlp
REM   winget install Gyan.FFmpeg

REM Arg check
if "%~1"=="" (
  echo Usage: %~nx0 ^<video_url^>
  exit /b 1
)

REM Tool checks
where yt-dlp >nul 2>nul || (echo ERROR: yt-dlp not found on PATH.& exit /b 1)
where ffmpeg  >nul 2>nul || (echo ERROR: ffmpeg not found on PATH.& exit /b 1)

cls
echo Downloading audio from URL: %~1

REM Download audio as OPUS; title-based filename
yt-dlp -x --audio-format opus --output "%%(title)s.%%(ext)s" "%~1" >nul 2>nul
if errorlevel 1 (
  echo ERROR: yt-dlp download failed.
  exit /b 1
)

REM Pick the most recent .opus file
set "opus="
for /f "delims=" %%A in ('dir /b /a:-d /o:-d *.opus 2^>nul') do (
  if not defined opus set "opus=%%~fA"
)

if not defined opus (
  echo ERROR: No .opus file found after download.
  exit /b 1
)

REM Sanitize base name (remove non a-zA-Z0-9 space - _)
for /f "usebackq delims=" %%B in (`powershell -NoProfile -Command ^
  "$n=[IO.Path]::GetFileNameWithoutExtension('%opus%');" ^
  "$n -replace '[^a-zA-Z0-9 \-_]',''"`) do set "cleanName=%%B"

if not defined cleanName set "cleanName=output"

set "mp3=%cd%\%cleanName%.mp3"

cls
echo Converting "%opus%" -> "%mp3%"
ffmpeg -i "%opus%" -vn -ab 192k -ar 44100 -y "%mp3%" >nul 2>nul
if errorlevel 1 (
  echo ERROR: ffmpeg conversion failed.
  exit /b 1
)

REM Remove original OPUS
del /q "%opus%" >nul 2>nul

cls
echo All done! Saved at: "%mp3%"
exit /b 0
