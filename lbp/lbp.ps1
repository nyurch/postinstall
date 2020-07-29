$Title = "Welcome"
$Info = "Install choco and other software"
$ibm_dir = "c:\Program Files (x86)"

function Show-Menu {
    param (
        [string]$Title = 'Main Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Press '1' to take owner."
    Write-Host "2: Press '2' to change ACL."
    Write-Host "3: Press '3' to check for update."
    Write-Host "4: Press '4' for update Software."
    Write-Host "5: Press '5' for uninstall Software."
    Write-Host "Q: Press 'Q' to quit."

    Write-Host "==========================================="
}

do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    '1' {
    takeown /f $ibm_dir\IBM /r /d y
	icacls $ibm_dir\IBM /grant %username%:(OI)(CI)F /T
    pause
    exit
    } '2' {
    choco install $(zenity.exe --height=500 --width=600 --list --text="<b>Select the software to install:</b>" \ --checklist --multiple --hide-column=2 --column "Check" --column "Software" --separator=";" --column "Name" --column "Discription" `
    "7zip2" "7-Zip" "7-Zip — файловий архіватор з високим ступенем стиснення" \ `
    "Firefox2" "Mozilla Firefox" "Mozilla Firefox — вільний безкоштовний веб-оглядач з відкритим кодом" \ `
    "adobereader" "Adobe Reader" "Adobe Acrobat — програмний продукт виробництва Adobe для роботи з PDF-файлами" \ `
    "googlechrome" "Google Chrome" "Google Chrome — це безкоштовний вебпереглядач, розроблений компанією Google на основі веб-переглядача з відкритим кодом Chromium" \ `
    "vlc" "VLC media player" "VLC — кросплатформений та вільний плеєр проекту VideoLAN. VLC здатний програвати різноманітні аудіо- та відеофайли, CD та DVD-диски, інтернет-радіо за різними протоколами та має багато інших можливостей" \ `
    "ccleaner" "CCleaner" "CCleaner — безкоштовна утиліта із закритим вихідним кодом, яка надає користувачам потужний і простий у використанні інструмент для очищення і оптимізації 32- та 64-розрядних операційних систем Microsoft Windows" \ `
    "libreoffice-fresh" "Libre Office" "LibreOffice — вільний та крос-платформовий офісний пакет. LibreOffice працює на операційних системах Microsoft Windows, Gnu/Linux та macOS" \ `
    "far" "FAR Manager" "FAR Manager — консольний файловий менеджер для операційних систем родини Windows" \ `
    "notepadplusplus" "Notepad++" "Notepad++ — текстовий редактор, призначений для програмістів і тих, кого не влаштовує скромна функціональність програми «блокнот», що входить до складу Windows" \ `
    "gimp" "GIMP" "GIMP — растровий графічний редактор, із деякою підтримкою векторної графіки" \ `
    "ііі" "іііі" "і" \ `
    "]]]" "їїї" "єєєє" \ `
    "єєєє" "єєє" "єєє") -y
    } '3' {
    choco outdated
    } '4' {
    choco update all
    } '5' {
    choco uninstall $(.\zenity.exe --height=250 --width=600 --list --text="<b>Select the software to install:</b>" \ --checklist --multiple --hide-column=2 --column "Check" --column "Software" --separator=";" --column "Discription" "7zip" "7-Zip is a free and open-source file archiver" \ "Firefox" "Firefox, is a free and open-source web browser developed by the Mozilla Foundation") -y
    }
    }
    pause
 }
 until ($selection -eq 'q')