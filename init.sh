#!/bin/bash

# homebrew
if [[ ! $(which brew) ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update

# brew taps
brew tap homebrew/cask-fonts

# package list
PACKAGES=(
  htop
#  fzf
#  ranger
#  autoconf
  wget
  zsh
#  nmap
#  automake
  git
  jq
#  npm
#  node
#  watchman
#  sqlite3
#  pkg-config
#  python3
  tmux
  tree
  vim
  gdb
#  docker
#  docker-machine
#  koekeishiya/formulae/yabai
#  koekeishiya/formulae/skhd
  github/gh/gh
  svn
  openvpn
  alt-tab
  bat
#  gtypist
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

# applicaion list
# https://formulae.brew.sh/cask/
APPLICATIONS=(
  google-chrome
  iterm2
  alfred
  telegram
#  coconutbattery
  itsycal
  google-backup-and-sync
  visual-studio-code
  slack
#  intellij-idea
  vlc
  notion
#  docker
#  ngrok
#  wireshark
#  istat-menus
  microsoft-office
  microsoft-excel
  microsoft-powerpoint
  microsoft-outlook
  microsoft-teams
#  pock
)

#echo "Installing applications..."
#brew install --cask ${APPLICATIONS[@]}

FONTS=(
  font-inconsolata
  font-roboto-mono
  font-hack-nerd-font
)

echo "Installing fonts..."
brew install --cask ${FONTS[@]}

echo "Configuring OSX..."
# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Make dock faster
defaults write com.apple.dock autohide -bool true;killall Dock
defaults write com.apple.dock autohide-delay -float 0;killall Dock
defaults write com.apple.dock autohide-time-modifier -float 0;killall Dock

# Make launchpad faster
defaults write com.apple.dock springboard-show-duration -int 0;killall Dock
defaults write com.apple.dock springboard-hide-duration -int 0;killall Dock

# Make Mission Control faster
defaults write com.apple.dock expose-animation-duration -float 0;killall Dock

# Make Save Dialog faster
defaults write -g NSWindowResizeTime -float 0.01

# Make popup faster
defaults write -g NSAutomaticWindowAnimationsEnabled -bool FALSE

# See all files
defaults write com.apple.Finder AppleShowAllFiles YES

echo "Creating directory..."
[[ ! -d workspace ]] && mkdir workspace

echo "Setting tmux..."
# tmux
cp ./bin/tat /usr/local/bin
cp tmux.conf ~/.tmux.conf

echo "Setting zsh..."
# zsh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
npm install --global pure-prompt

cp zshrc ~/.zshrc
source ~/.zshrc

echo "Downloading iterm theme..."
# iterm theme
#wget https://raw.githubusercontent.com/JonathanSpeek/palenight-iterm2/master/palenight.itermcolors

echo "Setting vim..."
# vim
cp vimrc ~/.vimrc
source ~/.vimrc
