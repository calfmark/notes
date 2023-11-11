#!/bin/sh

usr_name="root"
psw="xxx"

while read LINE
do
	echo $LINE

	./comm/ercp.exp "/data/package.tgz" "/data/" "$usr_name" "$psw" "$LINE"
	./comm/ersh.exp "cd /data/  && tar -xzf package.tgz " "$usr_name" "$psw" "$LINE" 

done < nas_iplist

