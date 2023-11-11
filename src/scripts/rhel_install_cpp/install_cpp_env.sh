#!/bin/bash

rhel_pkg=(
    gcc-c++
    gdb
    cmake
    systemd-devel
    libblkid-devel
    libaio-devel
    libuuid libuuid-devel
    libcurl-devel
    zlib-devel
    libtool
    perf
)
#    libuv-devel
#    gcovr
#    libudev-devel
#    gcovr
#    gtest-devel
#    google-benchmark-devel

if [ -f "/etc/os-release" ]; then
    . /etc/os-release
else
    echo "/etc/os-release missing."
    exit 1
fi

case "$ID" in
    rhel|centos)
        versin_id="${VERSION_ID%%.*}"
        echo "versin_id=$versin_id"
        if [ "$versin_id" -eq 7 ]; then

            yum install -y "${rhel_pkg[@]}"

            echo "install gcc9"
            yum install -y epel-release centos-release-scl scl-utils
            yum install devtoolset-9-gcc*  -y && echo "source /opt/rh/devtoolset-9/enable" >>/etc/profile

            echo "install cmake"
            yum remove cmake -y
            yum install -y cmake3.x86_64
            ln -s /usr/bin/cmake3 /usr/bin/cmake

        elif [ "${versin_id}" -ge 8 ]; then
            dnf check-update
            dnf install -y "${rhel_pkg[@]}"
        else
            echo "do not support ${ID}${VERSION_ID}"
            exit 2
        fi
    ;;
    *)
        echo "Your system ($ID) is not supported by this script. Please check!"
        exit 3
    ;;
esac

echo "install all packages success..."