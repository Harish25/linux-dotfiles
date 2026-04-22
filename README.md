# CachyOS Dotfiles 

A collection of important configuration files for my daily driver on CachyOS Linux.  
This repository serves as a personal backup. Managed via GNU Stow.

## Tools
* **OS:** [CachyOS](https://cachyos.org/) (Arch-based) *(x86-64-v3 optimized for 13600k)*
* **WM:** [Hyprland](https://hypr.land/)
* **Desktop Shell/Theming:** [Noctalia Shell](https://github.com/noctalia-dev/noctalia-shell) *(The core of this setup, highly recommended!)*
* **Terminal:** kitty

## Theming
Through Noctalia a wallpaper-based theme is applied across the entire system including:
* Hyprland, Qt/GTK
* Vesktop, Firefox (Pywalfox), Spotify (Spicetify)
* Kitty, btop, Cava, Yazi

## Setup
```bash
git clone git@github.com:Harish25/linux-dotfiles.git ~/linux-dotfiles

cd ~/linux-dotfiles

stow hypr noctalia fish kitty satty
```
*Note: Hardware specific settings (like monitors) are currently hardcoded*