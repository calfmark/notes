#!/bin/sh

dir="/dev/fuse"
./fexist.sh $dir "root" "xxxx" 10.xxx.xx.xx
#ret=$?
#echo "ret = $ret"
if [[ $? == 1 ]];then
    echo "check fuse dev failed"
    #echo /dev/fuse failed > ./log/$daemon_ip
    exit 1
fi

echo "succ"
