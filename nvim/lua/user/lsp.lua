local servers = {
    'rust-analyzer',
    'pyright',
    'clangd',
    'lua_ls',
    'ruff',
}

local enabled = false

vim.api.nvim_create_user_command("Lsp", function(args)
    enabled = not enabled
    vim.lsp.enable(servers, enabled)
end, {})

-- Hide all semantic highlights
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true, desc = 'Show diagnostics', buffer = args.buf })
        vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true, desc = 'Show loclist', buffer = args.buf })
        vim.keymap.set('n', '<leader>Q', function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN }) end, { silent = true, desc = 'Show loclist', buffer = args.buf })
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, { silent = true, desc = 'Goto declaration', buffer = args.buf })
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { silent = true, desc = 'Goto definition', buffer = args.buf })
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = "rounded" }) end, { silent = true, desc = 'Show docs', buffer = args.buf })
        vim.keymap.set('n', '<c-s>', function() vim.lsp.buf.signature_help({ border = "rounded" }) end, { silent = true, desc = 'Show signature help', buffer = args.buf })
        vim.keymap.set('n', 'gt', function() vim.lsp.buf.type_definition({ border = "rounded" }) end, { silent = true, desc = 'Show type definition', buffer = args.buf })
        vim.keymap.set('n', 'gra', function() vim.lsp.buf.code_action({ border = "rounded" }) end, { silent = true, desc = 'Code actions', buffer = args.buf })
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, { silent = true, desc = 'Format buffer', buffer = args.buf })
    end
})

vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false, -- lsp_lines
    update_in_insert = false,
    underline = true,
    severity_sort = true,

    float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        header = '',
        prefix = '',
    },
})

