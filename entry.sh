#!/bin/bash
set -e

# Where we will install persistent system
ROOTFS="/mnt/volume/rootfs"

# First run: install Ubuntu minimal system into the volume
if [ ! -d "$ROOTFS/bin" ]; then
    echo ">>> Installing Ubuntu system into $ROOTFS..."
    debootstrap --arch=amd64 jammy "$ROOTFS" http://archive.ubuntu.com/ubuntu/
fi

echo ">>> Starting chroot environment..."
mount --bind /proc "$ROOTFS/proc"
mount --bind /sys "$ROOTFS/sys"
mount --bind /dev "$ROOTFS/dev"

# Enter persistent system
chroot "$ROOTFS" /bin/bash
