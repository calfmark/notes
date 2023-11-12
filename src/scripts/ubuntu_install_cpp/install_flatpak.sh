#!/bin/bash

# 参考: https://flatpak.org/setup/Ubuntu

sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# reboot
