#!/bin/bash

set -ex

VER=0.9.0
MEDIA=5.0.1
PWD=`pwd`
rm -rf dest.tar.gz dest
mkdir -p dest
wget -O dest.tar.gz http://fw.koolcenter.com/binary/LinkEase/LinuxStorage/linkease-binary-${VER}.tar.gz
tar -zxf ./dest.tar.gz -C ./dest/
mv ./dest/linkease-binary-${VER} ./dest/linkease-binary
cp ./linkease-install.sh ./dest/
rm -f ./dest.tar.gz

wget -O media.tar.gz http://fw.koolcenter.com/binary/LinkEase/LinuxStorage/linkease-media-binary-${MEDIA}.tar.gz
tar -zxf ./media.tar.gz -C ./dest/
cp ./dest/linkease-media-binary-${MEDIA}/* ./dest/linkease-binary/
rm -rf ./media.tar.gz ./dest/linkease-media-binary-${MEDIA}


