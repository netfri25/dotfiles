-- treesitter for better text analysis, text objects and highlighting

local filetypes = {
    'c',
    'asm',
    'cpp',
    'vim',
    'lua',
    'ron',
    'rust',
    'json',
    'java',
    'toml',
    'fish',
    -- 'help',
    'ocaml',
    'numbat',
    'python',
    'arduino',
    'comment',
    'haskell',
    'markdown',
    'gitcommit',
    'git_rebase',
    'gitattributes',
}

return {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    enabled = vim.loop.os_uname().sysname == "Linux",
    event = "VeryLazy",

    build = ':TSUpdate',

    config = function()
        local tree = require('nvim-treesitter.configs')
        local parsers = require('nvim-treesitter.parsers')

        tree.setup({
            ignore_install = {},
            ensure_installed = filetypes,

            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = false,
            },

            indent = { enable = true },
        })
    end
}
