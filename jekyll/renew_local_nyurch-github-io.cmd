:: Скрипт обновлює блог nyurch.github.io із тестового nyurch.github.io-test

@echo on

SET projects_path="d:\github"
SET jkl_path="d:\github\nyurch.github.io"
SET jkl-test_path="d:\github\nyurch.github.io-test"
SET arch_path="C:\Program Files\7-Zip"
SET dd=%DATE:~0,2%
SET mm=%DATE:~3,2%
SET yyyy=%DATE:~6,4%
SET arch_date=%dd%-%mm%-%yyyy%

%arch_path%\7z.exe a -ssw -mx1 -r0 %projects_path%\nyurch-backup_%arch_date%.zip %jkl_path% -xr!.jekyll-cache -xr!.git -xr!_site
robocopy %jkl-test_path% %jkl_path% *.* /e /xd .jekyll-cache .git _site
pause