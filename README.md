<h1 align="center">
<img width="150px" src="https://github.com/user-attachments/assets/2bb2ceaf-5dbe-4c00-9a9c-7f95e754acc5" />
    <br>
        macOS dotfiles managed with Nix
    <br>
    <img width="200" alt="image" src="https://github.com/user-attachments/assets/fad90f0c-8dce-4ee3-867b-b76f771215a8">
</h1>

<img width="1710" alt="image" src="Screenshots/ss1.png" />

## Setup

1. Install Nix:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

2. Clone and apply:
   ```bash
   git clone https://github.com/grapefizz/dots.git
   cd dotfiles
   nix run home-manager/master -- switch --flake .#Ari
   ```

## Tools

- yabai (window manager)
- skhd (hotkeys)
- sketchybar (status bar)
- kitty (terminal)
- neovim (editor)

![Screenshot](Screenshots/ss2.png)

<<<<<<< HEAD
=======
![Screenshot 2](/Screenshots/SS2.png)

![Screenshot 3](/Screenshots/ss3.png)

![Screenshot 4](/Screenshots/ss4.png)

![Screenshot 5](/Screenshots/ss5.png)
>>>>>>> d6840fb40c0dcb6653658b09d46e08633f02b40a
