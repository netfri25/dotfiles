-- treesitter for better text analysis, text objects and highlighting

local filetypes = {
    'c',
    'asm',
    'cpp',
    'lua',
    'vim',
    'bash',
    'java',
    'rust',
    'python',
    'comment',
    'haskell',
    'markdown',
    'gitcommit',
    'git_rebase',
    'gitattributes',
}

return {
    'nvim-treesitter/nvim-treesitter',
    branch = "main",
    lazy = true,
    enabled = true,
    event = "VeryLazy",

    build = ':TSUpdate',

    init = function()
        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                -- Enable treesitter highlighting and disable regex syntax
                pcall(vim.treesitter.start)
                -- Enable treesitter-based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        local installed = require('nvim-treesitter.config').get_installed()
        local to_install = vim.iter(filetypes):filter(
            function(parser)
                return not vim.tbl_contains(installed, parser)
            end
        ):totable()

        require('nvim-treesitter').install(to_install)
    end
}
