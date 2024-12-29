# 🚀 Modern ZSH Configuration

A thoughtfully organized, modular ZSH configuration focused on developer productivity and a great terminal experience.

## ✨ Features

- 📁 Modular configuration split into logical files
- 🔍 Powerful fuzzy finding with FZF integration
- 🎯 Smart directory jumping with Zoxide
- 🔐 Secure local overrides for sensitive information
- 📝 Intelligent history search and management
- ⚡ Fast startup time through optimized loading
- 🎨 Clean and organized configuration structure

## 🛠️ Prerequisites

- [Git](https://git-scm.com/)
- [ASDF](https://asdf-vm.com/) for version management (optional)

## 📦 Installation

Simply run the following to get set up. Never trust these though so please check out the install script first.

```bash
curl -fsSL https://raw.githubusercontent.com/jbydeley/dotfiles/main/install.sh | bash
```

## ⚙️ Configuration

### Local Overrides

Add machine-specific configurations or secrets in `~/.overrides/*.zsh`. These files are gitignored and won't be committed to the repository.

### Key Bindings

- `Up/Down`: Search through history based on current input
- FZF keybindings for enhanced file and history searching
- Customizable through `~/.zsh/keybinds.zsh`

### History

- Stores 5000 commands in history
- Intelligent duplicate handling
- Shared history between sessions
- Ignores commands starting with spaces

### Completion

- Case-insensitive completion
- Color-coded completion menu
- Preview window for directory navigation

## 🔧 Customization

Add `.zsh` files to `.overrides` to customize anything.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [FZF](https://github.com/junegunn/fzf) for fuzzy finding
- [Zoxide](https://github.com/ajeetdsouza/zoxide) for smart directory jumping
- [ASDF](https://asdf-vm.com/) for version management
