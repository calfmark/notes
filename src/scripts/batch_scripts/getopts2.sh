#!/bin/bash

read x <<DEF
  created by xxx @ 2022-6-14
DEF

xx_name=
pkg=

master_ip=
slave_ip=

model=
mulity_port=0

usage() {
  echo $0
  echo -e "\t-f   ip for master"
  echo -e "\t-i   ip for slave"
  echo -e "\t-n   xx name"
  echo -e "\t-p   package name"
  echo -e "\t-d   model, support: xxx"
  echo -e "\t-s   mulity port"
  echo -e "\t-h   print this help message"
  exit 0
}

while getopts "s:f:n:p:hd:i:" opt
do
  case $opt in
    f)
      master_ip=$OPTARG
      ;;
    i)
      slave_ip=$OPTARG
      ;;
    n)
      xx_name=$OPTARG
      ;;
    p)
      pkg=$OPTARG
      ;;
    d)
      model=$OPTARG
      ;;
    s)
      mulity_port=$OPTARG
      ;;
    h)
      usage
      ;;
    *)
      echo "unknown option: $opt"
      exit -1
      ;;
  esac
done

exit 0
