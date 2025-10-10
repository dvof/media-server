#!/bin/bash

set -ue
set -o pipefail

curl -fsSL https://repo.jellyfin.org/debian/jellyfin_team.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/jellyfin.gpg
echo "deb [signed-by=/usr/share/keyrings/jellyfin.gpg arch=arm64] https://repo.jellyfin.org/debian bookworm main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
sudo apt update
sudo apt install exfat-fuse exfatprogs jellyfin qbittorrent-nox -y
sudo systemctl enable jellyfin
sudo systemctl start jellyfin
sudo mkdir -p /mnt/kingston
echo "UUID=DEB5-DB3D   /mnt/kingston   exfat   defaults,nofail,uid=1000,gid=1000,umask=000   0   0" >> /etc/fstab
sudo ln -sf "$(pwd)/qbittorrent.service" /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable qbittorrent
sudo systemctl start qbittorrent.service
