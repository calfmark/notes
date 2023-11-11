#!/bin/sh

#install gcc9 : https://www.cnblogs.com/yuyw/p/15907455.html?share_token=80538574-58d6-43ed-a251-3e41b775dff5&tt_from=copy_link&utm_source=copy_link&utm_medium=toutiao_android&utm_campaign=client_share?=
yum install centos-release-scl -y && yum install devtoolset-9-gcc*  -y && scl enable devtoolset-9 bash
echo "source /opt/rh/devtoolset-9/enable" >>/etc/profile
gcc -v

source /opt/rh/devtoolset-9/enable
scl enable devtoolset-9 bash;

#install git: https://cloud.tencent.com/developer/article/1590046
sudo yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel  perl-ExtUtils-MakeMaker

wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.37.0.tar.gz --no-check-certificate
tar -xzf   git-2.37.0.tar.gz
cd git-2.37.0/
./configure prefix=/usr/local/git/
sudo make && sudo make install
sudo echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/profile
source /etc/profile
/usr/bin/git

#install cmake
sudo yum remove cmake -y
sudo yum install -y cmake3.x86_64 
sudo ln -s /usr/bin/cmake3 /usr/bin/cmake

#vscode : https://code.visualstudio.com/docs/setup/linux
sudo yum -y install valgrind

#install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum check-update
sudo yum install code

#中文输入法：Centos7.0-KDE 启动中文输入法_hzrnice的博客-CSDN博客_centos7 kde 输入法
#Centos7.0 KDE 桌面版，其实安装了ibus，不过默认没有启动。在程序搜索中搜索 im-chooser ，将出现 input method selector。启动该程序，即可启动 ibus，在ibus中设置输入法切换快捷键以及添加中文拼音输入法。即可使用ibus，而且设置后ibus将随开机启动。

# 安装谷歌中文输入法：linux安装谷歌中文,CentOS 7安装谷歌拼音中文输入法_weixin_39924198的博客-CSDN博客

#CentOS7系统安装KDE后显示为中文语言的修改方法
#https://m.html.cn/system/unix/11124041315025.html
yum install kde-l10n-Chinese.noarch


# install tcmalloc
echo "build and install tcmalloc"
# https://blog.csdn.net/bandaoyu/article/details/108630996
#https://github.com/gperftools/gperftools/releases/
wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.10/gperftools-2.10.tar.gz
tar -xzf gperftools-2.10.tar.gz
cd gperftools-2.10/
#./configure --disable-cpu-profiler --disable-heap-profiler --disable-heap-checker --disable-debugalloc --enable-minimal --disable-shared
#cd build && cmake .. -Dgperftools_enable_libunwind=OFF -Dgperftools_enable_frame_pointers=ON
mkdir -p build && cd build && cmake .. -DDEFAULT_BUILD_CPU_PROFILER=OFF -DDEFAULT_BUILD_HEAP_PROFILER=OFF -DDEFAULT_BUILD_HEAP_CHECKER=OFF -DDEFAULT_BUILD_DEBUGALLOC=OFF -Dgperftools_enable_libunwind=OFF
make clean && make && make install

echo "/usr/local/lib64/" > /etc/ld.so.conf.d/build_nbs_osd.conf
ldconfig

#g++ mytest.cpp -o mytest1 -lpthread
#g++ mytest.cpp  -lpthread -L./.libs/ -ltcmalloc_minimal -static -o mytest2

echo "build prometheus-cpp."
#https://github.com/jupp0r/prometheus-cpp/releases
wget https://github.com/jupp0r/prometheus-cpp/archive/refs/tags/v1.0.1.tar.gz
tar -zxf v1.0.1.tar.gz
pushd prometheus-cpp
mkdir build
pushd build
cmake .. -DBUILD_SHARED_LIBS=ON -DENABLE_COMPRESSION=OFF -DENABLE_PUSH=OFF
make && make install
popd
rm -rf ./build
popd

echo "build and install libuv"
#https://dist.libuv.org/dist/
#http://docs.libuv.org/en/v1.x/#
#wget https://dist.libuv.org/dist/v1.39.0/libuv-v1.39.0.tar.gz
tar -xzf libuv-v1.39.0.tar.gz
cd libuv/ && mkdir -p build && cd build && cmake ..
make clean && make -j 6 && make install

#https://github.com/intel/isa-l
echo "build and install isal"
cd isa-l/ && ./autogen.sh && ./configure
make clean && make -j 6 && make install