#!/usr/bin/env bash
set -euo pipefail

echo "[Cloud PC] Installing desktop packages..."

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  xfce4 \
  xfce4-terminal \
  thunar \
  mousepad \
  dbus-x11 \
  xvfb \
  x11vnc \
  novnc \
  websockify \
  git \
  curl \
  wget \
  ca-certificates \
  python3 \
  python3-pip \
  nodejs \
  npm

sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

mkdir -p "$HOME/.cloud-pc/logs"

echo "[Cloud PC] Installed."
echo "[Cloud PC] The desktop will start automatically when the Codespace starts."
