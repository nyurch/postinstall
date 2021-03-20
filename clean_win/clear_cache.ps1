Write-Host -ForegroundColor yellow "####################################################################################################################"
""
Write-Host -ForegroundColor Green "Powershell commands to delete cache & cookies in Firefox, Chrome & IE browsers"
Write-Host -ForegroundColor Green "By Lee Bhogal, Paradise Computing Ltd - June 2014"
Write-Host -ForegroundColor Green "VERSION: 2"
""
Write-Host -ForegroundColor yellow "####################################################################################################################"
""
Write-Host -ForegroundColor Green "CHANGE_LOG:
v2.4: - Resolved *.default issue, issue was with the file path name not with *.default, but issue resolved
v2.3: - Added Cache2 to Mozilla directories but found that *.default is not working
v2.2: - Added Cyan colour to verbose output
v2.1: - Added the location 'C:\Windows\Temp\*' and 'C:\`$recycle.bin\'
v2:   - Changed the retrieval of user list to dir the c:\users folder and export to csv
v1:   - Compiled script"
""
Write-Host -ForegroundColor yellow "####################################################################################################################"
""
#########################
"===================================================================="
Write-Host -ForegroundColor Green "SECTION 1: Getting the list of users"
"===================================================================="
# Write Information to the screen
Write-Host -ForegroundColor yellow "Exporting the list of users to c:\users\%username%\users.csv"
# List the users in c:\users and export to the local profile for calling later
dir C:\Users | select Name | Export-Csv -encoding utf8 -Path C:\users\$env:USERNAME\users.csv -NoTypeInformation
$list=Test-Path C:\users\$env:USERNAME\users.csv
""
#########################
if ($list) {
    "===================================================================="
    #Clear Mozilla Firefox Cache
    Write-Host -ForegroundColor Green "SECTION 2: Clearing Mozilla Firefox Caches"
    "===================================================================="
    Write-Host -ForegroundColor yellow "Clearing Mozilla caches"
    Write-Host -ForegroundColor cyan
    Import-CSV -Path C:\users\$env:USERNAME\users.csv -Header Name | foreach {
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\* -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*.* -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.* -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\* -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cookies.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
            }
    Write-Host -ForegroundColor yellow "Done..."
    ""
    "===================================================================="
    # Clear Google Chrome 
    Write-Host -ForegroundColor Green "SECTION 3: Clearing Google Chrome Caches"
    "===================================================================="
    Write-Host -ForegroundColor yellow "Clearing Google caches"
    Write-Host -ForegroundColor cyan
    Import-CSV -Path C:\users\$env:USERNAME\users.csv -Header Name | foreach {
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*" -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies" -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Media Cache" -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal" -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\ChromeDWriteFontCache" -Recurse -Force -EA SilentlyContinue -Verbose
            }

    Write-Host -ForegroundColor yellow "Done..."
    ""
    "===================================================================="
    # Clear Internet Explorer
    Write-Host -ForegroundColor Green "SECTION 4: Clearing Internet Explorer Caches"
     "===================================================================="
    Write-Host -ForegroundColor yellow "Clearing Internet Explorer Caches"
    Write-Host -ForegroundColor cyan
    Import-CSV -Path C:\users\$env:USERNAME\users.csv | foreach {
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose
            }

    Write-Host -ForegroundColor yellow "Done..."
    ""
    "===================================================================="
    # Clear %Temp%
    Write-Host -ForegroundColor Green "SECTION 5: Clearing Windows Temp folder"
     "===================================================================="
    Write-Host -ForegroundColor yellow "Clearing Windows Temp folder"
    Write-Host -ForegroundColor cyan
    Import-CSV -Path C:\users\$env:USERNAME\users.csv | foreach {
            Remove-Item -path "C:\Windows\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose
            }

    Write-Host -ForegroundColor yellow "Done..."
    ""
     "===================================================================="
    # Clear Recycle
    Write-Host -ForegroundColor Green "SECTION 6: Clear Recycle"
     "===================================================================="
    Write-Host -ForegroundColor yellow "Clearing Recycle"
    Write-Host -ForegroundColor cyan
    Import-CSV -Path C:\users\$env:USERNAME\users.csv | foreach {Clear-RecycleBin -Force}

    Write-Host -ForegroundColor yellow "Done..."
    ""

    Write-Host -ForegroundColor Green "All Tasks Done!"
    } else {
    Write-Host -ForegroundColor Yellow "Session Cancelled"	
    Exit
    }