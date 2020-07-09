#!/bin/sh

class=$(playerctl metadata --player=spotify --format '{{lc(status)}}')
icon=""

if [[ $class == "playing" ]]; then
  info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}}')
  if [[ ${#info} > 40 ]]; then
    info=$(echo $info | cut -c1-40)"..."
  fi
  text=$icon" "$info
  playpause=""
elif [[ $class == "paused" ]]; then
  text=$icon
  playpause=""
elif [[ $class == "stopped" ]]; then
  text=""
  playpause=""
fi

result(){
    echo -e "{\"text\":\""$1"\", \"class\":\""$class"\"}"
}

if [[ $1 == "playpause" ]]; then
    echo -e "$(result "$playpause")"
elif [[ $1 == "status" ]]; then
    echo -e "$(result "$text")"
fi

