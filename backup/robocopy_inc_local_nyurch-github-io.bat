:: Скрипт архівує директорію nyurch.github.io

@echo off

SET projects_path="d:\github"
SET jkl_path="d:\github\nyurch.github.io"
SET dd=%DATE:~0,2%
SET mm=%DATE:~3,2%
SET yyyy=%DATE:~6,4%
set h=%TIME:~0,2%
set m=%TIME:~3,2%
SET arch_date=%dd%-%mm%-%yyyy%
SET arch_time=%h%-%m%

robocopy %jkl_path% %projects_path%\nyurch.github.io-%arch_date%_1-day\ *.*  /maxage:1 /S /XD .jekyll-cache .git _site /LOG+:%projects_path%\robocopy.log

pause


