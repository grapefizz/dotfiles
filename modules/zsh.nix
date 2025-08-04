{ ... }:
{
  # Zsh config managed via Nix
  home.file.".config/zsh/.zshrc".source = ./config/zsh/.zshrc;
  # If you have other zsh files, add them here as well
}
