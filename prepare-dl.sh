#!/bin/bash

VER=0.9.0
PWD=`pwd`
rm -rf dest.tar.gz dest
mkdir -p dest
wget -O dest.tar.gz http://fw.koolcenter.com/binary/LinkEase/LinuxStorage/linkease-binary-${VER}.tar.gz > /dev/null 2>&1
tar -zxf ./dest.tar.gz -C ./dest/
mv ./dest/linkease-binary-${VER} ./dest/linkease-binary
cp ./linkease-install.sh ./dest/
