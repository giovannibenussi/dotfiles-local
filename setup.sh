#!/bin/bash
set -e

# https://insomnia.rest/download
# https://linear.app/download
# https://openai.com/chatgpt/desktop/
# https://www.logitech.com/es-roam/mx/mx-software.html
# https://www.notion.com/download
# https://www.notion.com/product/mail/download
# https://folivora.ai/ # BetterTouchTool
# https://github.com/MonitorControl/MonitorControl/releases
#
# https://cleanshot.com/
#
# Neovim:
# git clone https://github.com/github/copilot.vim.git ~/.config/nvim/pack/github/start/copilot.vim
# :Copilot setup
#
# Youtube Music

echo "Checking for NVM..."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if command -v nvm >/dev/null 2>&1; then
  echo "NVM is already installed."
else
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

nvm install lts/iron
nvm alias default lts/iron
echo "Node version: $(node -v)"

npm i -g eslint_d

echo "Install Brew file"
brew bundle install --file=./Brewfile

if [ ! -d "$HOME/dotfiles" ]; then
  git clone git@github.com:thoughtbot/dotfiles.git ~/dotfiles
  brew install rcm
  env RCRC=$HOME/dotfiles/rcrc rcup
else
  echo "~/dotfiles already exists. Skipping clone."
fi

if [ ! -d "$HOME/dotfiles-local" ]; then
  git clone git@github.com:giovannibenussi/dotfiles-local.git ~/dotfiles-local
  env RCRC=$HOME/dotfiles/rcrc rcup
else
  echo "~/dotfiles-local already exists. Skipping clone."
fi

if [ ! -d "$HOME/dotfiles-local/config" ]; then
  git clone git@github.com:giovannibenussi/config.git ~/dotfiles-local/config
  env RCRC=$HOME/dotfiles/rcrc rcup
else
  echo "~/dotfiles-local/config already exists. Skipping clone."
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh installed, skipping"
fi

# pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
