#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/ridgeos.kernel isodir/boot/ridgeos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "RidgeOS" {
	multiboot /boot/ridgeos.kernel
}
EOF
grub-mkrescue -o ridgeos.iso isodir
