-- интерактивная полоса прокрутки справа (навигатор по файлу)
return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      show = true,
      handle = { text = " ", color = "#504945" }, -- серый цвет ползунка
      marks = {
        Search = { color = "#d79921" }, -- Подсветка результатов поиска желтым
        Error  = { color = "#fb4934" }, -- Подсветка ошибок кода красным
      }
    })
  end
}
