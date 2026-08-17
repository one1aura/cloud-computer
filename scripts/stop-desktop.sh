#!/usr/bin/env bash
set -euo pipefail

pkill -f "websockify.*6080" 2>/dev/null || true
pkill -f "x11vnc.*5901" 2>/dev/null || true
pkill -f "Xvfb :1" 2>/dev/null || true
pkill -f "startxfce4" 2>/dev/null || true

echo "[Cloud PC] Desktop processes stopped."
