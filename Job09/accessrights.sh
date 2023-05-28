#!/bin/bash

source "/home/whitecat/Bureau/includes/whiteshield.sh"

trim() {
  echo "$1" | tr -d ' \r'
}

file_csv="/home/whitecat/Bureau/Job09/Resources/Shell_Userlist.csv"

while IFS="," read -r id firstname name pwd rights || read -r || [ -n "$id" ]; do
  id=$(trim "$id")
  is_valid_id=$(is_integer "$id")

  if [ "$is_valid_id" -eq 0 ] || id -u "$id" 2>/dev/null; then
    continue
  fi

  firstname=$(trim "$firstname")
  rights=$(trim "$rights")
  name=$(trim "$name")
  pwd=$(trim "$pwd")

  username="${firstname^}_${name^}"
  user_description="${username/_/ }"
  home_directory="/home/$username"

  if [ "${rights^^}" = "ADMIN" ]; then
    sudo useradd -m -G "sudo" -s "/bin/bash" -c "$user_description" -u "$id" -d "$home_directory" -p "$pwd" "$username"
  else
    sudo useradd -m -s "/bin/bash" -c "$user_description" -u "$id" -d "$home_directory" -p "$pwd" "$username"
  fi
done < "$file_csv"

# CRON : * * * * * find <chemin_du_script> -mmin -1 -exec <chemin_du_script> ;
