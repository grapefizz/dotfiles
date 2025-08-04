{ ... }:
{
  # Cava config managed via Nix
  home.file.".config/cava/config".source = ./config/cava/config;
  # Optionally, add shaders if you want to manage them via Nix as well:
  home.file.".config/cava/shaders/bar_spectrum.frag".source = ./config/cava/shaders/bar_spectrum.frag;
  home.file.".config/cava/shaders/northern_lights.frag".source = ./config/cava/shaders/northern_lights.frag;
  home.file.".config/cava/shaders/pass_through.vert".source = ./config/cava/shaders/pass_through.vert;
}
