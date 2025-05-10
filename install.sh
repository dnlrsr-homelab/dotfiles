#!/bin/bash

# Create a directory for dotfiles if it doesn't exist
mkdir -p ~/.dotfiles

# Create symlinks for configuration files
ln -sf ~/dotfiles/config/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/config/zsh/.zshrc ~/.zshrc
# Add more symlinks as needed

echo "Dotfiles installed successfully!"
