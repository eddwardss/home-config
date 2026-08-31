Removing an unnecessary plugin

rm ~/.config/nvim/lua/plugins/unneeded_plugin.lua && nvim --headless "+Lazy! clean" +qa
