 参考[这里](https://blog.csdn.net/u011119817/article/details/110856212)

## 命令行CLI设置方式

### 系统代理设置

我们将在/etc/profile.d/proxy.sh下添加一个shell脚本文件，这将确保设置适用于所有已登录的用户：
```
sudo vim  /etc/profile.d/proxy.sh
```


将以下内容写到文档中：
```
 # set proxy config via profie.d - should apply for all users
export http_proxy="http://10.10.1.10:8080/"
export https_proxy="http://10.10.1.10:8080/"
export ftp_proxy="http://10.10.1.10:8080/"
export no_proxy="127.0.0.1,localhost"
# For curl
export HTTP_PROXY="http://10.10.1.10:8080/"
export HTTPS_PROXY="http://10.10.1.10:8080/"
export FTP_PROXY="http://10.10.1.10:8080/"
export NO_PROXY="127.0.0.1,localhost"

# 将要从代理中排除的其他IP添加到NO_PROXY和no_proxy环境变量中
```

去掉代理，则使用以下配置

```
unset http_proxy
unset https_proxy
unset ftp_proxy
unset no_proxy
# For curl
unset HTTP_PROXY
unset HTTPS_PROXY
unset FTP_PROXY
unset NO_PROXY
```


为该文件填加执行权限：
```
sudo chmod +x  /etc/profile.d/proxy.sh
```

激活文件以开始使用代理设置，或者注销并重新登录，但是最好重启一下机器：

source /etc/profile.d/proxy.sh

查看环境变量进行确认是否生效
```
env | grep -i proxy
```


### APT包管理器代理设置

以上设置适用于应用程序和命令行工具，如果只想为APT包管理器设置代理，请进行如下配置：
```
sudo vim /etc/apt/apt.conf.d/80proxy
```

````
Acquire::http::proxy "http://10.10.1.10:8080/";
Acquire::https::proxy "https://10.10.1.10:8080/";
Acquire::ftp::proxy "ftp://10.10.1.10:8080/";
````
将10.10.1.10替换为代理服务器的正确IP地址，如果需要身份验证，请设置如下：
```
Acquire::http::proxy "http://<username>:<password>@<proxy>:<port>/";
Acquire::https::proxy "https://<username>:<password>@<proxy>:<port>/";
Acquire::ftp::proxy "ftp://<username>:<password>@<proxy>:<port>/";
```


### Wget设置代理

要设置用于wget命令的代理设置，请将它们添加到~/.wgetrc文件中
```
vim ~/.wgetrc
```


写入内容：
```
use_proxy = on

http_proxy = http://10.10.1.10:8080/
https_proxy = http://10.10.1.10:8080/
ftp_proxy = http://10.10.1.10:8080/
```

### 推荐直接在firefox/git/chrome/edge的设置里进行配置代理即可
note: 在firefox里设置代理时，只需要输入ip端口就可以了，不要输入http://