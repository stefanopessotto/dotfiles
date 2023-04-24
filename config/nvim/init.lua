local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
    print('Installing lazy.nvim....')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
    print('Done.')
end
vim.opt.rtp:prepend(lazypath)

--- Configure clipboard, tabs and numbes
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.wo.relativenumber = true
vim.wo.number = true

require('lazy').setup({
    { "catppuccin/nvim", name = "catppuccin" },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                                 -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    }
    ---
    -- List of plugins...
    ---
})

-- confiugure catppccucin color scheme
vim.opt.termguicolors = true
vim.cmd.colorscheme('catppuccin-mocha')

-- configure lsp-zero
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat() -- AUTO FORMAT!
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    'clangd',                        -- C
    'cmake',                         -- cmake
    'dockerls',                      -- docker
    'docker_compose_language_service', -- docker-compose
    'gopls',                         -- go
    'hls',                           -- haskell
    'jdtls',                         -- java
    'tsserver',                      -- javascript
    'julials',                       -- julia
    'ltex',                          -- latex
    'intelephense',                  -- php
    'pylsp',                         -- python
    'r_language_server',             -- R
    'ruby_ls',                       -- ruby
    'sqlls',                         -- SQL
    'lemminx',                       -- XML
    'zls'                            -- ZIG
})

lsp.setup()
