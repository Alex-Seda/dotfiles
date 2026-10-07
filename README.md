# Theme Manager
Having a workspace that looks and functions how you like makes work more enjoyable and fluid. The less you have to think about your workspace, the more you can focus on your actual work.

Ideally, you would have shortcuts and workflows that minimize barriers to focusing on work, like quickly switching workspaces and seeing the information you are looking for, which would allow you to release your inhibitions and feel the rain on your skin.

After a while of using an arctic theme, I wanted to change the look of my system without changing the keybinds. Every Arch Linux rice that I found online messed with my keybinds and other local settings. I set out for a quick way to be able to change my theme, so that I could have variety and not have to manually swap files every time I wanted a change.

Thus, this project was born. This project allows me to keep track of as many appearances as I want and to hot swap them as often as I like. I have divided my configurations into desktop and laptop directories (with laptop being appended with "-laptop") so that I can manage all appearances in one place.

Feel free to take as much or as little as you want from my work! Hopefully it will benefit you as it has benefited me!

## How It Works
This project makes use of the open source "Stow" tool to symlink configuration files in your "~/.config" directory to themed files in another location. This allows us to change our theme by changing where the symlinks point, instead of changing the files themselves, which allows us to "hot swap" themes! 

If our active theme is "forest", this looks like the "~/.config/hypr/hyprland.lua" being a symlink to "~/dotfiles/rice-forest/.config/hypr/hyprland.lua". Then, if we change the theme to "arctic", it just changes "~/.config/hypr/hyprland.lua" to point to "~/dotfiles/rice-arctic/.config/hypr/hyprland.lua". This leaves both "hyprland.lua" files unchanged, and we can easily switch back if we break something or if we change our mind.

Additionally, since these configs are git tracked, we should never end up in a situation where our config files are just gone, and we can also easily set up new devices in our normal configuration!

## Setup Scope
Keep in mind that this theme manager uses my setup for my laptop/desktop, which may or may not be your desired key-binds.

My current setup contains configurations for:
- Hyprland (Desktop Environment - Tiling Window Manager)
- Waybar (Task Bar)
- Wofi (Application Search)
- Kitty (Terminal Emulator)
- Vim (Text Editor)
- Tmux (Terminal Multiplexer)

You should have these all installed via your package manager for the themes to work correctly.

## Setup Stow

Install stow with your package manager. 

Arch Linux example is given here:
```bash
sudo pacman -S stow
```
Set up Stow directory:
```bash
cd ~
git clone git@github.com:Alex-Seda/dotfiles.git
cd ~/dotfiles
stow rice-forest-laptop
```

This chooses the forest theme and has stow generate the symlinked files in "~/.config" to match the directories and files in "dotfiles/rice-forest-laptop/.config".

## Setup "rice" Command
To make swapping themes easier, we will set up a CLI script.

Create a file at ~/.local/bin/rice, and copy this into that file:
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

## Usage
Now you can choose the forest theme by running:
```bash
rice forest
```

This uses the "stow" program to update the symlinks in your .config directory to point to the files in "rice-forest".

The command "rice {theme name}" will find the directory "rice-{theme name}" in the directory that you initiated "stow" earlier (likely this project directory).

It is important to note that it does not automatically remove "-" characters. So, to switch to the configuration in "rice-forest-laptop", you would run "rice forest-laptop".

## Adding Themes
You can create a new theme by starting from scratch, or by using an existing theme for inspiration!

### Copying and Modifying an Existing Theme
The easiest way to add themes is to copy one theme directory and change what you would like changed. This could be colors, icons, widths, or anything else.

To do this, just copy a theme that looks most similar to what you want to create:
```bash
cp -r ~/dotfiles/rice-forest ~/dotfiles/rice-{new theme name}
```

Then you can edit what you would like to change!

### Creating a Blank Slate
If you prefer to just use the update structure or want a completely different preset, you can always make an empty directory from scratch by running:
```bash
mkdir -p ~/dotfiles/rice-{new theme name}/.config/
```

Then you can go in and add the configurations for all the applications that you would like!
