# Iridescence

This is my personalized Hyprland Arch Linux setup.

## Required Apps

- **WM**: Hyprland
- **Bar**: Waybar
- **Launcher**: Wofi
- **Terminal**: Alacritty
- **GTK Theme**: Graphite-Dark by vinceliuice
- **Icon Theme**: Tela-Black-Dark by vinceliuice
- **Wallpaper**: [This beauty here](link_to_wallpaper_image)
- **Fonts**: IBM Plex Sans, IBM Plex Mono, Font Awesome
- **Notification Daemon**: Mako
- **File Managers**: Thunar & Ranger
- **Resource Monitor**: Btop
- **Fetch**: Pfetch
- **Audio Visualizer**: Cava
- **Colorscheme**: Iradescence - generated by Pywal
  
## Setup Instructions
1. Install the required applications using your preferred AUR helper:

### Using `yay`:
```bash
yay -Syu git hyprland waybar wofi alacritty brightnessctl nwg-look mako thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman gvfs-mtp ranger btop pfetch cava pywal-16-colors mpd ncmpcpp zathura-mupdf-pdf
```
### Using `yay`:
```bash
paru -Syu git hyprland waybar wofi alacritty brightnessctl nwg-look mako thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman gvfs-mtp ranger btop pfetch cava pywal-16-colors mpd ncmpcpp zathura-mupdf-pdf
```

2. Clone this repository and copy all of the config files.

```bash
git clone https://github.com/FuSiioNz/dotfiles.git
cd ~/dotfiles
cp -r dotfiles/* ~/.config/
```
