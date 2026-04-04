# CachyOS Dotfiles 

A collection of important configuration files for my daily driver on CachyOS Linux.  
Managed via Stow.

## Tools
* **OS:** [CachyOS](https://cachyos.org/) (Arch-based) *(x86-64-v3 optimized for 13600k cpu)*
* **WM:** [Hyprland](https://hypr.land/)
* **Theming/Shell:** [Noctalia Shell](https://github.com/noctalia-dev/noctalia-shell) *(The core of this setup, its great)*
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