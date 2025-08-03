# ============================================================================
# SHELL INITIALIZATION
# ============================================================================

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# OH-MY-ZSH CONFIGURATION
# ============================================================================

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Oh-My-Zsh theme configuration
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Oh-My-Zsh update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13

# Oh-My-Zsh plugins are now managed by Home Manager
# The following plugins are configured in home.nix:
# - git
# - kitty

# Load Oh-My-Zsh (path managed by Home Manager)
if [[ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]]; then
  source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
fi

# Clean up any broken completion symlinks on startup
if [[ -d "/opt/homebrew/share/zsh/site-functions" ]]; then
  find /opt/homebrew/share/zsh/site-functions -type l ! -exec test -e {} \; -delete 2>/dev/null
fi

# ============================================================================
# PATH CONFIGURATION
# ============================================================================

# pnpm configuration
export PNPM_HOME="/Users/Ari/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun configuration
export BUN_INSTALL="$HOME/.bun"

# PATH exports
export PATH="/Users/Ari/lavat:$PATH"
export PATH="$PATH:/Users/Ari/.spicetify"
export PATH="$PATH:/Users/Ari/.local/bin/lvim"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:/Users/Ari/.lmstudio/bin"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# ============================================================================
# TOOL INITIALIZATION
# ============================================================================

# Starship prompt
eval "$(starship init zsh)"

# Pyenv initialization
eval "$(pyenv init --path)"

# Zoxide initialization
eval "$(zoxide init zsh)"

# Initialize tools available through Nix
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Auto-start sketchybar if not running (only in interactive shells)
if [[ $- == *i* ]] && command -v sketchybar >/dev/null 2>&1 && ! pgrep -x "sketchybar" > /dev/null; then
  (sketchybar > /dev/null 2>&1 &)
fi

# Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Bun completions
[ -s "/Users/Ari/.bun/_bun" ] && source "/Users/Ari/.bun/_bun"

# ============================================================================
# ALIASES
# ============================================================================

# System utilities
alias clock="tty-clock -c -t -C 4"
alias fzfb="fzf --preview \"bat --color=always --style=numbers --line-range=:500 {}\""
alias pipez="pipes.sh -t 1"
alias search="s -p google"
alias ls="eza --icons"
alias cd="z"
alias poke="pokeget --hide-name random"
alias clean="clear && neofetch && ez"

# Home Manager shortcuts
alias hm="home-manager switch --flake .#Ari"
alias hms="home-manager switch --flake .#Ari"

# Application shortcuts
alias ff="open /Users/Ari/Applications/Firefox.app"
alias stm="open /Users/Ari/Applications/Steam.app"
alias disc="open /Users/Ari/Applications/Vesktop.app"
alias balatro="'/Users/Ari/Library/Application Support/Steam/steamapps/common/Balatro/run_lovely_macos.sh'"

# Service management - Simple process management
alias stop-stuff="pkill yabai; pkill skhd; pkill sketchybar"
alias start-stuff="(yabai > /dev/null 2>&1 &); (skhd > /dev/null 2>&1 &); (sketchybar > /dev/null 2>&1 &)"
alias restart-stuff="stop-stuff; sleep 1; start-stuff"
alias stop-wine="pgrep -f \"wine\" | xargs -I {} kill -9 {}"
