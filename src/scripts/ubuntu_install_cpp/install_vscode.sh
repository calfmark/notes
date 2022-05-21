#!/bin/sh

sudo apt update

sudo apt install -y  software-properties-common apt-transport-https wget

#use wget to import Microsoft’s GPG key
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

#To enable the VS Code repository
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt install -y code
