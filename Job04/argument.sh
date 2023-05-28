#!/bin/bash

new_file="$HOME/$1"

if [ -n "$1" ] && [ ! -f "$new_file" ]; then
  touch "$new_file"

  if [ -f "$2" ]; then
    cat "$2" > "$new_file"
  fi
fi