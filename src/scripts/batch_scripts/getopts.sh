#!/bin/sh

umask 0022
unset IFS
unset OFS
unset LD_PRELOAD
unset LD_LIBRARY_PATH
export PATH=/usr/bin:/bin:/usr/local/bin/

cd `dirname "${0}"` || exit 1

link_dir()
{
	base_dir="${PROGRAM_ROOT}"
    rm -rf log

    if [ -d "/data1" ];then
        mkdir -p "/data1/${PROGRAM_NAME}_log"
        ln -snf "/data1/${PROGRAM_NAME}_log" "${base_dir}/log"
    else
        mkdir -p "/data/${PROGRAM_NAME}_log"
        ln -snf "/data/${PROGRAM_NAME}_log" "${base_dir}/log"
    fi
    ls -l ./*
}

add_to_crontab() {
    base_dir="${PROGRAM_ROOT}"
    crontab_name="$1"
    tmp_file="install_bak_xxx_crontab_tmp$$"
    crontab -l | grep -v "$crontab_name" | grep -v "DO NOT EDIT THIS FILE" | grep -v "vixie Exp" | grep -v "installed on" > $tmp_file

    echo "" >> $tmp_file
    echo "# $crontab_name report" >> $tmp_file

    crontab $tmp_file
}

init_config()
{
    sed -e "s/#DB_HOST/${1}/" -e "s/#DB_PORT/${2}/" -e "s/#DB_USER/${3}/" -e "s/#DB_NAME/${4}/" ../../etc/xxx.conf.init > ../../etc/xxx.conf
    if [ x"${5}" != xnull ]; then
        sed -i "s/db_passwd = #DB_PASSWD/db_passwd = ${5}/" ../../etc/xxx.conf
    else
        sed -i "s/db_passwd = #DB_PASSWD/db_passwd = /" ../../etc/xxx.conf
    fi


    if [ x"${6}" != xnull ]; then
        sed -i "s/#xxx_IP0/${6}/" ../../etc/xxx.conf
        sed -i "s/#xxx_IP1/${7}/" ../../etc/xxx.conf
    fi

    echo "${box_name}" > ../../report/box_name.conf
}

usage() {
  echo $0
  echo "usage: argv as follow: "
  echo -e "\t-h  db_host"
  echo -e "\t-P  db_port"
  echo -e "\t-u  db_user"
  echo -e "\t-p  db_passwd"
  echo -e "\t-n  db_name"
  echo -e "\t-N  box name"
  echo -e "\t-m  xxx ip 0"
  echo -e "\t-M  xxx ip 1"

  exit 0
}
#-----------main-----------

if  [ $# -ne 16 ]; then
    usage
    exit 1
fi

db_host=
db_port=
db_user=
db_passwd=
db_name=
box_name=
xxx_ip0=
xxx_ip1=

while getopts "h:P:u:p:n:N:m:M:" opt
do
  case $opt in
    h)
      db_host=$OPTARG
      ;;
    P)
      db_port=$OPTARG
      ;;
    u)
      db_user=$OPTARG
      ;;
    p)
      db_passwd=$OPTARG
      ;;
    n)
      db_name=$OPTARG
      ;;
    N)
      box_name=$OPTARG
      ;;
    m)
      xxx_ip0=$OPTARG
      ;;
    M)
      xxx_ip1=$OPTARG
      ;;

    *)
      echo "unknown item: $opt"
      usage
      ;;
  esac
done

echo "-----------------------------------------"
echo "db_name:         $db_name"
echo "db_host:         $db_host"
echo "db_port:         $db_port"
echo "db_user:         $db_user"
echo "db_passwd:       $db_passwd"
echo "box_name:        $box_name"
echo "xxx_ip0:     $xxx_ip0"
echo "xxx_ip1:     $xxx_ip1"

if [[ -z ${db_name} || -z ${db_host} || -z ${db_name} || -z ${db_user} || -z ${db_passwd} || -z ${box_name} ]]; then
    echo "some arg is empty, please check"
    usage
    exit -1
fi

cd ../..
PROGRAM_NAME=`pwd | xargs -i basename {}`
path=`pwd`
echo "${path}"

PROGRAM_ROOT="/usr/local/xxx/${PROGRAM_NAME}"
PROGRAM_NAME=`basename "${PROGRAM_ROOT}"`

if [ ! -x "${PROGRAM_ROOT}" ]; then
    mkdir -p ${PROGRAM_ROOT}
    cp -a "${path}"/* "${PROGRAM_ROOT}"
elif [ "${path}" != "${PROGRAM_ROOT}" ]; then
    echo "Install fail, $PROGRAM_ROOT exist and pwd is not $PROGRAM_ROOT!!! "
    exit 1
fi

cd ${PROGRAM_ROOT}/tools
link_dir

#-------- Init conf -----------
init_config $db_host $db_port $db_user $db_name $db_passwd $_ip0 $_ip1