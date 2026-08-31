return {
  -- Явно указываем имя для панели `:Lazy`
  name = "project-code-runner",
  
  -- Ключевая строка: говорим Lazy брать плагин из локальной папки конфигурации Neovim
  dir = vim.fn.stdpath("config"),
  
  lazy = false, -- Загружаем принудительно при старте
  
  config = function()
    -- Универсальная функция запуска текущего файла
    local function run_current_file()
      -- 1. Сохраняем текущий файл перед запуском
      vim.cmd("silent! write")

      -- 2. Собираем метаданные о файле
      local file_path = vim.fn.expand("%:p:h")     -- Папка файла
      local file_name = vim.fn.expand("%:t")        -- Имя файла с расширением (main.c)
      local binary_name = vim.fn.expand("%:t:r")    -- Имя файла без расширения (main)
      local file_ext = vim.fn.expand("%:e")         -- Расширение (py, c, cpp)

      local cmd = ""

      -- 3. Анализируем расширение файла и формируем точную команду
      if file_ext == "py" then
        -- Команда для Python с переменными окружения
        local env = "export PYTHONIOENCODING=utf-8 && export PYTHONPATH=/home/user/directory/folder"
        cmd = string.format("cd '%s' && %s && python3 -u '%s'", file_path, env, file_name)

      elseif file_ext == "c" then
        -- Команда для Си (под ваш GCC 14.2.0 с выводом предупреждений)
        cmd = string.format("cd '%s' && gcc -Wall -Wextra '%s' -o '%s' && ./'%s'", file_path, file_name, binary_name, binary_name)

      elseif file_ext == "cpp" then
        -- Команда для C++ (через g++)
        cmd = string.format("cd '%s' && g++ -Wall -Wextra '%s' -o '%s' && ./'%s'", file_path, file_name, binary_name, binary_name)

      elseif file_ext == "go" then
        cmd = string.format("cd '%s' && go run '%s'", file_path, file_name)

      -- Rust (с поиском корня проекта Cargo.toml)
      elseif file_ext == "rs" then
        -- Ищем файл Cargo.toml, поднимаясь вверх от папки текущего файла
        local cargo_match = vim.fs.find({ "Cargo.toml" }, { upward = true, path = file_path })

        if #cargo_match > 0 then
          -- Если Cargo.toml найден, получаем путь к его папке (корень проекта)
          local project_root = vim.fs.dirname(cargo_match[1])
          cmd = string.format("cd '%s' && cargo run", project_root)
        else
          -- На случай, если вы запустили одиночный .rs файл вне проекта Cargo
          cmd = string.format("cd '%s' && rustc '%s' && ./'%s'", file_path, file_name, binary_name)
        end

      else
        print("Запуск для расширения ." .. file_ext .. " не настроен!")
        return
      end

      -- Добавляем ко всем командам единую подсказку о закрытии
      cmd = cmd .. "; echo -e '\\n--- [Нажмите Ctrl+Q для закрытия панели] ---'"

      -- 4. Создаем нижний сплит высотой в 12 строк
      vim.cmd("botright 12new") 
      
      -- 5. Запускаем встроенный терминал Neovim
      vim.fn.termopen(cmd)
      
      -- 6. Переходим в режим ввода терминала (чтобы сразу работал input / scanf)
      vim.cmd("startinsert")

      -- 7. Назначаем локальный хоткей закрытия на Ctrl + Q строго внутри созданного окна
      local bufnr = vim.api.nvim_get_current_buf()
      vim.keymap.set("t", "<C-q>", "<C-\\><C-n>:bd!<CR>", { buffer = bufnr, silent = true })
    end

    -- Глобальный хоткей \ + z (<leader>z) для ВСЕХ типов файлов и ВСЕХ режимов (n, v, i)
    vim.keymap.set({ "n", "v", "i" }, "<leader>z", run_current_file, { silent = true, desc = "Code Runner: Run active file" })
  end
}
