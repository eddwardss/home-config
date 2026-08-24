mkdir -p ~/.config/wezterm/colors && \
git clone --depth 1 https://github.com/mbadolato/iterm2-color-schemes /tmp/wezterm-themes && \
cp /tmp/wezterm-themes/wezterm/* ~/.config/wezterm/colors/ && rm -rf /tmp/wezterm-themes

