#!/bin/sh
#remote shell
#

tmp=`dirname $0`
CUR_DIR=`cd "$tmp";pwd`
cd $CUR_DIR

usage() {
cat<<END
	Usage: fexist.sh filepath user pwd ip
END
}

if [[ ! $# == 4 ]];then
	usage
	exit 0
fi

filepath=$1
user=$2
remotepwd=$3
internalip=$4

a=`./ersh.exp "if [[ -e $filepath ]];then echo 'yes'; else echo 'no'; fi" $user $remotepwd $internalip`
#a=`./ersh.exp "if [[ -d $filepath ]];then echo 'yes'; else echo 'no'; fi" root $remotepwd $internalip`

echo $a

#echo $a | sed 's/\r//g' 

count=`echo $a | awk -F'yes' '{print NF-1}'`
echo $count
if [[ $count == 2 ]];then
	exit 0
fi
exit 1
