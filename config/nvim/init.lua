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
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },
    ---
    -- List of plugins...
    ---
    -- Copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "ga",
                        refresh = "gr",
                        open = "<M-CR>"
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-Tab>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-+>",
                        prev = "<M-è>",
                        dismiss = "<M-]>",
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = true,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
                copilot_node_command = 'node', -- Node.js version must be > 18.x
                server_opts_overrides = {},
            })
        end,
    }
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
require('lspconfig').ltex.setup({
    settings = {
        ltex = {
            -- language = "en",
            language = "it"
        }
    }
})

lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    'clangd',                          -- C
    'cmake',                           -- cmake
    'dockerls',                        -- docker
    'docker_compose_language_service', -- docker-compose
    'gopls',                           -- go
    'hls',                             -- haskell
    'jdtls',                           -- java
    'tsserver',                        -- javascript
    'julials',                         -- julia
    'ltex',                            -- latex
    'intelephense',                    -- php
    'pylsp',                           -- python
    'r_language_server',               -- R
    'ruby_ls',                         -- ruby
    'sqlls',                           -- SQL
    'lemminx',                         -- XML
    'zls'                              -- ZIG
})

lsp.setup()
