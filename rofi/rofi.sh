#!/usr/bin/env bash

calc() {
	rofi -show calc -modi calc -calc-command "echo '{result}' | xclip" -l 12 -width 768
}

drun() {
	rofi -show drun -modi drun,window,run -l 12 -width 1152 -columns 3 -sidebar-mode -show-icons true
}

clip() {
    cliphist list | rofi -dmenu | cliphist decode | wl-copy
}

nm() {
	networkmanager_dmenu
}

power() {
	ACTION_LIST="lock\nsuspend\nlogout\nreboot\nshutdown\nhibernate\nsuspend then hibernate"

	_rofi() {
		rofi -dmenu -i -sync -p "sys" -width 150 -l 7
	}

	SELECTED_STRING=$(echo -e "$ACTION_LIST" | _rofi)
	if [ "$SELECTED_STRING" == "lock" ]; then
        swaylock
	elif [ "$SELECTED_STRING" == "suspend" ]; then
        systemctl suspend
	elif [ "$SELECTED_STRING" == "logout" ]; then
        swaymsg exit
	elif [ "$SELECTED_STRING" == "reboot" ]; then
		systemctl reboot
	elif [ "$SELECTED_STRING" == "shutdown" ]; then
		systemctl poweroff
	elif [ "$SELECTED_STRING" == "suspend then hibernate" ]; then
		systemctl suspend-then-hibernate
	elif [ "$SELECTED_STRING" == "hibernate" ]; then
		systemctl hibernate
	fi
}

light() {
	ACTION_LIST="toggle\n6500\n4300\n2700\ndisco\nrainbow\nsleep\nsunrise\nsunrise2\nsunset\nstop\ndim\nwarm"

	_rofi() {
		rofi -dmenu -i -sync -p "light" -width 150 -l 7
	}

	SELECTED_STRING=$(echo -e "$ACTION_LIST" | _rofi)
	if [ "$SELECTED_STRING" == "toggle" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-toggle.sh 0
	elif [ "$SELECTED_STRING" == "6500" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 6500
	elif [ "$SELECTED_STRING" == "4300" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 4300
	elif [ "$SELECTED_STRING" == "2700" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 2700
	elif [ "$SELECTED_STRING" == "disco" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 Disco
	elif [ "$SELECTED_STRING" == "rainbow" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 Rainbow
	elif [ "$SELECTED_STRING" == "sleep" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 Sleep
	elif [ "$SELECTED_STRING" == "sunrise" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 Sunrise
	elif [ "$SELECTED_STRING" == "sunrise2" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 Sunrise2
	elif [ "$SELECTED_STRING" == "sunset" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 Sunset
	elif [ "$SELECTED_STRING" == "stop" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 Stop
	elif [ "$SELECTED_STRING" == "dim" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 Dim
	elif [ "$SELECTED_STRING" == "warm" ]; then
    ~/other_projects/yeelight-shell-scripts/yeelight-scene.sh 0 Warm
	fi
}

screenshot() {
	ACTION_LIST="area to clipboard\narea\nopen last\nedit last\nfull\nfull to clipboard"
	SCRIPT="$(dirname "$(readlink -f "$0")")"/screenshot.sh

	_rofi() {
		rofi -dmenu -i -sync -p "screen" -width 175 -l 6
	}

	SELECTED_STRING=$(echo -e "$ACTION_LIST" | _rofi)
	if [ "$SELECTED_STRING" == "full" ]; then
		$SCRIPT -f
	elif [ "$SELECTED_STRING" == "full to clipboard" ]; then
		$SCRIPT -g
	elif [ "$SELECTED_STRING" == "area" ]; then
		$SCRIPT -a
	elif [ "$SELECTED_STRING" == "area to clipboard" ]; then
		$SCRIPT -c
	elif [ "$SELECTED_STRING" == "open last" ]; then
		$SCRIPT -o
	elif [ "$SELECTED_STRING" == "edit last" ]; then
		$SCRIPT -e
	fi
}

emoji() {
	rofimoji --selector-args "-l 20 -width 1344 -columns 2"
}

usage() {
	echo "Usage: ./rofi.sh [options]
Options:
-h  open this page
-c  calc
-d  drun, run, window
-l  clipmenu
-n  NetworkManager
-p  power menu
-s  screenshot menu
-e  emoji picker"
}

if [[ "$1" == "" ]]; then
	usage
	exit 0
fi

while getopts "cdlnpseyh" OPTION; do
	case "$OPTION" in
	c)
		calc
		;;
	d)
		drun
		;;
	l)
		clip
		;;
	n)
		nm
		;;
	p)
		power
		;;
	s)
		screenshot
		;;
	e)
		emoji
		;;
	y)
		light
		;;
	h)
		usage
		;;
	*)
		usage
		exit 1
		;;
	esac
done
