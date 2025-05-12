#!/bin/sh

# Set Fish as default shell
FISH_INSTALLED=$(which fish 2>/dev/null | grep -q fish && echo "yes" || echo "no")

# 1. Install Fish if not already installed
if [ "$FISH_INSTALLED" = "no" ]; then
    echo "Installing Fish shell..."
    if [ "$(uname)" = "Darwin" ]; then
        # macOS: Install via Homebrew
        if
            ! command -v brew &
            >/dev/null
        then
            echo "Homebrew not found. Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install fish
    else
        # Linux: Install via package manager
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            case $ID in
            ubuntu | debian)
                sudo apt update && sudo apt install -y fish
                ;;
            fedora)
                sudo dnf install -y fish
                ;;
            arch)
                sudo pacman -S --noconfirm fish
                ;;
            esac
        fi
    fi
fi

# 2. Set Fish as the default shell
if [ -z "$SHELL" ] || [ "$SHELL" != "/usr/local/bin/fish" ]; then
    echo "Setting Fish as default shell..."
    sudo chsh -s /usr/local/bin/fish $USER
fi

# 3. Install Oh My Fish if not already installed
if [ ! -d "$HOME/.config/fish" ] || [ ! -f "$HOME/.config/fish/oh-my-fish" ]; then
    echo "Installing Oh My Fish..."
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish -d
fi

# 4. Install theme
echo "Installing emoji-powerline theme..."
omf install emoji-powerline

echo "dotfiles installed successfully!"
echo "Please restart your terminal or run 'exec fish' to apply changes."
