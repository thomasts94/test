{ config, lib, inputs, pkgs, ...}: {


programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
     atool
     neovim
     unzip
     qemu
     virt-manager
     virglrenderer
     gvfs
     inputs.nix-software-center.packages.${system}.nix-software-center
     brave
     wofi
     wl-clipboard
     kitty
     libadwaita
     adw-gtk3
     rofi-wayland
     xdg-desktop-portal-hyprland
     xdg-desktop-portal-gtk
     xdg-utils
     stremio
     pavucontrol
     python3
     python3Packages.pipx
     waybar
     hyprpaper
     pkgs.distrobox 
     pkgs.polkit_gnome
     swayidle
     swaylock-effects
     pkgs.libsForQt5.qt5ct
     pkgs.libsForQt5.qt5.qtwayland
     pkgs.qt6.qtwayland
     pkgs.blueman
     micro
     pkgs.qbittorrent
     pkgs.libsForQt5.qtstyleplugin-kvantum
     pkgs.qt6Packages.qtstyleplugin-kvantum
     mako
     ];
 
  fonts.packages = with pkgs; [
     roboto
     font-awesome
     nerdfonts
     jetbrains-mono
   ];
   
}
