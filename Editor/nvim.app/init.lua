-- 1. Базовые настройки интерфейса (стандартный <leader> равен бэкслешу "\")
vim.opt.number = true          -- Нумерация строк
vim.opt.relativenumber = true  -- Относительные номера строк
vim.opt.cursorline = true      -- Подсветка строки под курсором
vim.opt.clipboard = "unnamedplus" -- Интеграция с системным буфером Debian

-- 2. Настройка отступов (Компактные 4 позиции)
vim.opt.tabstop = 4            -- Ширина таба равна 4 пробелам
vim.opt.shiftwidth = 4         -- Размер автоматического отступа
--vim.opt.expandtab = true        -- Превращать табы в пробелы при нажатии Tab

-- 3. Отображение невидимых символов (Sublime-стиль)
vim.opt.list = true
vim.opt.listchars = {
  tab = "──",      -- Два тире для компактных табов
  space = "·",     -- Маленькая незаметная точка для пробелов
  trail = "•",     -- Лишние пробелы в конце строки
  nbsp = "¤",      --Неразрывный пробел
}

-- СБОРОЧНЫЙ ПУТЬ ДЛЯ APPIMAGE
local home          = vim.env.HOME
local my_config_dir = home .. "/.config/nvim"
local my_lazy_root  = my_config_dir .. "/lazy"
local lazypath      = my_lazy_root .. "/lazy.nvim"

-- Проверяем наличие именно файла запуска lazy.nvim, а не просто пустой папки
local fs_check = vim.uv or vim.loop
if not fs_check.fs_stat(lazypath .. "/lua/lazy/init.lua") then
  print("Скачиваю lazy.nvim с GitHub...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Пробиваем пути поиска бинарников (.so) для avante
local avante_build_dir = my_lazy_root .. "/avante.nvim/build/?.so"
package.cpath = package.cpath .. ";" .. avante_build_dir

-- Пробиваем пути поиска для изолированного Lua внутри AppImage
package.path = package.path .. ";" .. lazypath .. "/lua/?.lua;" .. lazypath .. "/lua/?/init.lua"
package.path = package.path .. ";" .. my_config_dir .. "/lua/?.lua;" .. my_config_dir .. "/lua/?/init.lua"

vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:prepend(my_config_dir)

-- 5. Запуск Lazy
require("lazy").setup({
  root = my_lazy_root,
  spec = {
    { import = "plugins" },
  },
})

-- 6. Стилизация (Приглушаем яркость скрытых символов)
vim.cmd([[highlight Whitespace guifg=#504945 ctermfg=gray]])
