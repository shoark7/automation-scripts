#!/bin/sh

# This script is for setting up a ubuntu aws instance automatically.
# It does like below
#   1. locale gen for korean like me.
#   2. install nginx andppython3
#   3. Grap my .vimrc configurations and install it in this instance.
#
# But this file is not complete because some confirmation message pops out
# and blocks installation process.
#
# Last modified : 2017/11/25



# Initialization
clear
echo "Initialize a instance"
sudo apt-get update -q --yes --force-yes
sudo apt-get upgrade -q --yes --force-yes
sudo locale-gen ko_KR.UTF-8

echo '\n\n#Custom configuration for python3' >> ~/.bashrc
echo 'export LANG=ko_KR.UTF-8\nexport LC_ALL=C' >> ~/.bashrc
echo 'alias python=python3' >> ~/.bashrc
echo 'alias pip=pip3' >> ~/.bashrc
sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime



echo "Initialization ended"


# Installation
clear
echo "Install necessary programs like nginx, pip, etc"
sudo apt-get install -q --yes --force-yes nginx
sudo apt-get install -q --yes --force-yes python3-pip
pip3 install -q uwsgi django virtualenv


echo "Installing has ended"

# Customization part
## vim setting
clear
echo "Customization like vim setting start"
curl https://raw.githubusercontent.com/shoark7/Daily-practice/master/others/.vimrc > ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c VundleUpdate -c quitall


source ~/.bashrc
echo "Customization ended"
