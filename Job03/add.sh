#!/bin/bash

source "$(dirname "$0")/../includes/whiteshield.sh"

first_number_check=$(is_integer "$1")
second_number_check=$(is_integer "$2")

if [ "$first_number_check" -eq 1 ] && [ "$second_number_check" -eq 1 ]; then
  echo "Résultat de l'addition : $(($2 + $2))"
else
  echo "Les arguments doivent être des nombres."
fi
