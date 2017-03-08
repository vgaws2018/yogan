#!/bin/bash

IMG=ubuntu-16.04-server-cloudimg-amd64-disk1.img
IMG_URL=http://cloud-images.ubuntu.com/releases/16.04/release/$IMG

echo "$pwd" 
echo "wget -q $IMG_URL"

#wget -q $IMG_URL

TMP_DIR=guest

if [ ! -d "$TMP_DIR" ]; then
    mkdir $TMP_DIR
fi

echo "Mount Image for changes"

guestmount -a $IMG -i $TMP_DIR

if [ $? = "0" ]; then
echo "mounted successfully"
fi

cp $TMP_DIR/etc/cloud/templates/hosts.debian.tmpl $TMP_DIR/etc/cloud/templates/hosts.tmpl
sed -i "/preserve_hostname/a manage_etc_hosts: true" $TMP_DIR/etc/cloud/cloud.cfg
sed -i "s/name: ubuntu/name: cloud/" $TMP_DIR/etc/cloud/cloud.cfg
sed -i "s/gecos: Ubuntu/gecos: Cloud user/" $TMP_DIR/etc/cloud/cloud.cfg
sed -i "/ed25519/d" $TMP_DIR/etc/ssh/sshd_config

echo "Changes completed successfully"


