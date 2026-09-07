# NeoVim Appimage
```
wget -P ~/bin https://github.com/neovim/neovim/releases/download/v0.12.5/nvim-linux-x86_64.appimage
chmod +x ~/bin/nvim-linux-x86_64.appimage

cat << 'EOF' > ~/bin/nvim.app
#!/bin/bash
XDG_CONFIG_HOME="$HOME/.config" XDG_DATA_HOME="$HOME/.local/share" exec "$HOME/bin/nvim-linux-x86_64.appimage" "$@"
EOF

chmod +x ~/bin/nvim.app
```
# Rust is required to install plugins
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
```
# Removing an unnecessary plugin
```
rm ~/.config/nvim/lua/plugins/unneeded_plugin.lua && nvim --headless "+Lazy! clean" +qa
```

