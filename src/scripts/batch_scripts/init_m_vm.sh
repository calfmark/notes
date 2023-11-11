#!/bin/sh


df -h

do_mount=`df -h | grep vdb`
if [ -z "$do_mount" ];then
    echo "vdb is not mount"
    mkdir -p /data1
    mkfs.ext4 /dev/vdb
    mount /dev/vdb /data1
    echo "/dev/vdb            /data1                ext4       noatime,acl,user_xattr  1 0" >> /etc/fstab
else
    echo "have mount data1 before..."
fi

cat /etc/fstab
df -h

