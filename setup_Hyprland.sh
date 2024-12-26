#!/bin/bash

# Ajouter la variable d'environnement LD_LIBRARY_PATH à ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
source ~/.bashrc

# Installer les dépendances nécessaires
sudo dnf install -y \
  gcc gcc-c++ sudo cmake meson ninja-build \
  wayland-devel wayland-protocols-devel \
  libX11-devel libXrandr-devel libXinerama-devel libXcursor-devel \
  vulkan-loader-devel \
  libseat-devel libinput-devel mesa-libgbm-devel systemd-devel \
  libudev-devel hwdata \
  hyprutils-devel libdisplay-info-devel pugixml pugixml-devel \
  hyprcursor hyprcursor-devel file file-devel \
  hyprlang-devel re2-devel libxkbcommon-devel libuuid-devel tomlplusplus-devel \
  xcb-util-devel libxcb-devel xcb-util-wm-devel xcb-util-keysyms-devel \
  xcb-util-image-devel xcb-util-renderutil-devel libjxl-devel pixman-devel cairo-devel libjpeg-devel libwebp-devel mesa-libGL-devel hwdata-devel pango-devel xcb-util-errors-devel

# Installer libjxl depuis le dépôt GitHub
git clone https://github.com/libjxl/libjxl
cd libjxl
chmod +x deps.sh
sudo ./deps.sh
mkdir build
cd build
sudo cmake ..
make -j$(nproc)
sudo make install

# Installer hyprgraphics depuis le dépôt GitHub
cd ../
git clone https://github.com/hyprwm/hyprgraphics
cd hyprgraphics
sudo cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
sudo cmake --build ./build --config Release --target all -j$(nproc)
sudo sudo cmake --install ./build

# Installer hyprutils depuis le dépôt GitHub
cd ..
git clone https://github.com/hyprwm/hyprutils.git
cd hyprutils
sudo cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
sudo cmake --build ./build --config Release --target all -j$(nproc)
sudo sudo cmake --install ./build

# Installer hyprwayland-scanner depuis le dépôt GitHub
cd ..
git clone https://github.com/hyprwm/hyprwayland-scanner
cd hyprwayland-scanner
sudo cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
sudo cmake --build build -j$(nproc)
sudo sudo cmake --install build

# Installer aquamarine depuis le dépôt GitHub
cd ..
git clone https://github.com/hyprwm/aquamarine
cd aquamarine
sudo cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
sudo cmake --build ./build --config Release --target all -j$(nproc)
sudo sudo cmake --install ./build

# Installer Hyprland depuis le dépôt GitHub
cd ..
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
sudo meson _build
sudo ninja -C _build
sudo ninja -c _build install
sudo ninja -C _build install

echo "Hyprland et toutes les dépendances ont été installées avec succès !"

