# ❄️ My NixOS Configuration

A personal, reproducible NixOS configuration using **Flakes**, **Home Manager**, and **Hyprland**.

![Wallpaper](wallpaper.png)

## ✨ Features

### 🎨 Theming & Desktop
- **Style:** Fully themed with [Stylix](https://github.com/danth/stylix) using **Catppuccin Mocha** (Dark).
- **Window Manager:** [Hyprland](https://hyprland.org/) with custom keybinds and animations.
- **Shell:** [AGS](https://github.com/Aylur/ags) (Aylur's GTK Shell) for bars and widgets.
- **Terminal:** [Ghostty](https://ghostty.org/) & [Kitty](https://sw.kovidgoyal.net/kitty/).
- **Browser:** [Zen Browser](https://github.com/zen-browser/desktop) with Nebula theme.

### 🛠️ Development Environment
- **Languages:** Node.js, Bun, Rust (Cargo), GCC.
- **Databases:** PostgreSQL, Redis.
- **Tools:** Docker, Podman, Git, LazyGit, Bruno, DBeaver.
- **Editors:** Neovim (default), VS Code (via system packages).

### 🎮 Gaming
- **Launchers:** Steam, Lutris.
- **Minecraft:** XMCL Launcher with Java 8/17 support.
- **Optimization:** Gamemode, Gamescope.

## 📂 Structure

```
├── ❄️ flake.nix             # Entry point & inputs
├── ⚙️ configuration.nix     # System-wide configuration
├── 🏠 home.nix              # Home Manager configuration
├── 📦 modules/              # Modularized configs
│   ├── ⚙️ nixos/            # System modules (hardware, network, etc.)
│   ├── 🏠 home-manager/     # User modules (apps, zsh, hyprland, etc.)
│   └── 🔧 config/           # Dotfiles (nvim, etc.)
└── 🖼️ wallpaper.png         # Desktop wallpaper
```

## 🚀 Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Sultonov-557/nixos.git ~/nixos
   cd ~/nixos
   ```

2. **Rebuild the system:**
   ```bash
   sudo nixos-rebuild switch --flake .#nixos
   ```

## 👥 Credits

- **Base:** NixOS Unstable
- **Shells:** DankMaterialShell, Caelestia Shell
- **Browser:** Zen Browser Flake
