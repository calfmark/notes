#!/bin/sh

usr_name="root"
psw="xxx"

while read LINE
do
	echo $LINE

	./comm/ersh.exp "cd /usr/local/  && ./check.sh" "$usr_name" "$psw" "$LINE" 

done < nas_iplist

