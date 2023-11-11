#!/bin/bash

centos7_pkg=(
    gcc-c++
    gdb
    cmake3.x86_64
    libudev-devel
    libblkid-devel
    libaio-devel
    libuv-devel
    libuuid-devel
    gtest-devel
    libcurl-devel
    zlib-devel
    libtool
    gcovr
    google-benchmark-devel
)

yum install -y "${centos7_pkg[@]}"
