#!/bin/sh
# 更新为清华源 https://mirrors.tuna.tsinghua.edu.cn/help/debian/
apt install -y open-vm-tools
apt install -y open-vm-tools-desktop

#重启后，即可设置分辨率和vm共享
mkdir -p  /mnt/hgfs/
vmhgfs-fuse .host:/ /mnt/hgfs/

#安装语言包
apt install -y locales

# 安装的时候，选择了中文，可以按照以下步骤改为英文
# https://blog.csdn.net/newcong0123/article/details/106186807
#配置 locales 软件包
# su - root
#dpkg-reconfigure locales
#按空格键是选择，在界面中钩选上zh_CN.UTF-8 UTF-8， en_US.UTF-8 UTF-8  然后回车，回车代表 OK
#系统默认的区域选择en_US.UTF-8 UTF-8，回车OK，大功告成
#重启后，选择更新名字，要不然很多目录都是中文的，比较难看

#推荐安装Googlepinyin
#https://blog.51cto.com/u_15080019/4368727
#配置fcitx中文输入法
apt install -y fcitx5 fcitx5-pinyin
#接着在im-config(input method)中激活fcitx5作为输入方式
#然后打开fcitx5-configure，配置拼音输入法