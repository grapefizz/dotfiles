<h1 align="center">
<img width="150px" src="https://github.com/user-attachments/assets/2bb2ceaf-5dbe-4c00-9a9c-7f95e754acc5" />
    <br>
        macOS dotfiles managed with Nix
    <br>
    <img width="200" alt="image" src="https://github.com/user-attachments/assets/fad90f0c-8dce-4ee3-867b-b76f771215a8">
</h1>

<img width="1710" alt="image" src="Screenshots/SS1.png" />

> [!WARNING]  
> Project file structure is horrible as of 04/07/2025, don't bother trying to understand it

## Setup

1. Install Nix:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

2. Clone repo:
   ```bash
   git clone https://github.com/grapefizz/dots.git
   cd dotfiles
   ```

3. Apply dots:
    ```bash
    sudo darwin-rebuild switch --flake .#Ari-MacBook
    ```
    or
    ```bash
    sudo nix run nix-darwin -- switch --flake .#Ari-MacBook
    ```
  > [!IMPORTANT]  
  > You will need to enter your password ***at least once***.

## Tools

- yabai (window manager)
- skhd (hotkeys)
- sketchybar (status bar)
- kitty (terminal)
- neovim (editor)

![Screenshot](Screenshots/SS2.png)