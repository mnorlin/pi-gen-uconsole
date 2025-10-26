#!/bin/bash -e

echo "Installing custom kernel from .deb files..."

install -v -o 0 -g 0 -m 644 /pi-gen/custom-kernel/*.deb ${ROOTFS_DIR}/tmp/

on_chroot << 'CHROOT_EOF'
dpkg -i /tmp/*.deb || apt-get -f install -y
rm -f /tmp/*.deb
CHROOT_EOF
EOF