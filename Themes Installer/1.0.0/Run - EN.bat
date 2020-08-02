@echo off
:startup
color f
mode con: cols=51 lines=18
set "version=v1.0.0"
set "BDDir=%appdata%BetterDiscord"
set "BDThemeDir=%appdata%\BetterDiscord\themes"
set "DragDIR=%~dp0\DragToInstall"

title Themes installer %version% English
if exist "%appdata%\BetterDiscord\themes" (
    echo better discord is installed.
) else (
    echo Error: please install better discord and try again
    pause
)
:load
set load=%load%!!!!!!!
cls
echo -------------------------------------------------
echo                       Loading...
echo -------------------------------------------------
echo.
echo.
echo                  Username: %username%.
echo.
echo.
echo          Logging in...
echo          ===================================
echo          %load%
echo          ===================================
echo.                              Please Wait...
echo.
ping localhost -n 2 >nul
set /a loadnum=%loadnum% +1
if %loadnum%==5 goto install
goto load
ping localhost -n 5 >nul
:install
cls
echo -------------------------------------------------
echo.                     Home
echo -------------------------------------------------
echo.
echo       1 - Download a theme from the system.
echo.
echo       2 - Download a theme From my Website.
echo.
echo            3 - Download custom theme. 
echo.
echo              4 - Logging settings (Admin)  
echo.
echo -------------------------------------------------
set /p "Select=[1/2/3/4]: "
if ["%select%"] == ["1"] goto 1
if ["%select%"] == ["2"] goto 2
if ["%select%"] == ["3"] goto 3
if ["%select%"] == ["4"] goto Settings
if ["%select%"] == [""] goto nowarp
:nowarp
echo please select an option.
ping localhost -n 2 >nul
goto install

:1
ping localhost -n 2 >nul
cls
echo -------------------------------------------------
echo                Based System Themes
echo -------------------------------------------------
echo. 
echo             1 - TrueLight 2.0.1 
echo             2 - TrueLight 2.0.0
echo             3 - TrueLightAnime 1.0.0
echo             4 - TrueLight 1.0.0
echo             5 - Go back To main menu
echo. 
echo -------------------------------------------------
set /p "Base=[1\2\3\4\5]: "
if ["%base%"] == ["1"] goto :Section1onsubsection1
if ["%base%"] == ["2"] goto :Section1onsubsection2
if ["%base%"] == ["3"] goto :Section1onsubsection3
if ["%base%"] == ["4"] goto :Section1onsubsection4
if ["%base%"] == ["5"] goto install
:Section1onsubsection1
echo Downloading TrueLight 2.0.1...
xcopy /y "%~dp0\themes\TrueLightV2.0.1.theme.css" "%BDThemeDir%" >nul
goto :doneinstalling

:Section1onsubsection2
echo Downloading TrueLight 2.0.0...
xcopy /y "%~dp0\themes\TrueLightV2.0.0.theme.css" "%BDThemeDir%" >nul
goto :doneinstalling

:Section1onsubsection3
echo Downloading TrueLightAnime 1.0.0...
xcopy /y "%~dp0\themes\TrueLightAnimeV1.0.theme.css" "%BDThemeDir%" >nul
goto :doneinstalling
:Section1onsubsection4
echo Downloading TrueLight 1.0.0...
xcopy /y "%~dp0\themes\TrueLightV1.0.theme.css" "%BDThemeDir%" >nul
goto :doneinstalling
:doneinstalling
echo.
echo Done, Installed A theme!, 
echo  Follow The Steps to turn the theme on:
echo   Open discord settings ^>^ Themes ^>^ toggle theme.
echo.
echo Press any key to EXIT...
pause >nul
exit
:2
ping localhost -n 2 >nul

cls
echo -------------------------------------------------
echo            Theme Selection From my Site
echo -------------------------------------------------
echo.
echo - Select a theme from my Website
echo.
ping localhost -n 3 >nul
echo - Drag it into \DragToInstall
echo.
ping localhost -n 3 >nul
echo - make sure it has no quotes 
echo    and it ends with .theme.css
echo.
echo    if the site was not opened you can go to
echo              http://agamsol.com
echo.
echo -------------------------------------------------
ping localhost -n 5 >nul
start Chrome "http://agamsol.com"
echo Press any key when done...
pause >nul
ping localhost -n 2 >nul
cls
echo  Pinging http://agamsol.com
echo.
ping agamsol.com -n 2 >nul
xcopy /y "%DragDIR%\*.*" "%BDThemeDir%" >nul
echo  if there was a file in \DragToInstall
echo  he is being Moved to the themes directory.
ping agamsol.com -n 2 >nul
del /Q "%DragDIR%\*.*"
echo.
echo  Follow The Steps to turn the theme on:
echo   Open discord settings ^>^ Themes ^>^ toggle theme.
echo.
echo  Press any key to EXIT...
pause >nul
exit
:3
:Section3onsubsection1
set Dots=%Dots%.
cls
echo -------------------------------------------------
echo             Custom Theme Downloader
echo -------------------------------------------------
echo.
echo         Loading Custom Themes Injector.
echo.
echo -------------------------------------------------
echo                            please wait%Dots%
ping localhost -n 2 >nul
set /a Dotnum=%Dotnum% +1
if %Dotnum%==4 goto :Section3onsubsection2
goto :Section3onsubsection1
:Section3onsubsection2
ping localhost -n 2 >nul
cls
echo -------------------------------------------------
echo             Custom Theme Downloader
echo -------------------------------------------------
echo.
echo         Steps To Install Custom Themes.
echo.
echo         - Drag your theme file 
echo            into \DragToInstall
echo.
echo         - make sure it has no quotes 
echo            and it ends with .theme.css
echo.
echo -------------------------------------------------
echo Press any key when done...
pause >nul
cls
xcopy /y "%DragDIR%\*.*" "%BDThemeDir%" >nul
ping localhost -n 2 >nul
del /Q "%DragDIR%\*.*"
echo -------------------------------------------------
echo.
echo    Note: if there was a file in \DragToInstall
echo     he is being Moved to the themes directory.
echo.
echo      Follow The Steps to turn the theme on:
echo  Open discord settings ^>^ Themes ^>^ toggle theme.
echo.
echo -------------------------------------------------
echo                    Press any key to EXIT%Dots%
pause >nul
exit


PAUSE
:Settings
set "osarchitecture="
cls
echo -------------------------------------------------
echo                  Settings - Info
echo -------------------------------------------------
echo.
echo       App Version: %version%
for /f %%A in ('wmic os get osarchitecture /value ^| find /i "OSARCHITECTURE"') do set "%%A"
if not "%osarchitecture%"=="64-bit" goto not64
goto yes64
:not64
echo       OS: 32-bit Operating system
goto skipyes64
:yes64
echo       OS: 64-bit Operating system
:skipyes64
net session >nul 2>&1
if %errorlevel%==0 (
echo       isAdmin: True
) else (
echo       isAdmin: False
)
echo.
echo       *Supports Stable Discord
echo       *Supports Discord canary
echo       *Supports Discord PTB
echo.
echo -------------------------------------------------
pause



