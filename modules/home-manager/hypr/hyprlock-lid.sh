#!/bin/bash

set -euo pipefail

INTERNAL_RE='^(eDP|LVDS|DSI)'

NAMES="$(hyprctl monitors 2>/dev/null | awk '/^Monitor / {print $2}')"

EXTERNAL_COUNT="$(printf '%s\n' "$NAMES" | grep -E -v "$INTERNAL_RE" | grep -E '.' -c || true)"

if [ "${EXTERNAL_COUNT}" -eq 0 ]; then
    nohup hyprlock >/dev/null 2>&1 &
fi