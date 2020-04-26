#!/usr/bin/env bash
tmpbg="/tmp/lockscreen.png"
scrot "$tmpbg"; corrupter -mag 3 -boffset 1 "$tmpbg" "$tmpbg"
i3lock -i "$tmpbg"; rm "$tmpbg"