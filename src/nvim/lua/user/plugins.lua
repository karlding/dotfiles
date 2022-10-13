return require("packer").startup(function(use)
    use({"wbthomason/packer.nvim"})

    -- git
    use({"lewis6991/gitsigns.nvim"})
    use({"tpope/vim-fugitive", tag = "v3.7"})

    use({"numToStr/Comment.nvim"})

    -- treesitter
    -- (for better syntax highlighting)
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({with_sync = true})
        end
    }

    -- LSP
    use({"neovim/nvim-lspconfig", tag = "v0.1.3"})

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {{"nvim-lua/plenary.nvim"}}
    })
end)
