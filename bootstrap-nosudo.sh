#!/usr/bin/env bash
set -euo pipefail

echo "[*] Bootstrap sin sudo — instalando dotfiles y binarios locales"

mkdir -p ~/.local/bin
mkdir -p ~/.local/share

export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k || true

if ! command -v fzf >/dev/null 2>&1; then
  curl -sSL https://github.com/junegunn/fzf/releases/download/0.44.0/fzf-0.44.0-linux_amd64.tar.gz | tar xz -C ~/.local/bin
  chmod +x ~/.local/bin/fzf
fi

if ! command -v rg >/dev/null 2>&1; then
  curl -sL https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz | tar xz -C /tmp
  cp /tmp/ripgrep-13.0.0-x86_64-unknown-linux-musl/rg ~/.local/bin/ || true
fi

cp -v .zshrc ~/
cp -v .p10k.zsh ~/
cp -v .tmux.conf ~/
cp -v alias_funcs.sh ~/.alias_funcs.sh

echo "[*] Bootstrap sin sudo completado."
