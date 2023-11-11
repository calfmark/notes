#!/bin/sh


df -h

do_mount=`df -h | grep sdb`
if [ -z "$do_mount" ];then
    echo "sdb is not mount"
    mkdir -p /data1
    mkfs.ext4 /dev/sdb
    mount /dev/sdb /data1
    echo "/dev/sdb            /data1                ext4       noatime,acl,user_xattr  1 0" >> /etc/fstab
else
    echo "have mount data1 before..."
fi

cat /etc/fstab
df -h

#hp machine
agent/hp/hpacucli ctrl slot=0 modify nobatterywritecache=enable
agent/hp/hpacucli ctrl slot=0 modify drivewritecache=enable
agent/hp/hpacucli ctrl all show config detail | grep  'Write Cache'

#no-hp machine
agent/lsi/MegaCli -LDSetProp   CachedBadBBU -LALL -a0
agent/lsi/MegaCli LDInfo -LALL  -aALL | grep 'Current Cache Policy'
