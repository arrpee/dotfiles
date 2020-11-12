#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/arrpee.log
polybar arrpee >>/tmp/arrpee.log 2>&1 & disown

echo "Bars launched..."