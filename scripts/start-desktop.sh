#!/usr/bin/env bash
set -euo pipefail

export DISPLAY=:1
LOG_DIR="$HOME/.cloud-pc/logs"
mkdir -p "$LOG_DIR"

# Clean up only our previous desktop processes.
pkill -f "Xvfb :1" 2>/dev/null || true
pkill -f "x11vnc.*5901" 2>/dev/null || true
pkill -f "websockify.*6080" 2>/dev/null || true

# Virtual screen.
nohup Xvfb :1 -screen 0 1440x900x24 -ac +extension GLX +render -noreset \
  >"$LOG_DIR/xvfb.log" 2>&1 &

sleep 2

# XFCE desktop.
nohup env DISPLAY=:1 dbus-launch --exit-with-session startxfce4 \
  >"$LOG_DIR/xfce.log" 2>&1 &

sleep 3

# VNC is bound to localhost only. Codespaces exposes noVNC on port 6080.
nohup x11vnc \
  -display :1 \
  -rfbport 5901 \
  -localhost \
  -forever \
  -shared \
  -nopw \
  >"$LOG_DIR/x11vnc.log" 2>&1 &

sleep 2

NOVNC_WEB="/usr/share/novnc"
if [ ! -d "$NOVNC_WEB" ]; then
  echo "[Cloud PC] noVNC web files not found at $NOVNC_WEB" >&2
  exit 1
fi

nohup websockify --web="$NOVNC_WEB" 0.0.0.0:6080 localhost:5901 \
  >"$LOG_DIR/novnc.log" 2>&1 &

sleep 2

echo
echo "=============================================="
echo " Cloud PC is running"
echo " Open the Codespaces PORTS tab -> port 6080"
echo " Keep Port Visibility = Private"
echo "=============================================="
