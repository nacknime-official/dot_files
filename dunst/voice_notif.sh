text=$(python3 ~/.config/dunst/voice_notif.py \'"$3"\')
#text=$(python3 voice_notif.py "Нужна склейка exe+word либо jpg/png +exe — 200 000₽ 💰
#c #c_c #python 🔖")
echo $text
gtts-cli "$text" --output ~/.config/dunst/voice_notif.mp3 --lang ru
mpg123 ~/.config/dunst/voice_notif.mp3
