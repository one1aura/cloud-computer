#!/usr/bin/env bash
set -u

echo "Cloud PC process status"
echo "-----------------------"
pgrep -af "Xvfb :1" || echo "Xvfb: not running"
pgrep -af "startxfce4" || echo "XFCE: not running"
pgrep -af "x11vnc.*5901" || echo "x11vnc: not running"
pgrep -af "websockify.*6080" || echo "noVNC/websockify: not running"
echo
echo "Recent logs:"
for f in "$HOME"/.cloud-pc/logs/*.log; do
  [ -f "$f" ] || continue
  echo "---- $f ----"
  tail -n 8 "$f"
done
