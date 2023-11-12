#!/bin/sh
sudo apt update
sudo apt install -y vim
sudo apt install -y git
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y universal-ctags
sudo apt install -y clang-format
sudo apt install -y manpages-de  manpages-de-dev  manpages-dev glibc-doc manpages-posix-dev manpages-posix
sudo apt install -y manpages-zh
sudo apt install -y cgdb

#需要重启系统，才能看到右上角的键盘
# 中文输入法安装
#sudo apt install -y fcitx-googlepinyin

# 参考这里：https://zhuanlan.zhihu.com/p/415648411
# 推荐安装的输入法:
# sudo apt install -y fcitx5 fcitx5-frontend-gtk3 fcitx5-frontend-gtk2 fcitx5-frontend-qt5 fcitx5-chinese-addons kde-config-fcitx5

# 输入法主题：https://github.com/hosxy/Fcitx5-Material-Color
# apt install fcitx5-material-color

#sudo apt install -y open-vm-tools
#sudo apt install -y open-vm-tools-desktop
#sudo mkdir -p /mnt/hgfs
#sudo vmhgfs-fuse .host:/ /mnt/hgfs/
#sudo chmod 777 /mnt/ -R

# install perf
sudo apt install -y linux-tools-common linux-tools-generic linux-tools-`uname -r`
sudo apt install -y valgrind

# install notify-send
# sudo apt install -y libnotify-bin

# 系统信息获取
sudo apt install -y neofetch screenfetch

# ifconfig
sudo apt install -y net-tools

# 鼠标中键灵敏度调整 https://blog.csdn.net/weixin_37697191/article/details/83578814
#sudo apt-get install -y imwheel
#cat << EOF > ~/.imwheelrc
#".*"
#None,      Up,   Button4, 5
#None,      Down, Button5, 5
#Control_L, Up,   Control_L|Button4
#Control_L, Down, Control_L|Button5
#Shift_L,   Up,   Shift_L|Button4
#Shift_L,   Down, Shift_L|Button5
#EOF

#启动imwheel
#imwheel

# heif照片查看器
#https://hritikchaudhary.medium.com/heif-heic-support-for-linux-ubuntu-quick-guide-9a70f4d29352
#https://blog.longwin.com.tw/2021/02/ubuntu-linux-preview-ios-heic-image-package-2021/
#sudo apt install heif-gdk-pixbuf heif-thumbnailer libheif1
#sudo apt install -y heif-gdk-pixbuf
#sudo apt install -y gpicview
# 推荐安装gThumb, 在软件商店里就可以安装
#sudo apt install -y gthumb


# 安装备份软件
#sudo apt install -y timeshift

#https://zhuanlan.zhihu.com/p/100012065?utm_source=ZHShareTargetIDMore&utm_medium=social&utm_oi=41269644492800
#https://itsfoss.com/customize-grub-linux/
#https://unix.stackexchange.com/questions/111188/using-notify-send-with-cron



#sudo add-apt-repository -y universe
#sudo apt install -y synaptic

#关闭keyring方法：rm ~/.local/share/keyrings/*


# fix libc6 install failed
# 这个可能是安装了dpkg导致的，在降级时，千万不能重启，最好的切换到官方源进行update一下
# 尤其是操作libdev库，降级重启，系统必挂
#sudo apt install libc6=2.31-0ubuntu9.2 libc-bin=2.31-0ubuntu9.2

# https://itsfoss.com/install-xfce-desktop-xubuntu/
# 安装纯净版的xfce
#sudo apt install xfce4

# 安装xubuntu的桌面，体积比较大
#sudo apt install xubuntu-desktop
~
#删除swap
# 在/etc/fstab中将swap挂载注释掉
#cat /etc/fstab | grep swap
#sudo sed -e '/swap/ s/^#*/#/' -i /etc/fstab 
#sudo swapon --show
#sudo swapoff -a
#sudo zramctl -r /dev/zram0
#sudo systemctl --type swap
#sudo systemctlsystemctl list-unit-files | grep swap
#sudo systemctl disable dev-zram0.swap
#sudo systemctl disable swap.target
#sudo systemctl disable systemd-cryptsetup@cryptswap.service
#sudo systemctl stop dev-zram0.swap
#sudo systemctl stop swap.target
#sudo systemctl stop systemd-cryptsetup@cryptswap.service
#sudo systemctl mask dev-zram0.swap
#sudo systemctl mask swap.target
#sudo systemctl mask systemd-cryptsetup@cryptswap.service

#以上配置重启后不生效，临时解决办法：在~/.bashrc中加入以下内容：
#swapcnt=`sudo swapon --show | wc -l`
#if [ $swapcnt -ne 0 ];then
#    sudo systemctl stop dev-zram0.swap
#    sudo systemctl stop swap.target
#    sudo systemctl stop systemd-cryptsetup@cryptswap.service
#    sudo swapoff -a
#    sudo zramctl -r /dev/zram0
#fi

