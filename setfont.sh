#!/bin/bash

# Vérifier les privilèges root
if [ "$EUID" -ne 0 ]; then
  echo "Ce script doit être exécuté en tant que root." >&2
  exit 1
fi

# Charger la police de console (facultatif pour tester immédiatement)
setfont /usr/share/kbd/consolefonts/solar24x32.psfu.gz

# Modifier le fichier /etc/vconsole.conf
cat <<EOF > /etc/vconsole.conf
KEYMAP="us"
FONT="solar24x32"
EOF

# Modifier le fichier /etc/default/grub
cat <<EOF > /etc/default/grub
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR='$(sed "s, release .*$,,g" /etc/system-release)'
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="vconsole.font=solar24x32"
GRUB_DISABLE_RECOVERY="true"
GRUB_ENABLE_BLSCFG=true
EOF

# Mettre à jour la configuration du GRUB
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

echo "La police de console et la configuration GRUB ont été mises à jour. Veuillez redémarrer pour appliquer les changements."

