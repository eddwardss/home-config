return {
--  enabled = false, -- <-- ЭТА СТРОКА ВЫКЛЮЧАЕТ ПЛАГИН, Lazy его проигнорирует
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    -- ВМЕСТО <C-b> ИСПОЛЬЗУЕМ <leader>b (нажатие бэкслеша '\' и затем 'b')
    { "<leader>b", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      view = { width = 30, side = "left" },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = { enable = true, update_root = true },
      filters = { dotfiles = false },
      git = { enable = true, ignore = false },
    })
  end,
}
