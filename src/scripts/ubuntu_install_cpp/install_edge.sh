#!/bin/sh

sudo apt update

sudo apt install -y software-properties-common apt-transport-https wget

#Import the Microsoft GPG key with wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

#enable the Edge browser repository
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"

sudo apt install -y microsoft-edge-stable
