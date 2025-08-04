{ config, pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./zsh.nix
    ./stylix.nix
  ];

  home.username = "Ari";       # Change this
  home.homeDirectory = "/Users/Ari";  # Change this
  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "kitty"
      ];
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      # Source our custom zsh configuration
      if [[ -f ~/.config/zsh/.zshrc ]]; then
        source ~/.config/zsh/.zshrc
      fi
    '';
  };

  # Install CLI packages available through nixpkgs
  home.packages = with pkgs; [
    # Home Manager command
    home-manager
    
    # Core development tools
    git
    lunarvim
    gcc
    neovim
    
    # Programming languages & runtimes
    go
    lua
    nodejs
    rustc
    cargo
    zig
    
    # System monitoring & info
    btop
    htop    
    onefetch
    tokei
    
    # File management & navigation
    bat
    eza
    tree
    fd
    ripgrep
    ranger
    fzf
    zoxide
    
    # Terminal utilities
    kitty
    tmux
    starship
    
    # Network tools
    curl
    wget
    
    # JSON/Data processing
    jq
    
    # Fun terminal tools
    cava
    cbonsai
    pipes
    figlet
    cowsay
    lolcat
    
    # Window management (macOS)
    sketchybar
    yabai
    skhd
    jankyborders
    
    # Git tools
    lazygit
  ];

  # Symlink app configs from the repo's config directory into ~/.config
  home.file.".config/zsh".source = ./config/zsh;
  home.file.".config/lvim".source = ./config/lvim;
  home.file.".config/yabai".source = ./config/yabai;
  home.file.".config/skhd".source = ./config/skhd;
  home.file.".config/borders".source = ./config/borders;
  home.file.".config/btop".source = ./config/btop;
  home.file.".config/starship".source = ./config/starship;
  home.file.".config/fastfetch".source = ./config/fastfetch;

  # macOS Launch Agents for automatic startup
  # Note: Launch agent disabled due to permission issues - using zsh auto-start instead
  # launchd.agents = {
  #   sketchybar = {
  #     enable = true;
  #     config = {
  #       ProgramArguments = [ "${pkgs.sketchybar}/bin/sketchybar" ];
  #       KeepAlive = true;
  #       RunAtLoad = true;
  #       StandardOutPath = "/tmp/sketchybar.log";
  #       StandardErrorPath = "/tmp/sketchybar.error.log";
  #       ProcessType = "Interactive";
  #     };
  #   };
  # };
}

