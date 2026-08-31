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
  nbsp = "¤",      --Неразрывный пробел
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

-- 5. Запуск Lazy с указанием сканировать папку lua/plugins/
require("lazy").setup("plugins") -- он сам загрузит всё из папки plugins

-- 6. Стилизация (Приглушаем яркость скрытых символов)
vim.cmd([[highlight Whitespace guifg=#504945 ctermfg=gray]])
