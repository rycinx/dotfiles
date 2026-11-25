#!/usr/bin/env bash
# Install all packages listed below. Edit the lists freely — nothing is read from config.arch.toml.
set -euo pipefail

# ---------------------------------------------------------------- edit here
PACMAN_PKGS=(
  # display manager
  greetd
  # bootloader
  efibootmgr
  # firmwares and services
  sof-firmware
  alsa-ucm-conf
  alsa-firmware
  bluez
  pipewire
  pipewire-pulse
  pipewire-alsa
  pipewire-jack
  wireplumber
  power-profiles-daemon
  # package manager
  flatpak
  # man page
  tealdeer
  man-db
  # cli tools
  bash-completion
  zoxide
  rsync
  eza
  fzf
  bat
  fd
  ripgrep
  # tui tools
  btop
  lazygit
  yazi
  # clipboard
  cliphist
  # browser
  helium-browser-bin
  # music and video
  mpv
  go-musicfox-git
  # desktop environment
  hyprland
  noctalia
  # portal / capture
  gpu-screen-recorder
  grim
  slurp
  xdg-desktop-portal-gnome
  xdg-desktop-portal-hyprland
  # term
  foot
  # editor
  neovim
  # input method
  fcitx5-im
  fcitx5-rime
  rime-ice-git
  # fonts
  ttf-jetbrains-mono-nerd
  ttf-maplemono-nf-cn
  noto-fonts-emoji
  # network
  ufw
  dae
)

AUR_PKGS=(
  flyline
)
# ---------------------------------------------------------------------------

log() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
err() { printf '\033[1;31m==>\033[0m %s\n' "$*" >&2; }

if [[ $EUID -eq 0 ]]; then
  err "Do not run as root. The script calls sudo where needed."
  exit 1
fi

log "Refreshing pacman databases"
sudo pacman -Sy --noconfirm
log "Installing paru"
sudo pacman -S --needed --noconfirm paru

# --- official --------------------------------------------------------
if ((${#PACMAN_PKGS[@]})); then
  log "Installing ${#PACMAN_PKGS[@]} packages from official"
  paru -S --needed --noconfirm "${PACMAN_PKGS[@]}"
fi

# --- AUR -------------------------------------------------------------------
if ((${#AUR_PKGS[@]})); then
    log "Installing ${#AUR_PKGS[@]} packages from AUR"
    paru -S --needed --noconfirm "${AUR_PKGS[@]}"
fi

# --- verification ----------------------------------------------------------
log "Verifying"
failed=()
for p in "${PACMAN_PKGS[@]}" "${AUR_PKGS[@]}"; do
  paru -Q "$p" >/dev/null 2>&1 || failed+=("$p")
done

if ((${#failed[@]})); then
  err "Not installed: ${failed[*]}"
  exit 1
fi

log "All $(( ${#PACMAN_PKGS[@]} + ${#AUR_PKGS[@]} )) packages installed"
