#!/bin/sh
sudo dnf install -y vim
sudo dnf install -y git
sudo dnf install -y curl
sudo dnf install -y wget
sudo dnf install -y clang-tools-extra
sudo dnf install -y man

#https://www.jianshu.com/p/4fef02b70d34
sudo dnf install -y ibus-libpinyin.x86_64

# https://snapcraft.io/install/universal-ctags/rhel
# https://zhuanlan.zhihu.com/p/102033129
# http://rpmfind.net/linux/rpm2html/search.php?query=ctags%28x86-64%29&submit=Search+...&system=&arch=
# http://rpmfind.net/linux/epel/9/Everything/x86_64/Packages/c/ctags-5.9-6.20220508.0.el9.x86_64.rpm
wget http://rpmfind.net/linux/epel/9/Everything/x86_64/Packages/c/ctags-5.9-6.20220508.0.el9.x86_64.rpm
sudo dnf localinstall ctags-5.9-6.20220508.0.el9.x86_64.rpm