#!/usr/bin/env bash
set -euo pipefail

echo "[*] Iniciando bootstrap con sudo..."

sudo apt update -y
sudo apt install -y zsh git curl tmux neovim fzf ripgrep bat unzip wget build-essential

export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || true

cp -v .zshrc ~/
cp -v .p10k.zsh ~/
cp -v .tmux.conf ~/
cp -v alias_funcs.sh ~/.alias_funcs.sh

chsh -s $(which zsh) || true

echo "[*] Bootstrap completo."
