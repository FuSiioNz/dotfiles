# Iridescence

This is my personalized Hyprland Arch Linux setup.

## Essentials

- **WM**: Hyprland
- **Bar**: Waybar
- **Launcher**: Wofi
- **Terminal**: Alacritty
- **GTK Theme**: [Graphite-Dark by vinceliuice](https://github.com/vinceliuice/Graphite-gtk-theme)
- **Icon Theme**: [Tela-Black-Dark by vinceliuice](https://github.com/vinceliuice/Tela-circle-icon-theme)
- **Wallpaper**: [This beauty here](https://github.com/dharmx/walls/blob/main/gruvbox/a_street_with_buildings_and_trees.png)
- **Fonts**: IBM Plex Sans, IBM Plex Mono, Font Awesome
- **Notification Daemon**: Mako
- **File Managers**: Thunar & Ranger
- **Resource Monitor**: Btop
- **Fetch**: Pfetch
- **Audio Visualizer**: Cava
- **Colorscheme**: Iridescence - generated by Pywal
  
## Setup Instructions
### 1. Install the required applications using your preferred AUR helper:

**Using** `yay`:
```bash
yay -Syu git hyprland waybar wofi alacritty brightnessctl swww  gtk-engine-murrine nwg-look mako thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman gvfs-mtp ranger btop pfetch cava pywal-16-colors mpd ncmpcpp zathura-mupdf-pdf grim slurp pavucontrol pipewire pipewire-alsa pipewire-pulse bluez-utils blueman wireplumber
```
**Using** `paru`:
```bash
paru -Syu git hyprland waybar wofi alacritty brightnessctl swww  gtk-engine-murrine nwg-look mako thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman gvfs-mtp ranger btop pfetch cava pywal-16-colors mpd ncmpcpp zathura-mupdf-pdf grim slurp pavucontrol pipewire pipewire-alsa pipewire-pulse bluez-utils blueman wireplumber
```

### 2. Clone this repository and copy all of the config files.

If you don't have it already, create config folder:
```bash
mkdir ~/.config
```

```bash
cd
git clone https://github.com/FuSiioNz/dotfiles.git
cp -r dotfiles/* ~/.config/
```

### 3. Install the GTK Theme, Icons and the Wallpaper
You can follow the instructions for both GTK theme and the Icons by clicking on the respective links in the **Required Apps** Section.

For the wallpaper:
  1. Download the wallpaper by clicking on the hyperlink in **Required** section.
  2. Create ~/Pictures/Wallpapers directory in your home folder.
  3. Put the wallpaper in the recently created Wallpapers folder

If you did the steps correctly the wallpaper location should look like this:
```bash
/home/<username>/Pictures/Wallpapers/<wallpaper.png>
```

### 4. Download the necessary fonts:
[IBM Plex Sans](https://fonts.google.com/specimen/IBM+Plex+Sans) 
[IBM Plex Mono](https://fonts.google.com/specimen/IBM+Plex+Mono)

For the Font Awesome you can either download it from the internet or from AUR:
```bash
yay -S ttf-font-awesome
paru -S ttf-font-awesome
```
After that put all of the fonts in ```~/.local/share/fonts``` folder and refresh the cache
```bash
fc-cache -rv 
```
### 5. Final Tweaks
Make sure that your user has sufficient access to Video, Audio, Storage and MPD groups. You can check these by writing ```groups``` in your terminal.
If any or for some reason all of those groups are missing then you can just simply add them to the user:
```bash
sudo usermod -aG video,audio,storage,mpd <username>
```

Finally, to make the weather script work correctly(and to avoid potentially crashing your waybar) you must add information to the weather script.
Go to the said script location in ~/.config/waybar/scripts/ and open get_weather.sh with your prefered code or text editor.

On lines 3 and 11 replace "location" with proper location name. You can check your current location on wttr.in.

If you did everything correctly both of these lines should look something like this:
```bash
url="https://wttr.in/London?format=%c+%t"
tooltip=$(curl -s -H 'Cache-Control: no-cache' "https://wttr.in/London?format=4")
```
Congratulations! You are done. Restart your system and from your login manager choose Hyprland as your session if you haven't already and you are good to go.

## Useful Keybindings

- **Launch Terminal**  <kbd>SUPER</kbd> + <kbd>Return</kbd> 

- **Restart Waybar**  <kbd>SUPER</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd>     

- **Kill Active Window**  <kbd>SUPER</kbd> + <kbd>C</kbd>  

- **Launch Wofi Menu**  <kbd>SUPER</kbd> + <kbd>R</kbd>
  
- **Launch File Manager (Thunar)**  <kbd>SUPER</kbd> + <kbd>E</kbd

- **Launch Browser**  <kbd>SUPERr</kbd> + <kbd>B</kbd>  

- **Exit Environment**   <kbd>SUPER</kbd> + <kbd>M</kbd>  

- **Toggle Floating Window**  <kbd>SUPER</kbd> + <kbd>V</kbd>  

- **Toggle Split Layout**  <kbd>SUPER</kbd> + <kbd>J</kbd>  

- **Cycle Through Windows**  <kbd>Alt</kbd> + <kbd>Tab</kbd>

- **Region Screenshot**: <kbd>SUPER</kbd> + <kbd>Shift</kbd> + <kbd>s</kbd>

- **Full Screenshot**: <kbd>SUPER</kbd> + <kbd>Print</kbd>

If you want to replace <kbd>SUPER</kbd> with <kbd>Alt</kbd> edit the line 120 in hyprland.conf ```$mainMod = SUPER```
  
You can see all the hyprland and application keybinds in ```~/.config/hypr/hyprland.conf```
