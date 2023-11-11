#!/bin/sh
sudo dnf install dnf-plugins-core -y
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf check-update
sudo dnf install -y microsoft-edge-stable
