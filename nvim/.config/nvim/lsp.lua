-- Use Neovim's LSP and enable the following language servers:
local nvim_lsp = require('lspconfig')
nvim_lsp.pyright.setup{}
nvim_lsp.clangd.setup{}

-- Enable autocomplete.
local cmp = require('cmp')
cmp.setup {
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            else
              fallback()
            end
        end
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' }
    },
}
