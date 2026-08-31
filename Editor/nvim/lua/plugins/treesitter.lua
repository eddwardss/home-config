-- синтаксический парсер, подсветка кода
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { 
        "python", "yaml", "toml", "lua", "c", "cpp",
        "rust", "perl", "json", "qml", "xml", "html", "javascript" 
      }, 
      highlight = { enable = true },
    })
  end
}
