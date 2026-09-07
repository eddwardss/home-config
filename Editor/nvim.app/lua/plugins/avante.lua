return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,

  build = "make BUILD_FROM_SOURCE=true",

  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },

  opts = {
    provider = "ollama",
    -- Переключаем Avante в режим обычного чата, убирая агентское планирование
    mode = "legacy",

    providers = {
      ollama = {
--        __inherited_from = "openai", -- Маскируемся под OpenAI, чтобы Avante слушался лимитов
--        key_name = "",
        endpoint = "http://localhost:11434",
        model = "qwen2.5-coder-3b:latest",
        context_window = 2048,
        disable_tools = true, -- Запрещаем модели трогать инструменты

        extra_request_body = {
          stream = false,
          options = {
            num_ctx = 4096,
            temperature = 0,
          }
        },
      },
    },
    behaviour = {
      auto_suggestions = false,
      -- Дополнительно гасим режим планирования Cursor
      enable_cursor_planning_mode = false, 
    },
  },
}
