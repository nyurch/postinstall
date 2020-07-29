ECHO OFF
CLS
color FC
:MENU
ECHO.
ECHO ...............................................
ECHO Обрати операцiю та натиснути ENTER
ECHO ...............................................
ECHO.
ECHO 1 - Видаємо права на папку IBM;
ECHO 2 - Копiюємо LBP з HWInspector;
ECHO 3 - Додаємо IBM в PATH;
ECHO 4 - Копiюємо шрифт та dll;
ECHO 5 - Усе за раз;
ECHO 0 - Вийти.
ECHO.
SET LBP_Files=C:\LBP\Shorcuts
SET Notes_path="C:\Program Files (x86)\IBM\Notes"
SET /P M=Виконати операцiю: 
IF %M%==1 GOTO OWNER
IF %M%==2 GOTO COPY
IF %M%==3 GOTO PATH
IF %M%==4 GOTO FONT
IF %M%==5 GOTO ALL
IF %M%==0 GOTO EOF
:OWNER
	cd "C:\Program Files (x86)\"
	takeown /f IBM /r /d y
	icacls IBM /grant %username%:(OI)(CI)F /T
    pause
	cls
GOTO MENU
:COPY
	xcopy \\hwinspector\LigaBP\* c:\LBP\ /e /y
	%~dp0shortcut.exe /a:c /f:"%allusersprofile%\desktop\LigaBP.lnk" /t:"c:\LBP\liga_bp.exe"
    pause
	cls
GOTO MENU
:PATH
	%~dp0pathman.exe /as "C:\Program Files (x86)\IBM\Notes"
	pause
	cls
GOTO MENU
:FONT
	copy %LBP_Files%\Box.ttf %WINDIR%\Fonts
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Box (TrueType)" /t REG_SZ /d Box.ttf /f
	copy %LBP_Files%\LIGA_API.dll %Notes_path%
	copy %LBP_Files%\cfx32.lic %Notes_path%
	copy %LBP_Files%\LIGA_API.dll %windir%\system32
	copy %LBP_Files%\cfx32.lic %windir%\system32
	regsvr32.exe /s %Notes_path%\cfx32.ocx
	regsvr32.exe /s %windir%\system32\cfx32.ocx
	odbcconf.exe /a {configdsn "SQL Server" "DSN=LBP|server=LBP2\RA2|database=LBP|trusted_connection=yes"}
	pause
	cls
GOTO MENU
:ALL
	cd "C:\Program Files (x86)\"
	takeown /f IBM /r /d y
	icacls IBM /grant %username%:(OI)(CI)F /T
	xcopy \\hwinspector\LigaBP\* c:\LBP\ /e /y
	%~dp0shortcut.exe /a:c /f:"%allusersprofile%\desktop\LigaBP.lnk" /t:"c:\LBP\liga_bp.exe"
	%~dp0pathman.exe /as "C:\Program Files (x86)\IBM\Notes"
	copy %LBP_Files%\Box.ttf %WINDIR%\Fonts
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Box (TrueType)" /t REG_SZ /d Box.ttf /f
	copy %LBP_Files%\LIGA_API.dll %Notes_path%
	copy %LBP_Files%\cfx32.lic %Notes_path%
	copy %LBP_Files%\LIGA_API.dll %windir%\system32
	copy %LBP_Files%\cfx32.lic %Notes_path%\system32
	regsvr32.exe /s %Notes_path%\cfx32.ocx
	regsvr32.exe /s %windir%\system32\cfx32.ocx
	odbcconf.exe /a {configdsn "SQL Server" "DSN=LBP|server=LBP2\RA2|database=LBP|trusted_connection=yes"}
	pause
	cls
GOTO MENU