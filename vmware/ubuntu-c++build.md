## ubuntu20.04/22.04 C++ 环境安装
>推荐安装[xubuntu](https://xubuntu.org/)或者[kubuntu](https://kubuntu.org/)，它比gnome的Ubuntu轻量稳定好用得多，追求新的话则推荐使用fedora(它的缺点是，没法安装旧版本的软件，例如GCC，若开发需要特定GCC版本的话，还是使用ubuntu比较方便，同时ubuntu的软件和文档还是比fedora多一些)  
>ubuntu软件列表在[这里](https://packages.ubuntu.com/)  
>开发环境的一键安装脚本请看: src/scripts/ubuntu_install_cpp/

### 基本工具安装
```
sudo apt update
sudo apt install -y vim
sudo apt install -y git
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y universal-ctags
sudo apt install -y clang-format
sudo apt install -y manpages-de  manpages-de-dev  manpages-dev glibc-doc manpages-posix-dev manpages-posix
sudo apt install -y manpages-zh
```

## C++开发环境安装

```
sudo apt install -y build-essential gdb
sudo apt install -y cmake
sudo apt install -y libgtest-dev
```
### 其他可能用到的C库安装

```
sudo apt install -y libudev-dev
sudo apt install -y libblkid-dev
sudo apt install -y libaio-dev
sudo apt install -y libuv1-dev
sudo apt install -y gcovr
```
### 可选工具安装

**图形化的包管理软件:**
```
sudo add-apt-repository -y universe
sudo apt install -y synaptic
```

**google输入法:**

```
sudo apt install -y fcitx-googlepinyin
```
*note: 需要重启系统，才能看到右上角的键盘*

**sudo免密操作**

参考[这里](https://blog.csdn.net/ibless/article/details/119422833)

```
sudo chmod +w /etc/sudoers
sudo vim /etc/sudoers

需要将`%sudo ALL=(ALL:ALL)ALL`改为`%sudo ALL=(ALL:ALL)NOPASSWD:ALL`
或者增加：`%用户名 ALL=(ALL:ALL)NOPASSWD:ALL`
```