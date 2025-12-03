#!/usr/bin/env bash

cpu=$(top -bn1 | grep "%Cpu" | awk '{print $2+$4}')
mem=$(free -m | awk '/Mem:/ {printf "%d/%dMB", $3, $2}')

tun=""
if ip a show tun0 >/dev/null 2>&1; then
  tun_ip=$(ip -4 addr show tun0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")
  tun="VPN:$tun_ip"
fi

lip=$(hostname -I | awk '{print $1}')

branch=""
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=" $(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
fi

if [ -n "${TARGET:-}" ]; then
  target_status=$(ping -c1 -W1 $TARGET >/dev/null 2>&1 && echo "OK" || echo "DOWN")
  target_segment="$TARGET:$target_status"
else
  target_segment=""
fi

time=$(date +"%H:%M:%S")

segments=("CPU:${cpu}%" "RAM:${mem}" "$tun" "$lip" "$branch" "$target_segment" "$time")

out=""
for s in "${segments[@]}"; do
  [ -n "$s" ] || continue
  if [ -z "$out" ]; then out="$s"; else out="$out | $s"; fi
done

echo "$out"
