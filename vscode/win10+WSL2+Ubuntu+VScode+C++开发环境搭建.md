## 1. WSL2+Ubuntu安装
在win10的PowerShell执行以下命令，具体参考[这里](https://docs.microsoft.com/zh-cn/windows/wsl/install)，推荐安装[windows终端](https://docs.microsoft.com/zh-cn/windows/terminal/install)
`wsl --install`

## 2. ubuntu编译调试环境安装
```
sudo apt update

sudo apt install build-essential gdb

sudo apt-get install manpages-dev
```

## 3. vscode安装
直接从官网[下载](https://code.visualstudio.com/Download)安装包进行安装即可

## 4. vscode C++插件安装
安装以下插件：
* [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
* [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

然后进行以下的C++配置：
`CTL + SHIFT +P`输入`edit config`， 选择*C/C++:编辑器配置(UI)*
![](/assets/C%2B%2Beditconfig.png)

选择以下配置即可：
![](/assets/C%2B%2Bconfig.png)
会自动在.vscode/目录下生成配置文件c_cpp_properties.json

## 5. 从Ubuntu上使用vscode打开开发目录
```
cd /my_c++_dir/
code .
```
即可从window10上用vscode打开Ubuntu的开发目录

## 6. 其他
- 从windows访问Ubuntu上的文件方法，在Ubuntu的目录下执行`explorer.exe .`，就可以在windows上打开Ubuntu上对应的目录
- C++的配置、运行和调试，参考[这里](https://code.visualstudio.com/docs/cpp/introvideos-cpp)，有很详细的介绍，不喜欢看英文的，可以看下边的简要介绍：
    * 创建编译任务的方法：
        1. 打开CPP文件，然后点vscode工具栏的 *终端->配置默认生成任务*，选择*C/C++:g++生成活动文件*，就会在.vscode/目录下生成tasks.json配置文件
        ![](/assets/c%2B%2Btask.png)
        2. 运行编译任务方法：点vscode工具栏的 *终端->运行生成任务*，编译结果文件与CPP文件在同一个目录下
    * 创建debug配置：
        1. 打开CPP文件，然后点vscode工具栏的 *运行->添加配置*, 选择*C++(GDB/LLDB)*,就会在.vscode/目录下生成launch.json配置文件
        ![](/assets/c%2B%2Bgdb.png)
        2. 运行调试，打开CPP文件，然后点vscode工具栏的 *运行->启动调试或者以非调试模式运行*，即可看到调试结果