#!/bin/bash

#sudo apt install -y build-essential gdb
#sudo apt install -y cmake
#sudo apt install -y libgtest-dev
#sudo apt install -y libudev-dev
#sudo apt install -y libblkid-dev
#sudo apt install -y libaio-dev
#sudo apt install -y libuv1-dev
#sudo apt install -y gcovr

sudo apt install -y  build-essential
sudo apt install -y  gdb
sudo apt install -y  libpam-systemd
sudo apt install -y  libudev-dev
sudo apt install -y  libblkid-dev
sudo apt install -y  libaio-dev
sudo apt install -y  cmake
sudo apt install -y  libuv1-dev
sudo apt install -y  libgtest-dev
sudo apt install -y  libcurl4-openssl-dev
sudo apt install -y  zlib1g-dev
sudo apt install -y  libtool
sudo apt install -y  gcovr
sudo apt install -y  libbenchmark-dev
sudo apt install -y  nasm


ubuntu_pkg=(
    build-essential
    gdb
    libpam-systemd
    libudev-dev
    libblkid-dev
    libaio-dev
    cmake
    libuv1-dev
    libgtest-dev
    libcurl4-openssl-dev
    zlib1g-dev
    libtool
    gcovr
    libbenchmark-dev
    nasm
)

#apt install -y "${ubuntu_pkg[@]}"
