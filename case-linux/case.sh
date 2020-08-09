#!/bin/bash
# ╨и╨░╨┐╨║╨░-╨║╨╛╤Б╤В╨╕╨╗╤М, ╨╜╤Ц╤З╨╛╨│╨╛ ╨╜╨╡ ╨▓╨╕╨║╨╛╤А╨╕╤Б╤В╨╛╨▓╤Г╤Ф╤В╤М╤Б╤П.
ROOT_UID=0 #╨Ы╨╕╤И╨╡ ╨║╨╛╤А╨╕╤Б╤В╤Г╨▓╨░╤З ╨╖ $UID 0 ╨╝╨░╤Ф ╨┐╤А╨░╨▓╨░ root.
E_XCD=86 #╨Э╨╡╨╝╨╛╨╢╨╗╨╕╨▓╨╛ ╨╖╨╝╤Ц╨╜╨╕╤В╨╕ ╨┤╨╕╤А╨╡╨║╤В╨╛╤А╤Ц╤О?
E_NOTROOT=87 #╨Т╨╕╤Е╤Ц╨┤ ╨╖ ╨┐╨╛╨╝╨╕╨╗╨║╨╛╤О "╨╜╨╡ root".

clear
echo "╨Т╨░╤А╤Ц╨░╨╜╤В╨╕ ╨╖╨░╨┐╤Г╤Б╨║╤Г:"
echo "==========================================================="
echo -e "*\t[1] ╨Ч╨░╨┤╨░╤В╨╕ ╨┐╤А╨╛╨║╤Б╤Ц                                 *"
echo -e "*\t[2] ╨Ю╤З╨╕╤Б╤В╨╕╤В╨╕ ╨┐╤А╨╛╨║╤Б╤Ц                               *"
echo -e "*\t[3] ╨Ю╨╜╨╛╨▓╨╕╤В╨╕ ╤Б╨╕╤Б╤В╨╡╨╝╤Г                               *"
echo -e "*\t[4] ╨Ю╤З╨╕╤Б╤В╨╕╤В╨╕ ╨║╨╡╤И apt ╤В╨░ ╨▓╨╕╨┤╨░╨╗╨╕╤В╨╕ ╨╖╨░╤Б╤В╨░╤А╤Ц╨╗╤Ц ╤Д╨░╨╣╨╗╨╕  *"
echo -e "*\t[5] ╨Ф╨╛╨┤╨░╤В╨╕ ╤А╨╡╨┐╨╛╨╖╨╕╤В╨╛╤А╤Ц╤Ч                            *"
echo -e "*\t[6] ╨Т╨╕╨▒╤Ц╤А ╨┐╤А╨╛╨│╤А╨░╨╝ ╨┤╨╗╤П ╨▓╤Б╤В╨░╨╜╨╛╨▓╨╗╨╡╨╜╨╜╤П                *"
echo -e "*\t[7] ╨г╤Б╤В╨░╨╜╨╛╨▓╨║╨░ dropbox ╨┤╨╗╤П elementary os           *"
echo -e "*\t[8] ╨г╤Б╤В╨░╨╜╨╛╨▓╨║╨░ teamviewer                          *"
echo -e "*\t[0] ╨Т╨╕╤Е╤Ц╨┤                                         *"
echo -e "===========================================================\n"
echo -n "╨Ю╨▒╤А╨░╤В╨╕ ╨▓╨░╤А╤Ц╨░╨╜╤В: "; read doing

case $doing in
1)
clear
echo -e "\n"
#cp ~/.bashrc ~/.bashrc.bak
sudo cp /etc/sudoers /etc/sudoers.bak
sudo cp /etc/wgetrc /etc/wgetrc.bak
sudo cp /etc/environment /etc/environment.bak
echo -n "╨Т╨▓╨╡╤Б╤В╨╕ ╨┐╤А╨╛╨║╤Б╤Ц ╤Г ╤Д╨╛╤А╨╝╨░╤В╤Ц http://╨┐╤А╨╛╨║╤Б╤Ц : "; read PURL
echo -n "╨Т╨▓╨╡╤Б╤В╨╕ ╨┐╨╛╤А╤В ╨┐╤А╨╛╨║╤Б╤Ц : "; read PPRT
echo -e "\n"
#echo "╨Э╨░╨╗╨░╤И╤В╤Г╨▓╨░╨╜╨╜╤П ╨┐╤А╨╛╨║╤Б╤Ц-╤Б╨╡╤А╨▓╨╡╤А╨░ ╨┐╤А╨╛╨┐╨╕╤Б╨░╨╜╤Ц ╤Г .bashrc"
#echo -e "#########╨Ч╨╝╤Ц╨╜╨╡╨╜╨╛ ╨п#########\nexport http_proxy=\"$PURL:$PPRT/\"\nexport https_proxy=\"$PURL:$PPRT/\"\nexport ftp_proxy=\"$PURL:$PPRT/\"" >> ~/.bashrc
echo "╨Э╨░╨╗╨░╤И╤В╤Г╨▓╨░╨╜╨╜╤П ╨┐╤А╨╛╨║╤Б╤Ц-╤Б╨╡╤А╨▓╨╡╤А╨░ ╨┐╤А╨╛╨┐╨╕╤Б╨░╨╜╤Ц ╤Г /etc/environment"
sudo sh -c "echo '\n#########╨Ч╨╝╤Ц╨╜╨╡╨╜╨╛ ╨п#########\nhttp_proxy=\"$PURL:$PPRT/\"\nhttps_proxy=\"$PURL:$PPRT/\"\nftp_proxy=\"$PURL:$PPRT/\"\nHTTP_PROXY=\"$PURL:$PPRT/\"\nHTTPS_PROXY=\"$PURL:$PPRT/\"\nFTP_PROXY=\"$PURL:$PPRT/\"' >> /etc/environment"
echo "╨Э╨░╨╗╨░╤И╤В╤Г╨▓╨░╨╜╨╜╤П ╨┐╤А╨╛╨║╤Б╤Ц-╤Б╨╡╤А╨▓╨╡╤А╨░ ╨┐╤А╨╛╨┐╨╕╤Б╨░╨╜╤Ц ╤Г /etc/wgetrc"
sudo sh -c "echo '\n#########╨Ч╨╝╤Ц╨╜╨╡╨╜╨╛ ╨п#########\nhttps_proxy = $PURL:$PPRT/\nhttp_proxy = $PURL:$PPRT/\nftp_proxy = $PURL:$PPRT/\nuse_proxy = on' >> /etc/wgetrc"
echo "╨Э╨░╨╗╨░╤И╤В╤Г╨▓╨░╨╜╨╜╤П ╨┐╤А╨╛╨║╤Б╤Ц-╤Б╨╡╤А╨▓╨╡╤А╨░ ╨┐╤А╨╛╨┐╨╕╤Б╨░╨╜╤Ц ╤Г /etc/sudoers"
sudo sh -c "echo '\n#########╨Ч╨╝╤Ц╨╜╨╡╨╜╨╛ ╨п#########\nDefaults env_keep += \"http_proxy https_proxy ftp_proxy all_proxy no_proxy\"' >> /etc/sudoers"
echo -e "╨Э╨░╨╗╨░╤И╤В╤Г╨▓╨░╨╜╨╜╤П ╨┐╤А╨╛╨║╤Б╤Ц-╤Б╨╡╤А╨▓╨╡╤А╨░ ╨┐╤А╨╛╨┐╨╕╤Б╨░╨╜╤Ц ╤Г /etc/apt/apt.conf.d/02proxy\n"
sudo sh -c "echo '\n#########╨Ч╨╝╤Ц╨╜╨╡╨╜╨╛ ╨п#########\nAcquire::http::Proxy \"$PURL:$PPRT\";' > /etc/apt/apt.conf.d/02proxy"
;;
2)
clear
echo -e "\n"
echo "╨Ю╤З╨╕╤Й╨╡╨╜╨╜╤П ╨╜╨░╨╗╨░╤И╤В╤Г╨▓╨░╨╜╤М ╨┐╤А╨╛╨║╤Б╤Ц"
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
echo "╨Ю╨╜╨╛╨▓╨╗╨╡╨╜╨╜╤П ╨┤╨╕╤Б╤В╤А╨╕╨▒╤Г╤В╨╕╨▓╤Г"
echo -e "\n"
sudo apt update && sudo apt -y dist-upgrade
;;
4)
clear
echo -e "\n"
echo "╨Ю╤З╨╕╤Й╨╡╨╜╨╜╤П ╨┤╨╕╤Б╤В╤А╨╕╨▒╤Г╤В╨╕╨▓╤Г"
echo -e "\n"
sudo apt -y clean && sudo apt -y autoremove
;;
5)
clear
echo -e "\n"
echo "╨Т╨╕╨▒╤Ц╤А ╨┤╨╛╨┤╨░╤В╨║╨╛╨▓╨╕╤Е ╤А╨╡╨┐╨╛╨╖╨╕╤В╨╛╤А╤Ц╤Ч╨▓"
echo -e "\n"
sudo apt -y install software-properties-common python3-software-properties python-software-properties
sudo add-apt-repository -y $(zenity --list --text="╨Т╨Ш╨С╨а╨Р╨в╨Ш ╨а╨Х╨Я╨Ю╨Ч╨Ш╨в╨Ю╨а╨Ж╨Щ ╨Ф╨Ы╨п ╨Я╨Ж╨Ф╨Ъ╨Ы╨о╨з╨Х╨Э╨Э╨п:" \
    --checklist --multiple --column "╨Т╨╕╨▒╤Ц╤А" --column "╨а╨╡╨┐╨╛╨╖╨╕╤В╨╛╤А╤Ц╨╣" --separator=" " --column "╨Ю╨┐╨╕╤Б"\
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
echo "╨Т╨╕╨▒╤Ц╤А ╨┐╤А╨╛╨│╤А╨░╨╝ ╨┤╨╗╤П ╨▓╤Б╤В╨░╨╜╨╛╨▓╨╗╨╡╨╜╨╜╤П"
echo -e "\n"
sudo apt -y install $(zenity --list --text="╨Т╨Ш╨С╨а╨Р╨в╨Ш ╨Я╨а╨Ю╨У╨а╨Р╨Ь╨Ш ╨Ф╨Ы╨п ╨Т╨б╨в╨Р╨Э╨Ю╨Т╨Ы╨Х╨Э╨Э╨п:\n * - ╨▓╨╕╨╝╨░╨│╨░╤Ф ╨┐╤Ц╨┤╨║╨╗╤О╤З╨╡╨╜╨╜╤П ╨┤╨╛╨┤╨░╤В╨║╨╛╨▓╨╛╨│╨╛ ╤А╨╡╨┐╨╛╨╖╨╕╤В╨╛╤А╤Ц╤О" \
    --checklist --multiple --column "╨Т╨╕╨▒╤Ц╤А" --column "╨Я╤А╨╛╨│╤А╨░╨╝╨░" --separator=" " --column "╨Ю╨┐╨╕╤Б"\
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
    FALSE "telegram-purple" "╨Ь╨╛╨┤╤Г╨╗╤М telegram ╨┤╨╗╤П pidgin"\
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
echo "╨Т╤Б╤В╨░╨╜╨╛╨▓╨╗╨╡╨╜╨╜╤П dropbox ╨┤╨╗╤П elementary os"
echo -e "\n"
git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
bash /tmp/elementary-dropbox/install.sh -n
;;
8)
clear
echo -e "\n"
echo "╨Т╤Б╤В╨░╨╜╨╛╨▓╨╗╨╡╨╜╨╜╤П teamviewer"
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
echo "╨Ю╨▒╤А╨░╨╜╨░ ╨╜╨╡ ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╨░ ╨┤╤Ц╤П."
echo -e "\n"

esac

sleep 10 && ./case.sh
