#!/bin/bash

alacritty --class Spotify -e ncspot &
sleep 4
dbus-send --session --dest=org.mpris.MediaPlayer2.ncspot --type=method_call /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Set string:org.mpris.MediaPlayer2.Player string:Shuffle variant:boolean:true
dbus-send --session --dest=org.mpris.MediaPlayer2.ncspot --type=method_call /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.OpenUri string:$1
dbus-send --session --dest=org.mpris.MediaPlayer2.ncspot --type=method_call --print-reply /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Set string:org.mpris.MediaPlayer2.Player string:Volume variant:double:$2
