#!/bin/bash
echo "export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
source ~/.bashrc
sudo dnf install -y \
  gcc gcc-c++ cmake meson ninja-build \
  wayland-devel wayland-protocols-devel \
  libX11-devel libXrandr-devel libXinerama-devel libXcursor-devel \
  vulkan-loader-devel \
  libseat-devel libinput-devel mesa-libgbm-devel systemd-devel \
  libudev-devel libX11-devel hwdata \
  hyprutils-devel libdisplay-info-devel pugixml pugixml-devel \
  hyprcursor hyprcursor-devel libmagic file-devel \
  hyprlang-devel re2-devel libxkbcommon-devel libuuid-devel tomlplusplus-devel \
  xcb-util-devel libxcb-devel xcb-util-wm-devel xcb-util-keysyms-devel \
  xcb-util-image-devel xcb-util-renderutil-devel

