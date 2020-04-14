#!/bin/bash

#		Script to hide and un-hide panel
#=======================================

isRunning() {
    ps -o comm= -C "$1" 2>/dev/null | grep -x "$1" >/dev/null 2>&1
}

hidePanel() {
	gap=`grep "gap=" ~/.config/bspwm/bspwmrc | cut -d '=' -f 2`
	killall limepanel
	bspc config top_padding $gap
}

showPanel() {
	bspc wm -r
}

if isRunning limepanel; then
	hidePanel
else
	showPanel
fi