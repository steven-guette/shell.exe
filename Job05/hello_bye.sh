#!/bin/bash

arg=${1,,}

if [ "$arg" == 'hello' ]; then
  echo 'Bonjour, je suis un script !'
elif [ "$arg" == 'bye' ]; then
  echo 'Au revoir et bonne journée.'
fi