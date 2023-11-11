#!/bin/sh

tmp=`dirname $0`
CUR_DIR=`cd $tmp;pwd`
cd $CUR_DIR
if [ $# -lt 3 ];then
	echo "$0 user pass ip mod_name"
exit -1
fi
user=$1
pass=$2
ip=$3
mod_name=$4
./ersh.exp "cd /tmp; crontab -l > cron.tmp;
if [ \`grep $mod_name cron.tmp |grep -v \"^#\" | wc -l\` -lt 1 ]; then 
echo \"*/2 * * * *     cd /xxx/$mod_name/tools/cron/; ./check_all.sh > /dev/null 2>&1\" >> cron.tmp;
fi
crontab cron.tmp; rm cron.tmp;" $user $pass $ip
