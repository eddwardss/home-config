-- Плагин мультикурсоров (Win + Ctrl + Стрелки)
return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    vim.g.VM_maps = {
      ["Add Cursor Up"] = "<D-C-Up>",
      ["Add Cursor Down"] = "<D-C-Down>",
    }
  end
}
