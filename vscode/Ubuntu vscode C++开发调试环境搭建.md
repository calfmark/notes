# ubuntu vscode C++ 开发调试环境安装

如果能用linux发行版桌面环境，推荐使用这种方式去开发和调试linux C++，体验上会比windows wsl2 vscode远程好得多得多

## ubuntu编译调试环境安装
```
sudo apt update

sudo apt install -y build-essential gdb cgdb cmake git

sudo apt-get install -y manpages-dev


// vscode 安装
sudo snap install code
```

## vscode 扩展安装
**必须安装扩展:**
- C/C++
- CMake
- Cmake Tools
- 或者 直接安装 C/C++ Extension Pack 会把上边的所有扩展一键安装

**可选安装插件:**
- C/C++ Themes
- Cpp Reference
- C++ TestMate
- [Tabnine](https://marketplace.visualstudio.com/items?itemName=TabNine.tabnine-vscode)(强烈推荐)
- Doxygen Documentation Generator


若是简单的C++代码调试环境则只需安装 C/C++ Runner 扩展即可

## C++配置
`CTL + SHIFT +P`输入`edit config`， 选择*C/C++:编辑器配置(UI)*
![](/assets/C%2B%2Beditconfig.png)

选择以下配置即可：
![](/assets/C%2B%2Bconfig.png)
会自动在.vscode/目录下生成配置文件c_cpp_properties.json

**debug入参配置**
在launch.json配置文件里配置的args是无法生效的，需要到Cmake Tools的配置里去添加debug配置
![](/assets/cmake-config1.png)
![](/assets/cmake-config2.png)


## 使用方法
可以参考[这里](https://zhuanlan.zhihu.com/p/52874931)
需要忽略某些目录或者文件，可以参考[这里](https://www.jianshu.com/p/b7b25dd499ab),或者在设置里搜索"exclude"在工作区里进行添加忽略的目录或者文件
Tips：launch.json和task.json不用配置，cmake tools调试的时候，会自动生成

## 代码格式化方法

可以参考[这里](https://blog.csdn.net/core571/article/details/82867932)

windows安装扩展C/C++，扩展程序将自动安装clang-format, linux下可以执行一下命令安装

```
sudo apt install -y clang-format
```
**配置**
打开首选项设置（ctrl + ,），搜索format .
可勾选format on save 自动保存
C_Cpp: Clang_format_style 决定格式化形式，若为file，则调用在workspace中的.clang-format
C_Cpp: Clang_format_fallback Style ，若上图变量为file，但无.clang-format文件则按照此处规则
C_Cpp: Clang_format_path 可以设置fortmat命令的路径
![](/assets/clang-format1.png)
![](/assets/clang-format2.png)


**快捷键**
shift+alt+f 文档格式化
ctrl+k ctrl+f 选择快注释
