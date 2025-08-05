{ config, pkgs, ... }:
{
  stylix = {
    enable = true;
    image = "./config/wallpapers/voxel-city.jpg";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sizes.terminal = 17.75;
    };

    targets = {
      kitty.enable = false;
      ghostty.enable = false;
    };
  };
}
