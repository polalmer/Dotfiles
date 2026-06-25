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

--Plugins
vim.pack.add({
    --lualine
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
    --completions
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-cmdline',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-vsnip',
    'https://github.com/hrsh7th/vim-vsnip',
    --gruvbox theme
    'https://github.com/ellisonleao/gruvbox.nvim'
})


require("gruvbox").setup()
--use custom midnightX (needs more work)
vim.cmd.colorscheme("gruvbox")

require("lualine").setup({
    options = {
        section_separators = "",
        component_separators = ""
    }
})

-- config cmp (suggestions)
local cmp = require'cmp'

cmp.setup({
    snippet= {
        expand = function(args)
            vim.fn["vsnip#anonymous#"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
})

vim.lsp.config['zls'] = {
    cmd = {'zls'},
    filetypes = {'zig'},
    root_markers = {'.git'},
    settings = { Lua = { diagnostics = { globals = { "vim" } } } }
}
vim.lsp.enable('zls')
