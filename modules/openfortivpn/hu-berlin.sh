#!/bin/bash

# Ask for hu account username
read -p "Hu Account: " username

directory="$HOME/.config/openfortivpn/"
if [ ! -d "$directory" ]; then
	echo "Creating config dir '$HOME/.config/openfortivpn' ..."
	mkdir -p "$HOME/.config/openfortivpn"
fi


filepath="$HOME/.config/openfortivpn/hu-berlin"

# Write file
echo "host = forti-ssl.vpn.hu-berlin.de" > "$filepath"
echo "port = 443" >> "$filepath"
echo "username = $username" >> "$filepath"

if  [ $? -eq 0 ]; then
	echo "Success!"
else
	echo "Failed to write file."
fi
