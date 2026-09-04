return {
  "huggingface/llm.nvim",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "MasonToolsStartingInstall",
      callback = function()
        local registry = require("mason-registry")
        if not registry.is_installed("llm-ls") then
          vim.cmd("MasonInstall llm-ls")
        end
      end,
    })
  end,
  config = function()
    require("llm").setup({
      backend = "ollama",
      url = "http://localhost:11434",
      model = "qwen2.5-coder-3b:latest",
      
      lsp = {
        bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
      },
      
      enable_suggestions_on_startup = false,
      debounce_ms = 0,
      
      -- ИСПОЛЬЗУЕМ ТОЧНЫЙ ШАБЛОН ДЛЯ QWEN2.5-CODER
      fim = {
        enabled = true,
        prefix = "<|fim_prefix|>",
        middle = "<|fim_middle|>",
        suffix = "<|fim_suffix|>",
      },
      
      -- Жестко принуждаем плагин собирать правильный контекст
      tokenizer = {
        repository = "Qwen/Qwen2.5-Coder-3B",
      },
      
      request_body = {
        -- Этот параметр заставит Ollama понять, что идет дополнение строки, а не чат
        raw = true, 
        options = {
          temperature = 0.1, -- Полностью убираем фантазию модели
          top_p = 0.95,
          num_predict = 64,  -- Выдавать строго 1-2 строки кода
          -- Принудительный стоп-токен на перенос строки, чтобы модель затыкалась вовремя
          stop = { "\n\n", "<|endoftext|>", "<|im_start|>" },
        },
      },
      
      accept_keymap = "<Tab>",
      --dismiss_keymap = "<Esc>",
      dismiss_keymap = "<C-c>",
    })

    vim.keymap.set("i", "<C-g>", "<cmd>LLMSuggestion<cr>", { desc = "Сгенерировать код через Ollama" })
  end,
}
