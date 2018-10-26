#!/bin/bash
# install script for elementary os 
# RUN AS SUPERUSER

# System Utils & Themeing Tools
apt-get update

# Software properties common for adding ppas
echo 'Installing Software Properties Common'
apt-get install -y software-properties-common

# Add ppas 
echo 'Adding PPA repositories'
add-apt-repository ppa:philip.scott/elementary-tweaks
add-apt-repository ppa:snwh/pulp
add-apt-repository ppa:dyatlov-igor/la-capitaine
add-apt-repository ppa:yunnxx/elementary
add-apt-repository ppa:a-v-shkop/chromium
add-apt-repository ppa:phoerious/keepassxc
add-apt-repository ppa:libreoffice/ppa
add-apt-repository ppa:gezakovacs/ppa
add-apt-repository ppa:mystic-mirage/pycharm


# update
echo 'Updating system...'
apt-get update


# Powertop and TLP
echo 'Installing Power Utilities...'
apt-get install -y powertop cpufrequtils tlp

# Start tlp
echo 'Starting TLP'
tlp start

# Disk Utilities
echo 'Installing Disk Utilities, wget and gdebi core'
apt-get install -y gnome-disk-utility gparted gdebi-core wget

# Unetbootin & clonezilla 
apt-get install -y unetbootin clonezilla

# If running Juno manually install elementary-eosmilky-theme
# Autotools, Autoconf, Dconf, Tweak Tool
themeTweaks=('elementary-tweaks' 'autotools-dev' 'autoconf' 'dconf-tools' 'libgtk-3-dev')
echo 'Installing theme tweaking tools'
apt-get install -y ${themeTweaks[@]}


# GTK 3 Dev Tool and Settings
echo "Cofiguring GTK 3 devtools..."
gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true


# Install Theme Icons/Cursors
echo "Installing custom Cursors/Icons..."
apt-get install -y la-capitaine-cursor-theme paper-icon-theme elementary-eosmilky-theme

## DevTools & App Installs 

# Git
echo "Installing Git... "
add-apt-repository ppa:git-core/ppa # apt update; apt install git
apt-get update
apt-get install -y git

# Nodejs
echo "Installing Nodejs... "
wget -qO- https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs build-essential

# Chromium
echo "Installing chromium, keepassxc, libreoffice, sublime, and pycharm"
apt-get install -y chromium-browser keepassxc libreoffice sublime-text pycharm-community

echo "Installing Snaps... "

# snap
apt-get install -y snapd

# Atom text editor
snap install atom --classic

# VSCode
snap install vscode --classic

# VLC
snap install vlc

# Slack
snap install slack --classic

# Discord
snap install discord

# Powershell
snap install powershell --classic

# Opera
snap install opera

# FireFox
snap install firefox --edge

# Mailspring
echo "Installing Mailspring. PROMPT REQUIRED... "
wget -O ~/mailspring.deb "https://updates.getmailspring.com/download?platform=linuxDeb"
gdebi ~/mailspring.deb  # requires prompt
rm -r ~/mailspring.deb

echo "Removing some preinstalled crap.."
apt purge pantheon-mail

echo "Install Script finished! Please Reboot!!"
exit 0
