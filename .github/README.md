# Dotfiles

This repository contains my personal dotfiles, which include configurations for various applications and tools. These dotfiles are designed to enhance my development workflow and personalize my working environment.

Feel free to explore and use any parts of these dotfiles that are relevant to your needs. You can find specific configurations and instructions for each tool below.

## Table of Contents

-   [tmux](#tmux)
-   [Neovim](#neovim)
-   [yabai](#yabai)
-   [skhd](#skhd)
-   [wezterm](#wezterm)
-   [zsh](#zsh)

## tmux

The `tmux` configuration file can be found at `.tmux.conf`. It includes various customizations and key bindings to improve productivity within terminal sessions. To use this configuration:

1. Install tmux.
2. Copy the `.tmux.conf` file to your home directory.
3. Start a new tmux session.

```sh
$ cp .tmux.conf ~/
$ tmux
```

## Neovim

The `Neovim` configuration files are located in the `.config/nvim/` directory. They provide a customized setup for Neovim with various plugins and settings to improve editing capabilities and productivity.

To use the Neovim configuration:

1. Install Neovim.
2. Copy the contents of the `nvim` directory to the Neovim configuration directory.

```sh
$ cp -r nvim ~/.config/
```

3. Launch Neovim.
4. Inside Neovim, run the command `:Lazy` to install the plugins using the Lazy plugin manager.

The Lazy plugin manager will automatically install the required plugins specified in the configuration files.

## yabai

The `yabai` configuration file can be found at `.config/yabai/yabairc`. It includes settings for the yabai window manager.

To use this configuration:

1. Install yabai.
2. Copy the `yabairc` file to the appropriate directory.

```sh
$ cp .config/yabai/yabairc ~/.config/yabai/
```

3. Start the yabai service.

```sh
$ yabai --start-service
```

## skhd

The `skhd` configuration file can be found at `.config/skhd/skhdrc`. It includes key bindings for managing windows using the skhd hotkey daemon on macOS.

To use this configuration:

1. Install skhd: Follow the installation instructions from the official skhd repository.
2. Copy the `skhdrc` file to the appropriate directory.

```sh
$ cp .config/skhd/skhdrc ~/.config/skhd/
```

3. Start the skhd service.

```sh
$ skhd --start-service
```

## wezterm

The `wezterm` configuration files are located in the `.config/wezterm/` directory. They include settings and customization options for the wezterm terminal emulator and multiplexer.

To use this configuration:

1. Install wezterm: Follow the installation instructions from the official wezterm repository.
2. Copy the contents of the `config/wezterm/` directory to the wezterm configuration directory.

```sh
$ cp -r config/wezterm/* ~/.config/wezterm/
```

3. Launch wezterm.

## zsh

The `zsh` configuration file can be found at `.zshrc`. It includes customizations for the zsh shell.

To use this configuration:

1. Install zsh.
2. Copy the `.zshrc` file to your home directory.

```sh
$ cp .zshrc ~/
```

3. Restart your terminal or run `source ~/.zshrc` to load the new configuration.
