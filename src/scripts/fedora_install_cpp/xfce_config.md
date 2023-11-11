
# xfce修改显示桌面快捷键

https://cnfczn.com/article/xfce%E4%BF%AE%E6%94%B9%E6%98%BE%E7%A4%BA%E6%A1%8C%E9%9D%A2%E5%BF%AB%E6%8D%B7%E9%94%AE

创建 /user/sbin/show_desktop:

```shell
#!/bin/bash
if xprop -root  _NET_SHOWING_DESKTOP|egrep '= 1' ; then 
  wmctrl -k off ; 
else 
  wmctrl -k on ;
fi
```
然后在快捷键配置里配置win + D 执行此命令