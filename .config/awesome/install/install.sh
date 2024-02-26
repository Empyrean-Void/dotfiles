#!/bin/sh
user=$USER

pre_install () {
  echo "Doing pre-install checks"

  echo "Checking for Git"
  if pacman -Qq | grep -w "git" > /dev/null; then
    echo "Git was found"
  else
    echo "Git was not found"
    sudo pacman -S --noconfirm git
  fi

  echo "Checking for Yay (AUR helper)"
  if pacman -Qq | grep -w "yay" > /dev/null; then
    echo "Yay was found"
  else
    echo "Yay was not found"
    mkdir -v builds && cd builds
    git clone "https://aur.archlinux.org/yay"

    cd builds && makepkg -si
  fi
}

pkg_install () {
  echo "Installing needed packages"
  yay -S --needed - < pkglist.txt
}

cfg_install () {
  echo "Installing needed configs"

  echo "Checking for Awesome"
  if [[ -d "$HOME/.config/awesome" ]]; then
    echo "Awesome was found"
  else
    echo "Awesome was not found"
    git clone "https://github.com/Empyrean-Void/awesomewm" $HOME/.config/awesome
  fi

  echo "Checking for Neovim"
  if [[ -d "$HOME/.config/nvim" ]]; then
    echo "Neovim was found"
  else
    echo "Neovim was not found"
    git clone "https://github.com/Empyrean-Void/Neovim" $HOME/.config/nvim
  fi

  echo "Checking for Wezterm"
  if [[ -h "$HOME/.wezterm.lua" ]]; then
    echo "Wezterm was found"
  else
    echo "Wezterm was not found"
    ln -sv $HOME/.config/awesome/wezterm.lua .wezterm.lua
  fi

  echo "Checking for Zsh"
  if [[ -h "$HOME/.zshrc" ]]; then
    echo "Zsh was found"
  else
    echo "Zsh was not found"
    ln -sv $HOME/.config/awesome/zsh/zshrc .zshrc
  fi

  echo "Checking for Rofi"
  if [[ -h "$HOME/.config/rofi/config.rasi" ]]; then
    echo "Rofi was found"
  else
    echo "Rofi was not found"
    ln -sv $HOME/.config/awesome/rofi/config.rasi $HOME/.config/rofi/config.rasi
  fi

  echo "Checking for Picom"
  if [[ -h "$HOME/.config/picom/picom.conf" ]]; then
    echo "Picom was found"
  else
    echo "Picom was not found"
    ln -sv $HOME/.config/awesome/picom.conf $HOME/.config/picom/picom.conf
  fi

  echo "Checking for Betterlockscreen"
  if [[ -h "$HOME/.config/betterlockscreen/betterlockscreenrc" ]]; then
    echo "Betterlockscreen was found"
  else
    echo "Betterlockscreen was not found"
    ln -sv $HOME/.config/awesome/betterlockscreenrc $HOME/.config/betterlockscreen/betterlockscreenrc
  fi
}

pre_install
pkg_install
cfg_install

echo "Install ran successfully"
