#!/bin/bash -e

echo -n "Add user configuration files: "
if [[ -d "${ROOTFS_DIR}/etc/xdg/labwc-greeter" ]]; then
	for d in "${ROOTFS_DIR}/home/"* ; do
		owner_id=$(stat -c '%u' "$d")
		mkdir -p "$d/.config"
		cp -r files/user/.* "$d/"
		chown -R $owner_id "$d/.config"
		mkdir -p "${ROOTFS_DIR}/etc/skel/.config"
		cp -r files/user/.config/* "${ROOTFS_DIR}/etc/skel/.config/"
	done
		echo "Done"
else
		echo "Skipped"
fi