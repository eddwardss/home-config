-- Нативный ИИ-плагин для Ollama в Docker (модель qwen2.5-coder-3b)
return {
  "David-Kunz/gen.nvim",
  config = function()
    require("gen").setup({
      model = "qwen2.5-coder-3b:latest",
      host = "127.0.0.1",
      port = "11434",
      display_mode = "vertical-split",
      show_prompt = false,
    })
    -- Горячие клавиши ИИ: Бэкслеш "\" + "a" вызовет меню команд ИИ
    vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>Gen<cr>", { silent = true })
  end,
}
