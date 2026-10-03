Set up:

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
Install stow with your package manager

Now you can set the forest theme by running:
```bash
stow forest
```
