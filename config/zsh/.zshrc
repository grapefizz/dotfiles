# ============================================================================
# SHELL INITIALIZATION - OPTIMIZED FOR SPEED
# ============================================================================

# Skip all processing for non-interactive shells
[[ $- != *i* ]] && return

# ============================================================================
# OH-MY-ZSH CONFIGURATION
# ============================================================================

# Note: Oh-My-Zsh is already loaded by Home Manager in the main .zshrc
# The following configuration is commented out to avoid duplicate loading
# which was causing significant startup delays

# Oh-My-Zsh theme configuration

# Oh-My-Zsh plugins are managed by Home Manager
# Current plugins configured in home.nix: git, kitty

# Oh-My-Zsh is already loaded by Home Manager - no need to source again

# Clean up any broken completion symlinks on startup (run weekly only)
# Moved to a separate function to avoid running on every shell startup
cleanup_broken_symlinks() {
  if [[ -d "/opt/homebrew/share/zsh/site-functions" ]]; then
    find /opt/homebrew/share/zsh/site-functions -type l ! -exec test -e {} \; -delete 2>/dev/null
  fi
  # Also clean up old brew completions that might be broken
  if [[ -d "/usr/local/share/zsh/site-functions" ]]; then
    find /usr/local/share/zsh/site-functions -type l ! -exec test -e {} \; -delete 2>/dev/null
  fi
}

# ============================================================================
# PATH CONFIGURATION
# ============================================================================

# PATH configuration - optimized to extend Home Manager's existing PATH
export PNPM_HOME="/Users/Ari/Library/pnpm"
export BUN_INSTALL="$HOME/.bun"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Extend PATH with additional tools (Home Manager already handles some paths)
# Using typeset -U to ensure unique entries and avoid duplicates
typeset -U path
path=(
  "$HOME/lavat"
  "$PNPM_HOME"
  "$HOME/.local/bin"
  "$BUN_INSTALL/bin"
  "$HOME/.spicetify"
  "$HOME/.local/bin/lvim"
  "$HOME/.lmstudio/bin"
  $path  # Preserve existing PATH from Home Manager
)

# ============================================================================
# TOOL INITIALIZATION - OPTIMIZED FOR SPEED
# ============================================================================

# Initialize tools with lazy loading and caching

# Pyenv initialization (cached and lazy)
if command -v pyenv >/dev/null 2>&1; then
  # Cache pyenv initialization to speed up subsequent loads
  if [[ ! -f "$HOME/.cache/pyenv_init" ]] || [[ "$HOME/.pyenv/bin/pyenv" -nt "$HOME/.cache/pyenv_init" ]]; then
    mkdir -p "$HOME/.cache"
    pyenv init --path > "$HOME/.cache/pyenv_init"
  fi
  source "$HOME/.cache/pyenv_init"
fi

# Starship prompt (lazy load)
if command -v starship >/dev/null 2>&1; then
  if [[ ! -f "$HOME/.cache/starship_init.zsh" ]] || [[ $(command -v starship) -nt "$HOME/.cache/starship_init.zsh" ]]; then
    mkdir -p "$HOME/.cache"
    starship init zsh > "$HOME/.cache/starship_init.zsh"
  fi
  source "$HOME/.cache/starship_init.zsh"
fi

# Zoxide initialization (lazy load)
if command -v zoxide >/dev/null 2>&1; then
  if [[ ! -f "$HOME/.cache/zoxide_init.zsh" ]] || [[ $(command -v zoxide) -nt "$HOME/.cache/zoxide_init.zsh" ]]; then
    mkdir -p "$HOME/.cache"
    zoxide init zsh > "$HOME/.cache/zoxide_init.zsh"
  fi
  source "$HOME/.cache/zoxide_init.zsh"
fi

# Auto-start sketchybar (completely async, no blocking)
if [[ $- == *i* ]] && command -v sketchybar >/dev/null 2>&1; then
  # Use a background job that doesn't block shell startup
  {
    if ! pgrep -x "sketchybar" > /dev/null 2>&1; then
      sketchybar > /dev/null 2>&1 &
    fi
  } &!
fi


# Bun completions (truly lazy load - only when bun command is used)
if [ -s "/Users/Ari/.bun/_bun" ]; then
  # Create a wrapper function that loads completions on first use
  bun() {
    # Load completions only once when bun is first called
    if [[ -s "/Users/Ari/.bun/_bun" ]]; then
      source "/Users/Ari/.bun/_bun"
    fi
    # Replace this function with the real bun command
    unfunction bun
    # Call the real bun with all arguments
    command bun "$@"
  }
fi

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

# Performance and debugging
alias profile-zsh="time zsh -i -c exit"
alias cleanup-completions="cleanup_broken_symlinks"

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

