#!/bin/bash
# Шапка-костиль, нічого не використовується.
ROOT_UID=0 #Лише користувач з $UID 0 має права root.
E_XCD=86 #Неможливо змінити директорію?
E_NOTROOT=87 #Вихід з помилкою "не root".

clear
echo "$(tput bold)$(tput setaf 1)Варіанти запуску:"
echo "===========================================================$(tput sgr0)"
echo -e "\t$(tput bold)$(tput setaf 3)[1]$(tput sgr0) Задати проксі                                 "
echo -e "\t$(tput bold)$(tput setaf 3)[2]$(tput sgr0) Очистити проксі                               "
echo -e "\t$(tput bold)$(tput setaf 3)[3]$(tput sgr0) Оновити систему                               "
echo -e "\t$(tput bold)$(tput setaf 3)[4]$(tput sgr0) Очистити кеш apt та видалити застарілі файли  "
echo -e "\t$(tput bold)$(tput setaf 3)[5]$(tput sgr0) Вибір програм для встановлення(ppa)           "
echo -e "\t$(tput bold)$(tput setaf 3)[6]$(tput sgr0) Вибір програм для встановлення(snap)          "
echo -e "\t$(tput bold)$(tput setaf 3)[7]$(tput sgr0) Установка Anydesk                             "
echo -e "\t$(tput bold)$(tput setaf 3)[8]$(tput sgr0) bash з блек-джеком                            "
echo -e "\t$(tput bold)$(tput setaf 3)[0]$(tput sgr0) Вихід                                         "
echo -e "$(tput bold)$(tput setaf 1)===========================================================\n$(tput sgr0)"
echo -n "$(tput bold)$(tput setaf 2)Обрати варіант:$(tput sgr0) "; read doing

case $doing in
1)
clear
echo -e "\n"
#cp ~/.bashrc ~/.bashrc.bak
sudo cp /etc/sudoers /etc/sudoers.bak
sudo cp /etc/wgetrc /etc/wgetrc.bak
sudo cp /etc/environment /etc/environment.bak
echo -n "Ввести проксі у форматі http://проксі : "; read PURL
echo -n "Ввести порт проксі : "; read PPRT
echo -e "\n"
#echo "Налаштування проксі-сервера прописані у .bashrc"
#echo -e "#########Змінено Я#########\nexport http_proxy=\"$PURL:$PPRT/\"\nexport https_proxy=\"$PURL:$PPRT/\"\nexport ftp_proxy=\"$PURL:$PPRT/\"" >> ~/.bashrc
echo "Налаштування проксі-сервера прописані у /etc/environment"
sudo sh -c "echo '\n#########Змінено Я#########\nhttp_proxy=\"$PURL:$PPRT/\"\nhttps_proxy=\"$PURL:$PPRT/\"\nftp_proxy=\"$PURL:$PPRT/\"\nHTTP_PROXY=\"$PURL:$PPRT/\"\nHTTPS_PROXY=\"$PURL:$PPRT/\"\nFTP_PROXY=\"$PURL:$PPRT/\"' >> /etc/environment"
echo "Налаштування проксі-сервера прописані у /etc/wgetrc"
sudo sh -c "echo '\n#########Змінено Я#########\nhttps_proxy = $PURL:$PPRT/\nhttp_proxy = $PURL:$PPRT/\nftp_proxy = $PURL:$PPRT/\nuse_proxy = on' >> /etc/wgetrc"
echo "Налаштування проксі-сервера прописані у /etc/sudoers"
sudo sh -c "echo '\n#########Змінено Я#########\nDefaults env_keep += \"http_proxy https_proxy ftp_proxy all_proxy no_proxy\"' >> /etc/sudoers"
echo -e "Налаштування проксі-сервера прописані у /etc/apt/apt.conf.d/02proxy\n"
sudo sh -c "echo '\n#########Змінено Я#########\nAcquire::http::Proxy \"$PURL:$PPRT\";' > /etc/apt/apt.conf.d/02proxy"
;;
2)
clear
echo -e "\n"
echo "Очищення налаштувань проксі"
echo -e "\n"
#mv ~/.bashrc.bak ~/.bashrc
sudo rm -r /etc/apt/apt.conf.d/02proxy
sudo mv /etc/sudoers.bak /etc/sudoers
sudo mv /etc/wgetrc.bak /etc/wgetrc
sudo mv /etc/environment.bak /etc/environment
;;
3)
clear
echo -e "\n"
echo "Оновлення дистрибутиву"
echo -e "\n"
sudo apt update && sudo apt dist-upgrade -y
;;
4)
clear
echo -e "\n"
echo "Очищення дистрибутиву"
echo -e "\n"
sudo apt clean -y && sudo apt autoremove -y
;;
5)
clear
echo -e "\n"
echo "Вибір програм для встановлення"
echo -e "\n"
sudo apt install -y $(zenity --list --text="ВИБРАТИ ПРОГРАМИ ДЛЯ ВСТАНОВЛЕННЯ:" \
    --checklist --multiple --column "Вибір" --column "Програма" --separator=" " --column "Опис"\
    FALSE "audacity" "Graphical cross-platform audio editor"\
    FALSE "calibre" "E-book converter and library management"\
    FALSE "clipit" "Lightweight GTK+ Clipboard Manager"\
    FALSE "dropbox" "File hosting service"\
    FALSE "easytag" "Tag editor for MP3, Ogg Vorbis files and more"\
    FALSE "gimp" "An image manipulation and paint program"\
    FALSE "glances" "Curses-based monitoring tool"\
    FALSE "gnome-nettool" "Network information tool for GNOME"\
    FALSE "gxneur" "X Neural Switcher is a free software for automatic keyboard layout changing"\
    FALSE "libreoffice" "LibreOffice office suite"\
    FALSE "mc" "Visual shell for Unix-like systems"\
    FALSE "pidgin" "Instant Messaging client"\
    FALSE "remmina" "Remote desktop client for GNOME desktop environment"\
    FALSE "samba" "SMB/CIFS file, print, and login server for Unix"\
    FALSE "spotify-client" "Music streaming and media services provider"\
    FALSE "ssh" "OpenSSH SSH client (Remote login program)"\
    FALSE "telegram-desktop" "Cloud-based instant messaging and voice over IP service"\
    FALSE "qbittorrent" "Bittorrent client based on libtorrent-rasterbar with a Qt4 GUI"\
    FALSE "ubuntu-restricted-extras" "Commonly used media codecs and fonts for Ubuntu"\
    FALSE "virtualbox" "x86 virtualization solution"\
    FALSE "virtualbox-guest-additions-iso" "Guest additions iso image for VirtualBox"\
    FALSE "vlc" "Multimedia player and streamer"\
    --height=750 --width=700)
;;
6)
clear
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install -y snapd
echo -e "\n"
echo "Вибір програм для встановлення"
echo -e "\n"
sudo snap install $(zenity --list --text="ВИБРАТИ ПРОГРАМИ ДЛЯ ВСТАНОВЛЕННЯ:" \
    --checklist --multiple --column "Вибір" --column "Програма" --separator=" " --column "Опис"\
    FALSE "odrive-unofficial" "OpenDrive(Google Drive)"\
    FALSE "acestreamplayer" "Ace Stream Player"\
    FALSE "snap-store" "snap-store"\
    --height=750 --width=700)
;;
7)
clear
echo -e "\n"
echo "Встановлення Anydesk"
echo -e "\n"
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
sudo sh -c "echo 'deb http://deb.anydesk.com/ all main' > /etc/apt/sources.list.d/anydesk-stable.list"
sudo apt update
sudo apt install -y anydesk
;;
8)
clear
echo -e "\n"
echo -e "Налаштування bash\n"
sed -i '$ a \\nexport PS1="\\[$(tput bold)$(tput setab 7)$(tput setaf 5)\\][\\D{%m/%d/%Y} \\A] \\[$(tput setaf 1)\\]\\u@\\h:\\[$(tput setaf 4)\\]\\w $ \\[$(tput sgr0)\\] "' ~/.bashrc
;;
0)
clear && exit 0
;;
*)
echo -e "\n"
echo "Обрана не правильна дія."
echo -e "\n"

esac

sleep 1 && ./case.sh
