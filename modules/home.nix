{ config, pkgs, ... }:

{
  imports = [
    ./stylix.nix
  ];

  home.username = "Ari";       # Change this
  home.homeDirectory = "/Users/Ari";  # Change this
  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
        file = "share/zsh/site-functions";
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];
    initContent = ''
      # Catppuccin Mocha theme for fzf (with transparency)
      export FZF_DEFAULT_OPTS=" \
      --color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 \
      --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
      --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
      --color=selected-bg:#45475A \
      --color=border:#6C7086,label:#CDD6F4"
      
      # Configure fzf-tab to use the same colors
      zstyle ':fzf-tab:*' fzf-flags --color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 \
        --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
        --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
        --color=selected-bg:#45475A \
        --color=border:#6C7086,label:#CDD6F4
      
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
    zsh-fzf-tab
    zoxide
    
    # Terminal utilities
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

    # Random dependencies
    pulseaudio
  ];

  # Symlink app configs from the repo's config directory into ~/.config
  home.file.".config/ghostty".source = ../config/ghostty;
  home.file.".config/zsh".source = ../config/zsh;
  home.file.".config/lvim".source = ../config/lvim;
  home.file.".config/yabai".source = ../config/yabai;
  home.file.".config/skhd".source = ../config/skhd;
  home.file.".config/borders".source = ../config/borders;
  home.file.".config/btop".source = ../config/btop;
  home.file.".config/starship".source = ../config/starship;
  home.file.".config/fastfetch".source = ../config/fastfetch;
  home.file.".config/sketchybar".source = ../config/sketchybar;
  home.file.".config/wallpapers".source = ../config/wallpapers;

}

