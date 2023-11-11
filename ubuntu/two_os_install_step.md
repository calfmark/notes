# 联想一体机安装win10和kubuntu双系统

## 主要参考

- [windows10安装ubuntu双系统教程（绝对史上最详细）](https://www.cnblogs.com/masbay/p/10745170.html )


- [win10下安装linux双系统](https://zhuanlan.zhihu.com/p/258106139?utm_source=wechat_session&utm_medium=social&utm_oi=41269644492800)

- [【win10与Ubuntu双系统引导问题】双系统开机无引导项，直接进入win10解决办法](https://blog.csdn.net/qq_42127861/article/details/107416693?utm_medium=distribute.wap_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-4-107416693-blog-105292663.wap_blog_relevant_default&spm=1001.2101.3001.4242.3&utm_relevant_index=5)

- [怎样解决Windows10时间快和Ubuntu时间差问题](https://www.zhihu.com/question/46525639/answer/2422725776?utm_source=wechat_session&utm_medium=social&utm_oi=41269644492800&utm_content=group2_Answer&utm_campaign=shareopn)

## 一、重装win10
若想在c盘上安装kubuntu，c盘只有一个分区的话，只能重装win10，重装时，给c盘进行分区。
### 1. 制作安装win10的U盘
到[这里](https://www.microsoft.com/zh-cn/software-download/windows10)下载制作win10安装U盘工具软件,下载完后，双击打开，插入一个大于8G的U盘，即可制作。 
同时用手机拍一下win10 磁盘管理页面，为的是安装win10时，进行分区来查看，以免误操作，删除了数据盘

### 2. 设置USB启动
重启机器，一直按F12，进入Bios，在启动页，选择“USB启动”，若要删除某个启动项，则选中某个启动项，按字母“x”则可以删除（**注意**：安装完双系统后，这一步，一定不要做，否则bios被改动后，重新启动，KUbuntu会进不去，会直接进到win10。此时，只能用kubuntu的USB启动，配合timeshift去恢复，若没有备份，只能再次重装kubuntu，这是血的教训啊） 
设置完后，保存退出，重启机器

### 3. 安装win10
插入win10的启动U盘，重启机器，进入win10安装页面，重新给C盘进行分区（可以查看之前拍的照片，确定好具体哪个时C盘），分为2个主分区，预留好空间给kubuntu，原先的那些MBR、恢复分区不要动。 
分区好后，开始安装

### 4. 取消快速启动（双系统的关键步骤）
重装完win10后，进入到win10，第一件事就是，取消快速启动。因为只要一设置快速启动，就会自动更改BIOS，所以如果以后也想要有kubuntu引导项，前提是必须一直关闭快速启动这个功能。
设置->电源和睡眠->选择其他电源设置->选择电源按钮功能，进入后点击更改当前不可用的设置->这时候下面那个关机设置就可以进行更改了

### 5. 备份win10
参考[这里](https://m.xitongzhijia.net/news/20210524/211868.html),使用系统的备份机制，进行备份win10，以免以外发生。我是单独在数据盘上，给它单独提供了一个分区进行备份，备份分区大小与win10的C盘大小差不多大


## 二、Kubuntu安装
### 1. 下载最新的 [kubuntu镜像](https://kubuntu.org/getkubuntu/)
### 2. 下载制作kubuntu U盘安装 [工具](https://www.balena.io/etcher/)
### 3. 参考Ubuntu官方的[安装指南](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)

注意：安装时，要手段选择安装分区，要将根目录安装到之前C盘上预留的分区上（查看之前的磁盘照片，以免操作失误），可以给/home目录预留一个分区，再在其他数据盘上给kubuntu预留一个备份分区。/boot分区不用单独提供分区。然后bootloader启动分区，选择根目录的分区即可。 
另外安装时，最好选择英文，要不然选择中文，安装完后，很多目录时中文的，操作比较麻烦，还得改回英文 

### 三、 安装备份工具
```
sudo apt-get install timeshift
```
可以参考[这里](https://zhuanlan.zhihu.com/p/346602946)

### 四、 安装gnome桌面
推荐最小化安装：
```
 sudo apt install gnome-session gdm3
```
完整安装Ubuntu的gnome桌面（不推荐）
```
sudo apt-get install ubuntu-desktop
或者 sudo apt-get install ubuntu-gnome-desktop
```
参考[这里](https://linuxconfig.org/how-to-install-gnome-on-ubuntu-22-04-lts-jammy-jellyfish) 
还参考[这里](https://superuser.com/questions/578082/install-gnome-desktop-in-kubuntu)
参考[这里](https://www.wikihow.com/Install-Gnome-on-Ubuntu#:~:text=How%20to%20Install%20GNOME%20on%20Ubuntu%201%20Open,with%20the%20standard%20applications%20and%20...%20See%20More)

### 五、Grub图形化管理
```
sudo apt install grub-customizer
```
我觉得没必要折腾这个，默认的启动项就可以

参考[这里](https://itsfoss.com/customize-grub-linux/)
参考[这里](https://zhuanlan.zhihu.com/p/100012065?utm_source=ZHShareTargetIDMore&utm_medium=social&utm_oi=41269644492800)

### 六、开发环境搭建
可以参考本项目的src/scripts目录

### 七、Using notify-send with cron 进行休息提醒

```
sudo apt install notify-send
```
在cron中接入

```
30 9-17 * * 1-5 notify-send ["该休息一下啦"] "喝水！伸懒腰！动一动！"
```

```
#!/bin/sh

touch $HOME/.dbus/Xdbus
chmod 600 $HOME/.dbus/Xdbus
env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus

exit 0
```

```
if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi
```
参考[这里](https://unix.stackexchange.com/questions/111188/using-notify-send-with-cron)
参考[这里](https://linux.cn/article-1575-1.html)
参考[这里](https://www.cnblogs.com/daemon369/p/3199830.html)