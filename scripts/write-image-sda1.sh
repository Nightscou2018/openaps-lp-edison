#!/bin/bash -eu
SHELL=/bin/bash
PATH=/home/pi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games

set -e

echo "Backup entire Edison to zip file"

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to mount /dev/sda1" 2>&1
  exit 1
else
  mkdir -p /media/usbdrive
  umount /dev/sda1
  echo "Mounting /dev/sda1 to /media/usbdrive"
  mount /dev/sda1 /media/usbdrive
  echo "Writing gz file to /media/usbdrive with dd"
  dd bs=4M if=/dev/mmcblk0 | gzip > /media/usbdrive/image-openaps-lp-edison.gz
fi
