#!/bin/bash
# Шапка-костиль, нічого не використовується.
ROOT_UID=0 #Лише користувач з $UID 0 має права root.
E_XCD=86 #Неможливо змінити директорію?
E_NOTROOT=87 #Вихід з помилкою "не root".

clear
echo "Варіанти запуску:"
echo "==========================================================="
echo -e "*\t[1] Задати проксі                                 *"
echo -e "*\t[2] Очистити проксі                               *"
echo -e "*\t[3] Оновити систему                               *"
echo -e "*\t[4] Очистити кеш apt та видалити застарілі файли  *"
echo -e "*\t[5] Додати репозиторії                            *"
echo -e "*\t[6] Вибір програм для встановлення                *"
echo -e "*\t[7] Установка dropbox для elementary os           *"
echo -e "*\t[8] Установка teamviewer                          *"
echo -e "*\t[0] Вихід                                         *"
echo -e "===========================================================\n"
echo -n "Обрати варіант: "; read doing

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
sudo apt update && sudo apt -y dist-upgrade 
;;
4)
clear
echo -e "\n"
echo "Очищення дистрибутиву"
echo -e "\n"
sudo apt -y clean && sudo apt -y autoremove
;;
5)
clear
echo -e "\n"
echo "Вибір додаткових репозиторіїв"
echo -e "\n"
sudo apt -y install software-properties-common python3-software-properties python-software-properties
sudo add-apt-repository -y $(zenity --list --text="ВИБРАТИ РЕПОЗИТОРІЙ ДЛЯ ПІДКЛЮЧЕННЯ:" \
    --checklist --multiple --column "Вибір" --column "Репозиторій" --separator=" " --column "Опис"\
    FALSE "ppa:atareao/atareao" "my weather indicator"\
    FALSE "ppa:philip.scott/elementary-tweaks" "elementary-tweaks"\
    FALSE "ppa:otto-kesselgulasch/gimp-edge" "gimp beta"\
    FALSE "ppa:alessandro-strada/ppa" "google drive"\
    --height=750 --width=700)
sudo apt update
;;
6)
clear
echo -e "\n"
echo "Вибір програм для встановлення"
echo -e "\n"
sudo apt -y install $(zenity --list --text="ВИБРАТИ ПРОГРАМИ ДЛЯ ВСТАНОВЛЕННЯ:\n * - вимагає підключення додаткового репозиторію" \
    --checklist --multiple --column "Вибір" --column "Програма" --separator=" " --column "Опис"\
    FALSE "aptitude" "High-level interface to the package manager"\
    FALSE "audacity" "Graphical cross-platform audio editor"\
    FALSE "baobab" "GNOME disk usage analyzer"\
    FALSE "calibre" "E-book converter and library management"\
    FALSE "clipit" "Lightweight GTK+ Clipboard Manager"\
    FALSE "easytag" "Tag editor for MP3, Ogg Vorbis files and more"\
    FALSE "elementary-tweaks" "* Change hidden desktop settings"\
    FALSE "firefox" "A free and open source web browser from Mozilla"\
    FALSE "gimp" "An image manipulation and paint program"\
    FALSE "glances" "Curses-based monitoring tool"\
    FALSE "gnome-nettool" "Network information tool for GNOME"\
    FALSE "google-drive-ocamlfuse" "FUSE filesystem backed by Google Drive"\
    FALSE "libreoffice" "LibreOffice office suite"\
    FALSE "mc" "Visual shell for Unix-like systems"\
    FALSE "minitube" "Native YouTube client"\
    FALSE "my-weather-indicator" "* Get weather information for your town with My-Weather-Indicator"\
    FALSE "pidgin" "Instant Messaging client"\
    FALSE "remmina" "Remote desktop client for GNOME desktop environment"\
    FALSE "samba" "SMB/CIFS file, print, and login server for Unix"\
    FALSE "ssh" "OpenSSH SSH client (Remote login program)"\
    FALSE "telegram-purple" "Модуль telegram для pidgin"\
    FALSE "qbittorrent" "Bittorrent client based on libtorrent-rasterbar with a Qt4 GUI"\
    FALSE "ubuntu-restricted-extras" "Commonly used media codecs and fonts for Ubuntu"\
    FALSE "virtualbox" "x86 virtualization solution"\
    FALSE "virtualbox-guest-additions-iso" "Guest additions iso image for VirtualBox"\
    FALSE "vlc" "Multimedia player and streamer"\
    --height=750 --width=700)
;;
7)
clear
echo -e "\n"
echo "Встановлення dropbox для elementary os"
echo -e "\n"
git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
bash /tmp/elementary-dropbox/install.sh -n
;;
8)
clear
echo -e "\n"
echo "Встановлення teamviewer"
echo -e "\n"
sudo dpkg --add-architecture i386
sudo apt update
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i teamviewer_amd64.deb
sudo apt -y install -f
;;
0)
clear && exit 0
;;
*)
echo -e "\n"
echo "Обрана не правильна дія."
echo -e "\n"

esac

sleep 10 && ./case.sh