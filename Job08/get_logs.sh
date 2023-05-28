#!/bin/bash

#========================== Avec une boucle ============================
# Je n'ai pas bien compris si il était imposé d'utiliser une boucle.
# Du coup dans le doute, je met un exemple de l'utilisation d'une boucle
# pour réaliser la récupération des logs ci-dessous.
#=======================================================================
#
# user_connexions=0
#
# for line in $(last | grep "$USER"); do
#   if [ "$line" == "$USER" ]; then
#     user_connexions=$(("$user_connexions" + 1))
#   fi
# done
#
#=======================================================================

dirname=$(dirname "$0")
user_connexions=$(last | grep -c "$USER")
filename='number_connection-'$(date +"%d-%m-%Y-%H:%M")

echo "$user_connexions" > "$filename"
tar cfz "${filename//:/_}.tar.gz" "$filename"

mv "${filename//:/_}.tar.gz" "$dirname/Backup/$filename.tar.gz"
chmod 705 "$dirname/Backup/$filename.tar.gz"
rm "$filename"

# CRON : 0 * * * * <chemin_du_script>

