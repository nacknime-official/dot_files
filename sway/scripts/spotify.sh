#!/bin/bash

spotify &
sleep 4
dbus-send --session --dest=org.mpris.MediaPlayer2.spotify --type=method_call /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.OpenUri string:$1
