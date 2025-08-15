local options = {
    backup = false,
    -- clipboard = 'unnamedplus',
    cmdheight = 1,
    -- completeopt = { 'menu', 'menuone', 'noselect' },
    conceallevel = 0,
    fileencoding = 'utf-8',
    hlsearch = false,
    ignorecase = false,
    mouse = 'a',
    pumheight = 10,
    -- smartcase = true,
    smartindent = false,
    cindent = false,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 500,
    undofile = true,
    updatetime = 220,
    writebackup = false,
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 4 spaces for a tab
    cursorline = false,
    number = true,
    relativenumber = true,
    numberwidth = 3,
    signcolumn = 'yes',
    wrap = false,
    scrolloff = 10,
    sidescrolloff = 7,
    foldmethod = 'manual', -- set to 'expr' for treesitter based folding
    foldexpr = '', -- set to 'nvim_treesitter#foldexpr()' for treesitter based folding
    hidden = true, -- required to keep multiple buffers and open multiple buffers
    shell = 'fish', -- the default shell that some neovim commands will use
    title = true, -- set the title of window to the value of the titlestring
    titlestring = 'Not Emacs - %F', -- what the title of the window will be set to
    -- showtabline = 1,
    background = 'dark',
    -- spell = true,
    spelloptions = 'camel',
    ruler = false,
    showcmd = false,
    autochdir = false,
    grepprg = 'rg --vimgrep',
    winborder = 'rounded',
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.filetype.add({
    extension = {
        ['ebnf'] = 'ebnf',
        ['porth'] = 'porth',
        ['pro'] = 'prolog',
        ['pl'] = 'prolog',
        ['nasm'] = 'nasm',
        ['onyx'] = 'onyx',
        ['an'] = 'ante',
        ['nbt'] = 'numbat',
        ['roc'] = 'roc',
    },
})

vim.opt.whichwrap:append '<,>,[,],h,l'
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
