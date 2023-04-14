#! /usr/bin/env bash
apt install open-vm-tools -y
vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other