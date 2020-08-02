@echo off
:startup
color f
mode con: cols=60 lines=18
set "version=v1.0.0"
set "BDDir=%appdata%BetterDiscord"
set "BDThemeDir=%appdata%\BetterDiscord\themes"
set "DragDIR=%~dp0\DragToInstall"

title Themes installer %version% Spanish 
if exist "%appdata%\BetterDiscord\themes" (
    echo Se instala una mejor discordia.
) else (
    echo Error: instale una mejor discordia e intente nuevamente
    pause
)
:load
set load=%load%!!!!!!!
cls
echo -------------------------------------------------
echo                       Cargando...
echo -------------------------------------------------
echo.
echo.
echo            Nombre de usuario: %username%.
echo.
echo.
echo          Iniciando sesión...
echo          ===================================
echo          %load%
echo          ===================================
echo.                              por favor espera...
echo.
ping localhost -n 2 >nul
set /a loadnum=%loadnum% +1
if %loadnum%==5 goto install
goto load
ping localhost -n 5 >nul
:install
cls
echo -------------------------------------------------
echo.                     Hogar
echo -------------------------------------------------
echo.
echo       1 - Descargue un tema del sistema.
echo.
echo       2 - Download a theme From my Website.
echo.
echo       3 - Descargar un tema de mi sitio web.
echo.
echo       4 - Configuración de registro (administrador)
echo.
echo -------------------------------------------------
set /p "Select=[1/2/3/4]: "
if ["%select%"] == ["1"] goto 1
if ["%select%"] == ["2"] goto 2
if ["%select%"] == ["3"] goto 3
if ["%select%"] == ["4"] goto Settings
if ["%select%"] == [""] goto nowarp
:nowarp
echo Por favor seleccione una opción.
ping localhost -n 2 >nul
goto install

:1
ping localhost -n 2 >nul
cls
echo -------------------------------------------------
echo             Temas del sistema basado
echo -------------------------------------------------
echo. 
echo             1 - TrueLight 2.0.1 
echo             2 - TrueLight 2.0.0
echo             3 - TrueLightAnime 1.0.0
echo             4 - TrueLight 1.0.0
echo             5 - Regresar al menú principal
echo. 
echo -------------------------------------------------
set /p "Base=[1\2\3\4\5]: "
if ["%base%"] == ["1"] goto :Section1onsubsection1
if ["%base%"] == ["2"] goto :Section1onsubsection2
if ["%base%"] == ["3"] goto :Section1onsubsection3
if ["%base%"] == ["4"] goto :Section1onsubsection4
if ["%base%"] == ["5"] goto install
:Section1onsubsection1
echo descargando TrueLight 2.0.1...
xcopy /y "%~dp0\themes\TrueLightV2.0.1.theme.css" "%BDThemeDir%" >nul
goto :doneinstalling

:Section1onsubsection2
echo descargando TrueLight 2.0.0...
xcopy /y "%~dp0\themes\TrueLightV2.0.0.theme.css" "%BDThemeDir%" >nul
goto :doneinstalling

:Section1onsubsection3
echo descargando TrueLightAnime 1.0.0...
xcopy /y "%~dp0\themes\TrueLightAnimeV1.0.theme.css" "%BDThemeDir%" >nul
goto :doneinstalling
:Section1onsubsection4
echo descargando TrueLight 1.0.0...
xcopy /y "%~dp0\themes\TrueLightV1.0.theme.css" "%BDThemeDir%" >nul
goto :doneinstalling
:doneinstalling
echo.
echo Hecho, instalado un tema!, 
echo  Siga los pasos para activar el tema:
echo   Abra la configuración de discordia ^> ^ Temas ^> ^ alternar tema.
echo.
echo Presiona cualquier tecla para salir...
pause >nul
exit
:2
ping localhost -n 2 >nul

cls
echo -------------------------------------------------
echo            Selección de tema de mi sitio
echo -------------------------------------------------
echo.
echo - Seleccione un tema de mi sitio web
echo.
ping localhost -n 3 >nul
echo - Arrástrelo a \ DragToInstall
echo.
ping localhost -n 3 >nul
echo - asegúrese de que no tenga comillas 
echo    y termina con .theme.css
echo.
echo    si el sitio no se abrió puedes ir a
echo              http://agamsol.com
echo.
echo -------------------------------------------------
ping localhost -n 5 >nul
start Chrome "http://agamsol.com"
echo Presione cualquier tecla cuando haya terminado ...
pause >nul
ping localhost -n 2 >nul
cls
echo  Pinging http://agamsol.com
echo.
ping agamsol.com -n 2 >nul
xcopy /y "%DragDIR%\*.*" "%BDThemeDir%" >nul
echo  si hubiera un archivo en \ DragToInstall
echo él se está moviendo al directorio de temas.
ping agamsol.com -n 2 >nul
del /Q "%DragDIR%\*.*"
echo.
echo  Siga los pasos para activar el tema:
echo Abrir la configuración de discordia ^> ^ Temas ^> ^ alternar tema.
echo.
echo  Presiona cualquier tecla para salir...
pause >nul
exit
:3
:Section3onsubsection1
set Dots=%Dots%.
cls
echo -------------------------------------------------
echo       Descargador de temas personalizados
echo -------------------------------------------------
echo.
echo         Loading Custom Themes Injector.
echo.
echo -------------------------------------------------
echo                            por favor espera%Dots%
ping localhost -n 2 >nul
set /a Dotnum=%Dotnum% +1
if %Dotnum%==4 goto :Section3onsubsection2
goto :Section3onsubsection1
:Section3onsubsection2
ping localhost -n 2 >nul
cls
echo -------------------------------------------------
echo        Descargador de temas personalizados
echo -------------------------------------------------
echo.
echo     Pasos para instalar temas personalizados.
echo.
echo     - Arrastra tu archivo de tema
echo       en \ DragToInstall
echo.
echo     - asegúrese de que no tenga comillas
echo       y termina con .theme.css
echo.
echo -------------------------------------------------
echo Presione cualquier tecla cuando haya terminado ...
pause >nul
cls
xcopy /y "%DragDIR%\*.*" "%BDThemeDir%" >nul
ping localhost -n 2 >nul
del /Q "%DragDIR%\*.*"
echo -------------------------------------------------
echo.
echo   Nota: si hubiera un archivo en \ DragToInstall
echo     se está moviendo al directorio de temas.
echo.
echo      Siga los pasos para activar el tema:
echo  Abra la configuración de discordia ^> ^ Temas ^> ^ alternar tema.
echo.
echo -------------------------------------------------
echo        Presiona cualquier tecla para salir%Dots%
pause >nul
exit


PAUSE
:Settings
set "osarchitecture="
cls
echo -------------------------------------------------
echo          Configuraciones - Información
echo -------------------------------------------------
echo.
echo       Version de aplicacion: %version%
for /f %%A in ('wmic os get osarchitecture /value ^| find /i "OSARCHITECTURE"') do set "%%A"
if not "%osarchitecture%"=="64-bit" goto not64
goto yes64
:not64
echo       OS: sistema operativo de 32 bits
goto skipyes64
:yes64
echo       OS: sistema operativo de 64 bits
:skipyes64
net session >nul 2>&1
if %errorlevel%==0 (
echo       esAdmin: True
) else (
echo       esAdmin: False
)
echo.
echo       *Apoya Stable Discord
echo       *Apoya Discord canary
echo       *Apoya Discord PTB
echo.
echo  El programa se traduce con Google Translate.
echo  Program is Translated Using Google Translate.
echo -------------------------------------------------
pause



