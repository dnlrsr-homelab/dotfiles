#!/bin/bash

# Create a directory for dotfiles if it doesn't exist
mkdir -p ~/dotfiles

# Install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Create symlinks for configuration files
ln -sf ~/dotfiles/config/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/config/zsh/.zshrc ~/.zshrc
# Add more symlinks as needed

echo "Dotfiles installed successfully!"
