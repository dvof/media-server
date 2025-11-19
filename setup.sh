#!/bin/bash

set -ue
set -o pipefail

sudo apt update
curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash
sudo apt install exfat-fuse exfatprogs qbittorrent-nox -y
sudo systemctl enable jellyfin
sudo systemctl start jellyfin
sudo mkdir -p /mnt/kingston
echo "UUID=DEB5-DB3D   /mnt/kingston   exfat   defaults,nofail,uid=1000,gid=1000,umask=000   0   0" | sudo tee -a /etc/fstab
sudo ln -sf "$(pwd)/qbittorrent.service" /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable qbittorrent
sudo systemctl start qbittorrent.service
