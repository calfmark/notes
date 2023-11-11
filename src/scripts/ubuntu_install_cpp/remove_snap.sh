#!/bin/bash

# 参考: https://zhuanlan.zhihu.com/p/511438456?utm_medium=social&utm_oi=41269644492800&utm_psn=1550941961502253057&utm_source=wechat_session&utm_id=0
sudo snap list
sudo snap remove --purge firefox
sudo snap remove --purge snap-store
sudo snap remove --purge gnome-3-38-2004
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge snapd-desktop-integration
sudo snap remove --purge bare
sudo snap remove --purge core20
#sudo snap remove --purge core
sudo snap remove --purge core18
sudo snap remove --purge snapd
sudo apt autoremove -y --purge snapd

cat <<EOF | tee /etc/apt/preferences.d/nosnap.pref
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

cat <<EOF | tee /etc/apt/preferences.d/mozillateamppa
Package: firefox*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 501
EOF

sudo apt update

sudo apt install -y --install-suggests gnome-software

sudo add-apt-repository ppa:mozillateam/ppa
sudo apt install -y -t 'o=LP-PPA-mozillateam' firefox

# firfox开启自动更新
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox


