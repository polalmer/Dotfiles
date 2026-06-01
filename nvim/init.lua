local vim = vim

-- disable netrw at the very start of your init.lua
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

-- Copy yanks to system clipboard, but keep delete/change local.
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        local e = vim.v.event
        if e.operator == "y" and e.regname == "" then
            vim.fn.setreg("+", e.regcontents, e.regtype)
        end
    end,
})

--Plugins
vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/neovim/nvim-lspconfig'
})

vim.lsp.enable('pyright')

--lualine config
vim.cmd.colorscheme("midnightX")
require("lualine").setup({
    options = {
        theme = midnight_x_lualine_theme,
        section_separators = "",
        component_separators = "",
    }
})
