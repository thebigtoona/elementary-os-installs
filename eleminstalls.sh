#!/bin/bash
# install script for elementary os 
# RUN AS SUPERUSER

# System Utils & Themeing Tools
apt-get update

# Powertop and TLP
echo 'Installing Power Utilities...'
apt-get install -y powertop cpufrequtils tlp

# Start tlp
echo 'Starting TLP'
tlp start

# Disk Utilities
echo 'Installing Disk Utilities'
apt-get install -y gnome-disk-utility gparted

# Software properties common for adding ppas
echo 'Installing Software Properties Common'
apt-get install -y software-properties-common

# Add ppas 
echo 'Adding repositories'
add-apt-repository ppa:philip.scott/elementary-tweaks
add-apt-repository ppa:snwh/pulp
add-apt-repository ppa:dyatlov-igor/la-capitaine
add-apt-repository ppa:yunnxx/elementary

# update
echo 'Updating system...'
apt-get update
## Manuall install for the gtk theme ## 

# Autotools, Autoconf, Dconf, Tweak Tool
themeTweaks=('elementary-tweaks' 'autotools-dev' 'autoconf' 'dconf-tools' 'libgtk-3-dev')
echo 'Installing theme tweaking tools'
apt-get install -y ${themeTweaks[@]}


# GTK 3 Dev Tool and Settings
echo "Cofiguring GTK 3 devtools..."
gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true


# Install Theme Icons/Cursors
echo "Installing custom Cursors/Icons..."
apt-get install -y la-capitaine-cursor-theme paper-icon-theme

## DevTools & Installs 

# Git
echo "Installing Git... "
add-apt-repository ppa:git-core/ppa # apt update; apt install git
apt-get update
apt-get install -y git


# Nodejs
echo "Installing Nodejs... "
wget -qO- https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs build-essential


echo "Installing Snaps... "

# snap
apt-get install -y snapd

# Atom text editor
snap install atom --classic

# Sublime text editor
snap install sublime-text --classic

# VSCode
snap install vscode --classic

# Pycharm
snap install pycharm-community --classic

# VLC
snap install vlc

# Slack
snap install slack --classic

# Discord
snap install discord

# Mailspring
snap install mailspring

# Powershell
snap install powershell --classic

# libreoffice
snap install libreoffice

# Opera
snap install opera

# Chromium
snap install chromium --edge

# FireFox
snap install firefox --edge

# KeepassXC
snap install keepassxc

echo "Install Script finished! Please Reboot!!"
exit 0
