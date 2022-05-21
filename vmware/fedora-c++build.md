## fedora36 C++ 环境安装
>dnf命令请参考[这里](https://wangchujiang.com/linux-command/c/dnf.html)  
>开发环境的一键安装脚本请看: src/scripts/fedora_install_cpp/  
>fedora支持的软件列表请查看[这里](https://packages.fedoraproject.org/)，软件源在[这里](https://src.fedoraproject.org/)  

### 更新系统包

```
sudo dnf update --refresh -y
sudo dnf install -y dnf-plugins-core
```
### 基本工具安装
```
sudo dnf install -y vim
sudo dnf install -y git
sudo dnf install -y curl
sudo dnf install -y wget
sudo dnf install -y ctags
sudo dnf install -y clang-tools-extra
sudo dnf install -y man
```
crontab安装参考[这里](https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/monitoring-and-automation/Automating_System_Tasks/)
```
sudo dnf -y install cronie cronie-anacron
sudo systemctl enable crond.service
```
## C++开发环境安装
```
sudo dnf install -y gcc-c++
sudo dnf install -y gdb
sudo dnf install -y cmake
```
## gtest install
方法1：
```
sudo dnf install -y gtest-devel
```
方法2：
```
cd /tmp
git clone https://github.com/google/googletest
cd googletest
mkdir build
cd build
cmake ../
make -j 8
sudo make install
```
###其他可能用到的C库安装
```
sudo dnf install -y libudev-devel
sudo dnf install -y libblkid-devel
sudo dnf install -y libaio-devel
sudo dnf install -y libuv-devel
sudo dnf install -y libuuid libuuid-devel
sudo dnf install -y gcovr
```

###可选工具安装
**中文输入法:**
```
sudo dnf install -y ibus-rime
```
参考[这里](https://go.suokunlong.cn:88/wp/linux-fedora-32-ibus-rime-simplified-chinese/)
在"keyboard->input sources"->input sources中，然后找到并添加“中文（Rime）”。添加后，可删除清单里的其他输入法, 重新登录。
切换输入法到 Rime。此时显示 Rime 正在部署，稍等片刻显示就绪。此时默认是输入繁体中文。
在输入状态下，按下F4键打开“方案选单”，然后选择“朙月拼音（简化字）”，即可输入简体中文。


**vscode安装:**
参考[这里](https://computingforgeeks.com/install-visual-studio-code-on-fedora/)
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

cat <<EOF | sudo tee /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo dnf check-update

sudo dnf install -y code
```

**edge安装:**
参考[这里](https://www.linuxcapable.com/how-to-install-microsoft-edge-on-fedora-34-35/)
```
sudo dnf install dnf-plugins-core -y
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf check-update
sudo dnf install -y microsoft-edge-stable
```
*note:如果不小心开启了edge浏览器的keyring，则关闭keyring方法为：`rm ~/.local/share/keyrings/*`*