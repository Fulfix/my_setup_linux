#!/bin/bash

# Charger la police de console
setfont /usr/lib/kbd/consolefonts/solar24x32.psfu.gz

# Modifier le fichier /etc/vconsole.conf
cat <<EOF > /etc/vconsole.conf
KEYMAP="us"
FONT="solar24x32"
EOF

