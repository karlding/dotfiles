require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {enable = true, disable = {"css"}},
    autopairs = {enable = true},
    indent = {enable = true, disable = {"python", "css"}}
})
