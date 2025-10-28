#!/bin/bash -e

echo "Installing custom kernel from .deb files..."

install -v -o 0 -g 0 -m 644 files/*.deb ${ROOTFS_DIR}/tmp/

on_chroot << 'EOF'
dpkg -i /tmp/*.deb || apt-get -f install -y
rm -f /tmp/*.deb
EOF
