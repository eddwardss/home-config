return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,

  -- Rust 1.86+
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
    providers = {
      ollama = {
        __inherited_from = "openai",
        api_key_name = "",
        endpoint = "http://localhost:11434/v1",
        model = "qwen2.5-coder-3b:latest",

        extra_request_body = {
          options = {
            num_ctx = 8192, -- Контекстное окно для Qwen 3b
            temperature = 0,
          }
        },
      },
    },
    behaviour = {
      auto_suggestions = false,
    },
  },
}
