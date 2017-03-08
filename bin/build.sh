#!/bin/bash

IMG=ubuntu-16.04-server-cloudimg-amd64-disk1.img
IMG_URL=http://cloud-images.ubuntu.com/releases/16.04/release/$IMG

cd ../os

echo "$pwd" 
echo "wget -q $IMG_URL"

wget -q $IMG_URL


