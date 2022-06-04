参考自： https://zhuanlan.zhihu.com/p/149501381

## 安装证书
参考 [证书问题](https://blog.csdn.net/q965844841qq/article/details/121482942?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522165339534016782391881171%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fblog.%2522%257D&request_id=165339534016782391881171&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~blog~first_rank_ecpm_v1~rank_v31_ecpm-2-121482942-null-null.nonecase&utm_term=apt&spm=1018.2226.3001.4450)
```
sudo apt update
sudo apt-get install -y ca-certificates
或者手动安装离线包:
cd /tmp
wget http://archive.ubuntu.com/ubuntu/pool/main/c/ca-certificates/ca-certificates_20210119~20.04.2_all.deb
sudo dpkg -i ./ca-certificates_20210119~20.04.2_all.deb

```


## 更新apt为清华源

更新方式，请参考：https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/
```
sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo vim /etc/apt/sources.list , 将此文件清空，然后清华源地址复制到这个文件中
sudo apt update
```
## 安装桌面
可选桌面有: ubuntu-desktop, kubuntu-desktop, xubuntu-desktop, kde-full, xfce4, 只有xfce4试成功，其他的没有操作成功，有时间可以再研究一下

可以使用`sudo apt-cache search <keyword>` 命令查询

`sudo apt install -y xfce4`
推荐选择lightdm显示管理

若默认没有安装，只执行命令安装： `apt install lightdm`
查询当前启动的显示管理：`cat /etc/X11/default-display-manager`
配置lightdm为显示管理: `sudo dpkg-reconfigure lightdm`

安装XRDP
`sudo apt install -y xrdp`

重启 Xrdp 服务，让刚才的设置生效：
`sudo /etc/init.d/xrdp start`

`apt install net-tools`
`使用ifconfig查询机器ip， 然后使用远程桌面输入ip去访问即可`



其他参考：
https://zhuanlan.zhihu.com/p/373773218
https://blog.csdn.net/qq_43878324/article/details/113616883
https://baiyue.one/archives/1658.html
