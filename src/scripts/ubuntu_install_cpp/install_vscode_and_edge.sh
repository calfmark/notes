#!/bin/sh

sudo apt update

sudo apt install -y software-properties-common apt-transport-https wget

#Import the Microsoft GPG key with wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

#enable the Edge browser repository
#sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"

#sudo apt install -y microsoft-edge-stable

#To enable the VS Code repository
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt install -y code

#kde vscode 将登录信息写入密钥链失败，出现错误,则可以安装gnome-keyring即可
#sudo apt install gnome-keyring

#edge 浏览器不小心设置keyting密码，则可以删除home目录下的keyring目录即可
# rm -rf ~/.keyring
