:: Скрипт обновлює RealName Fix

@echo off

SET arch_path="%ProgramFiles%\7-Zip"
SET RNF="fm21-real-names-fix-v201108"
SET FMDB2100="%ProgramFiles(x86)%\Steam\steamapps\common\Football Manager 2021\data\database\db\2100"
SET FMDB2101="%ProgramFiles(x86)%\Steam\steamapps\common\Football Manager 2021\data\database\db\2101"
SET FMDB2110="%ProgramFiles(x86)%\Steam\steamapps\common\Football Manager 2021\data\database\db\2110"


:: 2100
del /F /Q %FMDB2100%\lnc\all\fake.lnc %FMDB2100%\lnc\all\lic_dan_swe_fra.lnc %FMDB2100%\lnc\all\nleague.lnc
del /F /Q %FMDB2100%\edt\permanent\fake.edt
del /F /Q %FMDB2100%\dbc\permanent\"zebra turin fake staff.dbc" %FMDB2100%\dbc\permanent\"zebra award.dbc" %FMDB2100%\dbc\permanent\brazil_kits.dbc %FMDB2100%\dbc\permanent\"forbidden names.dbc" %FMDB2100%\dbc\permanent\Licensing2.dbc %FMDB2100%\dbc\permanent\Licensing2_chn.dbc
%arch_path%\7z.exe e %RNF%.zip -aoa -o%FMDB2100%\lnc\all *.lnc

:: 2101
del /F /Q %FMDB2101%\lnc\all\fake.lnc %FMDB2101%\lnc\all\lic_dan_swe_fra.lnc %FMDB2101%\lnc\all\nleague.lnc
del /F /Q %FMDB2101%\edt\permanent\fake.edt
del /F /Q %FMDB2101%\dbc\permanent\"zebra turin fake staff.dbc" %FMDB2101%\dbc\permanent\"zebra award.dbc" %FMDB2101%\dbc\permanent\brazil_kits.dbc %FMDB2101%\dbc\permanent\"forbidden names.dbc" %FMDB2101%\dbc\permanent\Licensing2.dbc %FMDB2101%\dbc\permanent\Licensing2_chn.dbc
%arch_path%\7z.exe e %RNF%.zip -aoa -o%FMDB2101%\lnc\all *.lnc

:: 2110
del /F /Q %FMDB2110%\lnc\all\fake.lnc %FMDB2110%\lnc\all\lic_dan_swe_fra.lnc %FMDB2110%\lnc\all\nleague.lnc
del /F /Q %FMDB2110%\edt\permanent\fake.edt
del /F /Q %FMDB2110%\dbc\permanent\"zebra turin fake staff.dbc" %FMDB2110%\dbc\permanent\"zebra award.dbc" %FMDB2110%\dbc\permanent\brazil_kits.dbc %FMDB2110%\dbc\permanent\"forbidden names.dbc" %FMDB2110%\dbc\permanent\Licensing2.dbc %FMDB2110%\dbc\permanent\Licensing2_chn.dbc
%arch_path%\7z.exe e %RNF%.zip -aoa -o%FMDB2110%\lnc\all *.lnc

pause