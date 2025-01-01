#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/jbydeley/dotfiles.git "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
else
    echo "Dotfiles directory already exists"
    cd "$DOTFILES_DIR"
    git pull
fi

# Function to detect OS
get_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "mac"
    elif [[ -f "/etc/debian_version" ]]; then
        echo "debian"
    else
        echo "unknown"
    fi
}

# Function to install Helix based on OS
install_helix() {
    local os_type=$(get_os)

    echo "Installing Helix..."

    case $os_type in
        "mac")
            if ! command -v brew &> /dev/null; then
                echo "Homebrew not found. Installing Homebrew..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            brew install helix
            ;;
        "debian")
            sudo add-apt-repository -y ppa:maveonair/helix-editor
            sudo apt update
            sudo apt install -y helix
            ;;
        *)
            echo "Unsupported operating system for Helix installation"
            exit 1
            ;;
    esac
}

# Function to install a package based on OS
install_package() {
    local package_name=$1
    local os_type=$(get_os)

    echo "Installing $package_name..."

    case $os_type in
        "mac")
            if ! command -v brew &> /dev/null; then
                echo "Homebrew not found. Installing Homebrew..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            brew install $package_name
            ;;
        "debian")
            sudo apt-get update
            sudo apt-get install -y $package_name
            ;;
        *)
            echo "Unsupported operating system"
            exit 1
            ;;
    esac
}

main() {
    # List of packages to install
    packages=("zsh" "git" "stow" "tmux" "bat")

    # On ubuntu, the installed bat is `batcat` so this is a bug where we will always ask to install it. 
    # SHOULDDO: Use nix package manager to manage dependencies instead of trying to guess per OS.

    # Install each package if not already installed
    for package in "${packages[@]}"; do
        if ! command -v "$package" &> /dev/null; then
            read -p "Would you like to install $package? (y/n) " answer
            if [[ "$answer" =~ ^([yY]|[yY][eE][sS])$ ]]; then
                echo "Installing $package"
                install_package "$package"
            fi
        else
            echo "$package is already installed"
        fi
    done

    # Install Helix if not already installed
    if ! command -v hx &> /dev/null; then
        read -p "Would you like to install Helix editor? (y/n) " answer
        if [[ "$answer" =~ ^([yY]|[yY][eE][sS])$ ]]; then
            install_helix
        fi
    else
        echo "Helix is already installed"
    fi

    # Set zsh as default shell if not already
    if [ "$SHELL" != "$(which zsh)" ]; then
        chsh -s "$(which zsh)"
    fi

    # Install fzf if missing
    if [ ! -d "$HOME/.fzf" ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
        "$HOME/.fzf/install"
    fi

    # Install starship if missing
    if [ ! -f "/usr/local/bin/starship" ]; then
        curl -fsSL https://starship.rs/install.sh | sh
    fi

    # Install zoxide if missing
    if [ ! -f "$HOME/.local/bin/zoxide" ]; then
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
    fi

    # Ask user if they want to back up .zshrc once
    read -p "Would you like to backup your .zshrc file? (y/n) " answer
    if [[ "$answer" =~ ^([yY]|[yY][eE][sS])$ ]]; then
        backup_file="$HOME/.zshrc.backup-$(date +%Y%m%d-%H%M%S)"
        cp "$HOME/.zshrc" "$backup_file"
        echo "Backup created at: $backup_file"
    fi

    # After all installations, stow the dotfiles
    echo "Symlinking dotfiles..."
    stow .
}

# Execute main function
main

echo "Installation complete! Please restart your shell."