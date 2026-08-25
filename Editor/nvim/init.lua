-- 1. Базовые настройки интерфейса (стандартный <leader> равен бэкслешу "\")
vim.opt.number = true          -- Нумерация строк
vim.opt.relativenumber = true  -- Относительные номера строк
vim.opt.cursorline = true      -- Подсветка строки под курсором
vim.opt.clipboard = "unnamedplus" -- Интеграция с системным буфером Debian

-- 2. Настройка отступов (Компактные 4 позиции)
vim.opt.tabstop = 4            -- Ширина таба равна 4 пробелам
vim.opt.shiftwidth = 4         -- Размер автоматического отступа
--vim.opt.expandtab = true     -- Превращать табы в пробелы при нажатии Tab

-- 3. Отображение невидимых символов (Sublime-стиль)
vim.opt.list = true
vim.opt.listchars = {
  tab = "──",      -- Два тире для компактных табов
  space = "·",     -- Маленькая незаметная точка для пробелов
  trail = "•",     -- Лишние пробелы в конце строки
  nbsp = "¤",       --Неразрывный пробел
}

-- 4. Автоматическая установка менеджера плагинов Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 5. Настройка плагинов через Lazy
require("lazy").setup({
  -- Официальный синтаксический парсер
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        -- Список языков программирования и разметки
        ensure_installed = { 
          "python", "yaml", "toml", "lua", "c", "cpp",
          "rust", "perl", "json", "qml", "xml", "html", "javascript" 
        }, 
        highlight = { enable = true },
      })
    end
  },

  -- Нативный ИИ-плагин для Ollama в Docker (модель qwen2.5-coder-3b)
  {
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
    end
  },

  -- Плагин мультикурсоров (Win + Ctrl + Стрелки)
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      vim.g.VM_maps = {
        -- Курсор вверх (Win + Ctrl + Up)
        ["Add Cursor Up"] = "<D-C-Up>",
        -- Курсор вниз (Win + Ctrl + Down)
        ["Add Cursor Down"] = "<D-C-Down>",
      }
    end
  },

  -- Умная интерактивная полоса прокрутки справа (навигатор по файлу)
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        show = true,
        handle = { text = " ", color = "#504945" }, -- серый цвет ползунка
        marks = {
          Search = { color = "#d79921" },  -- Подсветка результатов поиска желтым
          Error  = { color = "#fb4934" },  -- Подсветка ошибок кода красным
        }
      })
    end
  }
})

-- 6. Стилизация (Приглушаем яркость скрытых символов)
vim.cmd([[highlight Whitespace guifg=#504945 ctermfg=gray]])
