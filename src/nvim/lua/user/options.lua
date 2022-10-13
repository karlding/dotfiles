local options = {
    backup = false,
    hlsearch = true,
    ignorecase = true,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    -- TODO: editorconfig?
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    signcolumn = "yes",
    wrap = false,
    -- keep some context
    scrolloff = 8,
    sidescrolloff = 8
}

for k, v in pairs(options) do vim.opt[k] = v end
