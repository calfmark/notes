#!/bin/bash
sudo dnf install -y vim
sudo dnf install -y git
sudo dnf install -y curl
sudo dnf install -y wget
sudo dnf install -y ctags
sudo dnf install -y clang-tools-extra


#需要重启系统，才能看到右上角的键盘
#sudo dnf install -y fcitx-googlepinyin

#sudo add-dnf-repository -y universe
#sudo dnf install -y syndnfic

#关闭keyring方法：rm ~/.local/share/keyrings/*
#dnf install -y manpages-de  manpages-de-dev  manpages-dev glibc-doc manpages-posix-dev manpages-posix
#dnf install -y manpages-zh
dnf install -y man

#see:https://go.suokunlong.cn:88/wp/linux-fedora-32-ibus-rime-simplified-chinese/
#在"keyboard->input sources"->input sources中，然后找到并添加“中文（Rime）”。添加后，可删除清单里的其他输入法, 重新登录。
#切换输入法到 Rime。此时显示 Rime 正在部署，稍等片刻显示就绪。此时默认是输入繁体中文。
#在输入状态下，按下F4键打开“方案选单”，然后选择“朙月拼音（简化字）”，即可输入简体中文。
#sudo dnf install -y ibus-rime

# xfce install pinyin: https://blog.csdn.net/qq_39213284/article/details/125761341
#sudo dnf install -y ibus ibus-pinyin
#ibus-daemon -d -x -r


## see https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/monitoring-and-automation/Automating_System_Tasks/
sudo dnf -y install cronie cronie-anacron
sudo systemctl enable crond.service

#删除swap
sudo dnf -y remove zram-generator
# 或者
sudo dnf -y remove zram-generator-defaults

#关闭防火墙 /etc/selinux/config
sudo grubby --update-kernel ALL --args selinux=0
sudo systemctl stop firewalld
sudo systemctl disable firewalld

sudo dnf install perf
sudo sh -c 'echo 1 > /proc/sys/kernel/perf_event_paranoid'

#安装xfce桌面环境
dnf install @xfce-desktop-environment

sudo dnf -y update

sudo dnf -y install git-all
git config --global http.sslVerify "false"

sudo dnf remove open-vm-tools-desktop
sudo dnf install open-vm-tools-desktop

#删除没用的软件
#通过软件商店删除不了的软件，可以通过命令行删除
sudo dnf -y remove dnfdragora
sudo dnf -y remove gnumeric
sudo dnf -y remove ristretto
sudo dnf -y remove xfce4-power-manager
sudo dnf -y remove xfburn
sudo dnf -y remove xterm
sudo dnf -y remove system-config-printer.x86_64
sudo dnf -y remove firewall-config
sudo dnf -y remove parole
sudo dnf -y remove seahorse
sudo dnf -y remove pidgin
sudo dnf -y remove pragha
sudo dnf -y remove gnome-abrt
sudo dnf -y remove yelp
sudo dnf -y remove ristretto
sudo dnf -y remove setroubleshoot
sudo dnf -y remove transmission

# 可以安装其他的商店, 比较推荐安装gnome-software, 因为xfce使用的gtk, 需要下载的依赖更少一点
# 但plasma-discover网络速度更快一点
sudo dnf install gnome-software
sudo dnf install plasma-discover

sudo dnf install htop
sudo dnf install -y neofetch
sudo dnf install -y screenfetch

# xfce 去掉蜂鸣声
# https://www.cnblogs.com/fly2wind/p/8486019.html
rmmod pcspkr
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

