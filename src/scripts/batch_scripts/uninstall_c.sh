#!/bin/sh

usr_name="root"
psw="xx"

while read LINE
do
	echo $LINE

	./comm/ersh.exp "cd /usr/local/ && ./uninstall.sh && rm -rf /data/*log" "$usr_name" "$psw" "$LINE" 

done < nas_iplist

