#!/usr/bin/env bash

# ----------------------------- VARIÁVEIS ----------------------------- #
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_SKYPE="https://go.skype.com/skypeforlinux-64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"
# ---------------------------------------------------------------------- #

# ----------------------------- REQUISITOS ----------------------------- #
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Atualizando o repositório ##
sudo apt update -y

## Substituindo snap por .deb ##
snap remove gnome-calculator gnome-characters gnome-logs 
sudo apt install gnome-calculator gnome-characters gnome-logs -y

## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_SKYPE"		   -P "$DIRETORIO_DOWNLOADS"
# ----------------------------- EXECUÇÃO ----------------------------- #

## Instalando codecs ##
sudo apt install ubuntu-restricted-extras -y
sudo apt install ttf-mscorefonts-installer -y

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

## Instalando pacotes e programas do repositório deb do Ubuntu  ##
sudo apt install python3 python-pip nautilus-dropbox flatpak gnome-software-plugin-flatpak gnome-sushi gnome-tweaks gnome-weather chrome-gnome-shell htop neofetch conky vim gufw darktable krita shotwell vlc owncloud-client thunderbird thunderbird-locale-pt-br thunderbird-gnome-support gimp transmission deja-dup virtualbox flameshot net-tools -y

## Adicionando repositório Flathub ##
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

## Instalando pacotes Snap ##
#sudo snap install spotify &&
#sudo snap install wps-office-multilang && 

## Libre Office##
sudo apt install libreoffice-base-core libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-writer libreoffice-l10n-pt-br  libreoffice-help-pt-br hyphen-pt-br libreoffice-gnome -y

##Instalando pacotes Flatpak ##
#sudo flatpak install flathub com.obsproject.Studio -y &&
#sudo flatpak install flathub com.sublimetext.three -y &&
sudo flatpak install flathub fondo -y

##Instalar gnome extensions ##
# Sound Input & Output Device Chooser
# OpenWeather
# Removable Drive Menu

# ---------------------------------------------------------------------- #
##Instalar Conky ##
sudo rm /etc/conky/conky.conf 
sudo cp conky* /etc/conky/conky.conf

---------------------------------------------------------------------- #
##Instalar Spotiy ##
sudo curl -sS https://download.spotify.com/debian/pubkey.gpg
sudo apt-key add - 
sudo echo "deb http://repository.spotify.com stable non-free" 
sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
rm -R "$DIRETORIO_DOWNLOADS"
reboot
# ---------------------------------------------------------------------- #
