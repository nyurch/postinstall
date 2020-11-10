:: Скрипт архівує директорію nyurch.github.io

@echo off

SET projects_path="d:\github"
SET jkl_path="d:\github\nyurch.github.io"
SET arch_path="C:\Program Files\7-Zip"
SET dd=%DATE:~0,2%
SET mm=%DATE:~3,2%
SET yyyy=%DATE:~6,4%
set h=%TIME:~0,2%
set m=%TIME:~3,2%
SET arch_date=%dd%-%mm%-%yyyy%
SET arch_time=%h%-%m%

%arch_path%\7z.exe u %projects_path%\nyurch-backup_%arch_date%.zip -u- -up0q3r2x2y2z0w2^!%projects_path%\nyurch-backup_%arch_date%_%arch_time%.zip %jkl_path% -xr!.jekyll-cache -xr!.git -xr!_site

pause