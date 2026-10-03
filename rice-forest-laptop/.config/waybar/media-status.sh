#!/bin/sh

metadata=$(playerctl metadata --format '{{playerName}}|{{title}}|{{artist}}|{{position}}|{{mpris:length}}' 2>/dev/null) || exit 0
status=$(playerctl status 2>/dev/null) || exit 0

IFS='|' read -r player title artist position length <<EOF
$metadata
EOF

[ -n "$player" ] || exit 0

case "$player" in
    spotify) icon="" ;;
    firefox) icon="" ;;
    *) icon="󰎆" ;;
esac

case "$status" in
    Playing) status_icon="󰐊" ;;
    Paused) status_icon="󰏤" ;;
    *) status_icon="󰓛" ;;
esac

pretty_player=$(printf '%s' "$player" | tr '_-' '  ' | awk '{
    for (i = 1; i <= NF; i++) {
        $i = toupper(substr($i, 1, 1)) substr($i, 2)
    }
    print
}')

position=${position:-0}
length=${length:-0}
if [ "$length" -gt 0 ] 2>/dev/null; then
    elapsed=$((position / 1000000))
    duration=$((length / 1000000))
    filled=$((elapsed * 12 / duration))
    [ "$filled" -gt 12 ] && filled=12
    empty=$((12 - filled))
    progress=$(printf '%*s' "$filled" '' | tr ' ' '=')
    progress=$progress$(printf '%*s' "$empty" '' | tr ' ' '-')
    elapsed_text=$(printf '%02d:%02d' $((elapsed / 60)) $((elapsed % 60)))
    duration_text=$(printf '%02d:%02d' $((duration / 60)) $((duration % 60)))
    tracker=" [$progress] $elapsed_text/$duration_text"
else
    tracker=""
fi

text="$status_icon $pretty_player: $title"
[ -n "$artist" ] && text="$text - $artist"
text="$text$tracker"
tooltip="$pretty_player\n$title"
[ -n "$artist" ] && tooltip="$tooltip\n$artist"
[ -n "$tracker" ] && tooltip="$tooltip\n$elapsed_text / $duration_text"

json_escape() {
    printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g; :a;N;$!ba;s/\n/\\n/g'
}

printf '{"text":"%s","tooltip":"%s","class":"%s","alt":"%s"}\n' \
    "$(json_escape "$text")" \
    "$(json_escape "$tooltip")" \
    "$(printf '%s' "$status" | tr '[:upper:]' '[:lower:]')" \
    "$(json_escape "$player")"
