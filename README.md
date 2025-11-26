nixos (and home-manager) configuration for a practically-minded young cs major

moved to nixos after using arch for the vast majority of my linux career largely as a summer project in 2025

i encourage you not to use this configuration as is, even if i do: not very pretty, exceedingly simple, not very elegant, written stupidly

IF YOU WANT TO USE THE CONFIG:
clone into any directory (i recommend home folder)
cd into hosts/generic and
 - change hostname in configuration.nix to desired hostname
 - change user in configuration.nix and home.nix to user name
 - consider setting your hyprland monitors in home.nix under wayland.windowManager.hyprland.settings.monitor
 - consider changing your timezone in configuration.nix under time.timeZone
run sudo nixos-rebuild switch --flake /path/to/directory/nixosconf/#generic
fix as necessary

hosts:

tiamat is a framework 13 laptop, named because the io modules are kind of like the heads (also the name is awesome)

 - 7040 mainboard
 - 32 gb ram

vecna is a large, forboding desktop in a corsair 4000D airflow. looks wholly evil. appropriately named after a most evil lich

- ryzen 7800x3d
- 32 gb ram
- rog strix motherboard (which i kinda hate)
- xfx speedster 7900xtx

xanathar ii (my old laptop, and maybe future server) is an hp pavilion from a few years ago, named so due to its omnipresence (at least in my backpack)

- whatever is in one of those things

hope you enjoy reading my config files
