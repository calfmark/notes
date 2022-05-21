#!/bin/sh
sudo dnf install -y vim
sudo dnf install -y git
sudo dnf install -y curl
sudo dnf install -y wget
sudo dnf install -y ctags
sudo dnf install -y clang-tools-extra
sudo dnf install -y man
sudo dnf -y install cronie cronie-anacron
sudo systemctl enable crond.service
sudo dnf install -y ibus-rime
