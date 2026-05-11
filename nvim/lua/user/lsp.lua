-- Hide all semantic highlights
-- since I sometimes program without lsp, I like that there's a consistency in highlights
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        vim.keymap.set(
            'n',
            '<leader>q',
            function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR }) end,
            { silent = true, desc = 'show quickfix list for errors', buffer = args.buf }
        )

        vim.keymap.set(
            'n',
            '<leader>Q',
            function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN }) end,
            { silent = true, desc = 'show quickfix list for warnings and errors', buffer = args.buf }
        )

        vim.keymap.set(
            'n',
            '<leader>e',
            vim.diagnostic.open_float,
            { silent = true, desc = 'show diagnostics under cursor', buffer = args.buf }
        )

        vim.keymap.set(
            'n',
            '<leader>f',
            function() vim.lsp.buf.format({ async = true }) end,
            { silent = true, desc = 'format buffer', buffer = args.buf }
        )

        vim.keymap.set(
            'n',
            'gd',
            vim.lsp.buf.definition,
            { silent = true, desc = 'format buffer', buffer = args.buf }
        )
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
