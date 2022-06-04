# 如何将wsl子机安装到某个目录

## 1. 安装wsl
可以参考这里[自动安装](https://docs.microsoft.com/zh-cn/windows/wsl/install)`wsl --install`,
或者 [手动安装](https://docs.microsoft.com/zh-cn/windows/wsl/install-manual)

## 2. 下载安装包

其他版本的安装包下载，可以参考[这里](https://blog.csdn.net/daihaoxin/article/details/115978662)

到[这里](https://docs.microsoft.com/zh-cn/windows/wsl/install-manual)去下载官方提供的离线包，选择自己习惯的版本就行。

下载成功后，将linux包的后缀由.Appx改为.zip，并解压到想要安装到的路径下。
以Ubuntu20为例，解压后的目录如下 ，双击ubuntu2004.exe，等待一会，它会自动在此目录下安装好ubuntu

note: 新版本要解压两次，第一解压后，再里边找到x86-64的安装包重名后再解压，这个才是真正的子机文件夹，可以挪到任意的目录去

## 3. 卸载
参考: [wsl的基本命令](https://docs.microsoft.com/zh-cn/windows/wsl/basic-commands)
在windows命令行下输入注销命令即可，但子机源文件不会被删除
```
wsl --list --verbose
wsl --unregister <DistributionName>
```