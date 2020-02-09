#!/usr/bin/env bash
mkdir -p /datadrive
UUID=$(blkid | grep /dev/sdc1 | awk '{print $2}' | sed -e 's/UUID="\(.*\)\"/\1/')
echo "UUID=$UUID   /datadrive  ext4   defaults,nofail   1 2" | tee -a /etc/fstab
mount -a
