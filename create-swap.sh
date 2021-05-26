#!/bin/bash

set -e

# scipt for generate and enable swap on linux
# tested on ubuntu server 14.04.5 LTS

BASEFOLDER=/
SWAPFILENAME=swapfile

# in megabytes
SWAPSIZE=4096

echo ""
echo "create directory swap"
sudo mkdir -vp $BASEFOLDER

echo ""
echo "create empty file for swap"
sudo dd if=/dev/zero of=$BASEFOLDER/$SWAPFILENAME bs=$SWAPSIZE count=1M

echo ""
echo "setup permission swap to 600"
sudo chmod 600 $BASEFOLDER/$SWAPFILENAME

echo ""
echo "setup empty file to swap "
sudo mkswap $BASEFOLDER/$SWAPFILENAME

echo ""
echo "activate swap"
sudo swapon $BASEFOLDER/$SWAPFILENAME

echo ""
echo "add swap file to /etc/fstab"

if [[ "$BASEFOLDER" = "/" ]]; then
	#statements
	echo "/$SWAPFILENAME swap swap defaults 0 0" >> /etc/fstab
else
	echo "$BASEFOLDER/$SWAPFILENAME swap swap defaults 0 0" >> /etc/fstab
fi

echo ""
echo "end of script"
echo ""
