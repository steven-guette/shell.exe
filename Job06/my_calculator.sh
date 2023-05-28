#!/bin/bash

source "$(dirname "$0")/../includes/whiteshield.sh"

readonly operators=('+' '-' 'x' '/')

operator_selected=${2,,}
is_valid_operator=false

for operator in "${operators[@]}"; do
  if [ "$operator_selected" == "$operator" ]; then
    is_valid_operator=true
    break
  fi
done

if [ "$is_valid_operator" == true ]; then
  first_number_check=$(is_integer "$1")
  second_number_check=$(is_integer "$3")

  if [ "$first_number_check" -eq 1 ] && [ "$second_number_check" -eq 1 ]; then
    case $operator_selected in
      '+') echo "Résultat de l'addition : $(($1 + $3))";;
      '-') echo "Résultat de la soustraction : $(($1 - $3))";;
      'x') echo "Résultat de la multiplication : $(($1 * $3))";;
      '/') echo "Résultat de la division : $(($1 / $3))";;
      *) echo "L'opérateur '$operator_selected' n'est pas géré.";;
    esac
  else
    echo 'Les arguments 1 et 3 doivent être des nombres entiers.'
  fi
else
  echo 'Les opérateurs acceptés sont les suivants :' "${operators[@]}"
fi
