#!/bin/sh
set -e

# Install yay
sudo pacman --noconfirm -S --needed git base-devel go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
cd .. && rm -rf yay

# Install tools
MAKEOPTS=-j$(nproc) yay --noconfirm -S cmake i686-elf-gcc x86_64-elf-gcc nasm