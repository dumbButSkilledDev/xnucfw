#!/bin/bash

echo "enter your target arch (arm64, arm64e)"
read $rdarch
binf=.theos/obj/debug/$rdarch
bin=../../bin/minird

echo "---> building packages....."
cd minird/sigmastrap
make
cp $binf/sigmastrap $bin/pkgs/sigmastrap
cd ../..

echo "---> downloading procursus..."
wget -O /tmp/bootstrap.tar.zst https://apt.procurs.us/bootstraps/1900/bootstrap-iphoneos-arm64.tar.zst
unzstd /tmp/bootstrap.tar.zst -o /tmp/bootstrap.tar

mkdir -p ~/rdmk

dirc=$(pwd)

echo "---> ramdisk creation will begin in 3 seconds...."
sleep 3

echo "---> creating ramdisk....."

cd ~/rdmk

mkdir -p /tmp/xnucfw/rdmk/rdmnt
wget -O pbud https://raw.githubusercontent.com/dumbButSkilledDev/xnucfw_ramdisk_creator/refs/heads/main/Linux/PlistBuddy
sudo cp pbud /usr/libexec/PlistBuddy
chmod +x /usr/libexec/PlistBuddy
wget -O resimg.ipsw https://updates.cdn-apple.com/2024WinterFCS/fullrestores/062-24958/6D3A7DA6-3D8C-4A2B-A70D-2996D06A8930/iPhone_5.5_P3_15.8.3_19H386_Restore.ipsw
unzip resimg.ipsw -d .
pyimg4 img4 extract -i "$(/usr/libexec/PlistBuddy BuildManifest.plist -c "BuildIdentities:0:Manifest:RestoreRamDisk:Info:Path" | sed 's/"//g')" ramdisk.dmg
mount -t hfsplus ramdisk.dmg /tmp/xnucfw/rdmk/rdmnt
echo "--> getting basic utils...."
echo "--> extracting basic utils...."
git clone https://github.com/verygenericname/sshtars
tar -x --no-overwrite-dir -f sshtars/ssh.tar.gz -C /tmp/xnucfw/rdmk/rdmnt/
echo "--> installing xnucfw into ramdisk..."
mkdir -p /tmp/xnucfw/rdmk/rdmnt/usr/share/xnucfw
echo "--> copying bootstrap..."
cp $dirc/bootstrap.tar /tmp/xnucfw/rdmk/rdmnt/usr/share/xnucfw
echo "--> copying sigmaStrap, etc..."
cp $dirc/bin/pkgs/* /tmp/xnucfw/rdmk/rdmnt/usr/bin
echo "--> unmounting..."
umount /tmp/xnucfw/rdmk/rdmnt

cp ramdisk.dmg $dirc/bin/minird/rd

cd $dirc

echo "-----> ramdisk created!"