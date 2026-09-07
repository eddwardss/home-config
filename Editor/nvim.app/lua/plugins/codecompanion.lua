return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = { adapter = "ollama" },
          inline = { adapter = "ollama" },
        },
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              env = { url = "http://127.0.0.1:11434" },
              schema = {
                model = { default = "qwen2.5-coder-3b:latest" },
                num_ctx = { default = 8192 },
              },
            })
          end,
        },
      })

      -- ХОТКЕИ ДЛЯ ДИАЛОГОВ И ИЗМЕНЕНИЙ КОДА
      vim.api.nvim_set_keymap("n", "\\aa", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "\\aa", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "\\ac", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "\\ac", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
      -- Добавить выделенный визуально код в текущее окно чата (теперь по нажатию \ + a + e)
      vim.api.nvim_set_keymap("v", "\\ae", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

    end,
  },
}
