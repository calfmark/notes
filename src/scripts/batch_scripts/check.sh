#1 /bin/bash

echo "shell_name=$0"
export LANG=C

#判断上一步骤是否出错
#参数：
#$1：退出时输出到标准输出的数据
test_exitcode()
{
    local exitcode="$?"
    if [ "$exitcode" -ne "0" ]
    then
        echo "exitcode=$exitcode, $1"      
        exit $exitcode
    fi
}
port=""210[0-9][0-9]""

install_path='/usr/local/xxx'
base="$install_path/xxx"

#检查之前是否安装过
if [ -d ${base} ]
then
    echo "${base} exist!, please check"
    #rm -v $pacage_path
    exit -1
fi

if [ -d "/usr/local/xx" ]
then
    echo "apollo ${base} exist!, please check"
    #rm -v $pacage_path
    exit -1
fi

netstat -nlt
nc=`netstat -nlt | awk '{print $4}' | grep -w ${port} | wc -l`;
if [ 0 -ne $nc ];then
    echo " $package_dir listen port ${port} exists, please check!"
    #rm -v $pacage_path
    exit -2
fi

#检查磁盘是否有文件系统 
ls /dev/sd* | grep -v sda | grep 1
disk_cnt=`ls /dev/sd* | grep -v sda | grep 1 | wc -l`
if [ $disk_cnt -ne 0 ];then
    echo "strorage disk has file system, please check!"
    exit -2
fi

df -h | tail -n +2| grep -v sda | grep -v Filesystem | grep -v tmpfs
mount_num=`df -h | grep -v sda | grep -v Filesystem | grep -v tmpfs | wc -l`
if [ $mount_num -ne 0 ];then
    echo "strorage disk has file system, please check!"
    exit -3
fi
exit 0
