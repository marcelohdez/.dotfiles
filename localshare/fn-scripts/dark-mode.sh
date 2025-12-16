#!/bin/bash
if [ $# -ne 1 ] || [ "$1" != "toggle" ] && [ "$1" != "track" ]; then
  echo "Usage:"
  echo "  $0 <track|toggle>"
  exit 1
fi

get_theme() {
  output=$(gsettings get org.gnome.desktop.interface color-scheme)
  if [ "$output" = "'prefer-dark'" ]; then
    echo dark
    exit
  fi

  echo light
}

print_json() {
  percentage=0 && [ "$(get_theme)" = "dark" ] && percentage=100
  class="off" && [ $percentage = 100 ] && class="on"

  printf "{\"tooltip\":\"Dark mode: %s.\",\"percentage\":%s,\"class\":\"%s\"}\n" \
    "$class" "$percentage" "$class"
}

if [ "$1" = "toggle" ]; then
  newtheme="dark" && [ "$(get_theme)" = "dark" ] && newtheme="light"

  if pgrep darkman &>/dev/null && [ "$(darkman get)" != "$newtheme" ]; then
    darkman set "$newtheme"
    exit
  fi

  find ~/.local/share/"$newtheme"-mode.d/ -name \*.sh -exec {} ";"
  exit
fi

print_json
while read -r _; do
  print_json
done < <(dconf watch /org/gnome/desktop/interface/color-scheme)
