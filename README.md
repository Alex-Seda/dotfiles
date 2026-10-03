# Stow Rice Setup

Install stow with your package manager
```bash
sudo pacman -S stow
```
Set up Stow directories (replace "main" with your desired config name)
```bash
mkdir -p ~/dotfiles/rice-main/.config
cd ~/.config
mv hypr waybar wofi kitty tmux vim starship.toml ~/dotfiles/rice-main/.config/
cd ~/dotfiles
stow rice-main
```

## Set Up "rice" script
Copy this into ~/.local/bin/rice:
```bash
#!/usr/bin/env bash
set -e
cd ~/dotfiles
for d in rice-*/; do stow -D "${d%/}" 2>/dev/null || true; done
stow "rice-$1"
hyprctl reload
pkill waybar; setsid waybar >/dev/null 2>&1 &
pkill hyprpaper; setsid hyprpaper >/dev/null 2>&1 &
pkill -SIGUSR1 kitty
tmux source-file ~/.config/tmux/tmux.conf 2>/dev/null || true
```
Then run:
```bash
chmod +x ~/.local/bin/rice
```

Now you can choose the forest theme by running:
```bash
rice forest
```
