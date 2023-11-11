#!/bin/sh

#cd /tmp && for i in {b..l};do sg_raw -s 512 -i wce.bin /dev/sd$i 85 0B 06 00 00 00 01 00 E0 00 00 00 00 40 3F 00;done
#df -h
for i in {b..m};do 

	data_dir=`df -h  | grep  /dev/sd$i | awk '{print $6}'`
	if [ -n "$data_dir" ];then
		umount  $data_dir
		sed -i /sd$i/d /etc/fstab
		sed -i /sd$i/d /proc/mounts
	fi

	hdparm -W 1 /dev/sd$i
        hdparm -W  /dev/sd$i
done

#cat /etc/fstab
echo "umount ok"
#cat /proc/mounts

df -h

lsblk  | grep part

for i in {b..m};do 
	part_name=`lsblk  | grep part | grep  "sd$i"`
	if [ -n "$part_name" ];then
fdisk /dev/sd$i << EOF
p
d
p
w
EOF
	fi
done

df -h
lsblk
