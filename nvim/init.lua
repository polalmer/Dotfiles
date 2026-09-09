vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- random shortcuts
vim.keymap.set("n", "<C-e>", vim.diagnostic.open_float)

--Plugins
vim.pack.add({
    --lualine
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
    --theme
    'https://github.com/savq/melange-nvim',
    --Filetree
    'https://github.com/nvim-tree/nvim-tree.lua'
})

require('completions')
require('telescope')

require('nvim-tree').setup()

vim.cmd.colorscheme("melange")

require("lualine").setup({
    options = {
        section_separators = "",
        component_separators = ""
    }
})

