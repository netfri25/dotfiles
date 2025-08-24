local M = {}

M.colors = {
    bg          = "#000000",
    fg          = "#909090",
    white       = "#b0b0b0",
    accent      = "#bbb0a0",
    comment     = "#545454",
    constant    = "#c0b8b0",
    blackish    = "#202020",
    diff_add    = "#68bb26",
    diff_del    = "#fb4934",
}

M.groups = {
    -- Core UI
    Normal      = { fg = M.colors.fg, bg = M.colors.bg },
    NormalFloat = { link = "Normal" },
    WinSeparator = { link = "Normal" },

    LineNr          = { fg = M.colors.comment },
    CursorLine      = { bg = M.colors.bg },
    CursorLineNr    = { fg = M.colors.white, bg = M.colors.bg, bold = true },

    Visual      = { bg = M.colors.blackish },
    Directory   = { fg = M.colors.white, bg = M.colors.bg, bold = true },
    MatchParen  = { fg = M.colors.fg, bg = M.colors.bg },

    StatusLine      = { fg = M.colors.white, bg = M.colors.blackish },
    StatusLineNC    = { fg = M.colors.fg, bg = M.colors.blackish },

    DiffAdd     = { fg = M.colors.diff_add },
    DiffDelete  = { fg = M.colors.diff_del },

    NeogitDiffAdd = { link = "DiffAdd" },
    NeogitDiffAddCursor = { link = "DiffAdd" },
    NeogitDiffAddHighlight = { link = "DiffAdd" },

    NeogitDiffDelete = { link = "DiffDelete" },
    NeogitDiffDeleteCursor = { link = "DiffDelete" },
    NeogitDiffDeleteHighlight = { link = "DiffDelete" },

    NeogitDiffContext = { bg = M.colors.bg },
    NeogitDiffContextHighlight = { link = "NeogitDiffContext" },

    -- Syntax groups
    Special     = { fg = M.colors.white, bold = true },
    Keyword     = { link = "Special" },
    Identifier  = { fg = M.colors.fg },
    Operator    = { fg = M.colors.comment },
    Comment     = { fg = M.colors.comment, italic = true },
    String      = { fg = M.colors.constant },
    Function    = { fg = M.colors.fg },
    Type        = { fg = M.colors.accent },
    Constant    = { fg = M.colors.constant },
    Boolean     = { link = "Constant" },
    Number      = { link = "Constant" },
    Float       = { link = "Constant" },
    Macro       = { link = "Function" },
    PreProc     = { link = "Macro" },

    -- Tree-sitter groups
    ["@variable"]                   = { link = "Identifier" },
    ["@variable.builtin"]           = { link = "Keyword" },
    ["@variable.parameter"]         = { link = "Identifier" },
    ["@variable.parameter.builtin"] = { link = "Keyword" },
    ["@variable.member"]            = { link = "Identifier" },

    ["@constant"]         = { link = "Identifier" },
    ["@constant.builtin"] = { link = "Identifier" },
    ["@constant.macro"]   = { link = "PreProc" },

    ["@module"]         = { link = "Identifier" },
    ["@module.builtin"] = { link = "Keyword" },
    ["@label"]          = { link = "Identifier" },

    ["@string"]                 = { link = "String" },
    ["@string.documentation"]   = { link = "String" },
    ["@string.regexp"]          = { link = "String" },
    ["@string.escape"]          = { link = "Keyword" },
    ["@string.special"]         = { link = "String" },
    ["@string.special.symbol"]  = { link = "String" },
    ["@string.special.path"]    = { link = "String" },
    ["@string.special.url"]     = { link = "String" },

    ["@character"]          = { link = "String" },
    ["@character.special"]  = { link = "Keyword" },

    ["@boolean"]        = { link = "Boolean" },
    ["@number"]         = { link = "Number" },
    ["@number.float"]   = { link = "Float" },

    ["@type"]               = { link = "Type" },
    ["@type.builtin"]       = { link = "Type" },
    ["@type.definition"]    = { link = "Identifier" },  -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

    ["@attribute"]          = { link = "Constant" },
    ["@attribute.builtin"]  = { link = "Constant" },
    ["@property"]           = { link = "Identifier" },

    ["@function"]           = { link = "Function" },
    ["@function.builtin"]   = { link = "Function" },
    ["@function.call"]      = { fg = M.colors.fg, bold = true },
    ["@function.macro"]     = { link = "Macro" },

    ["@function.method"]        = { link = "Function" },
    ["@function.method.call"]   = { link = "@function.call" },

    ["@constructor"]    = { link = "Operator" },
    ["@operator"]       = { link = "Operator" },

    ["@keyword"]            = { link = "Keyword" },
    ["@keyword.coroutine"]  = { link = "Keyword" },
    ["@keyword.function"]   = { link = "Keyword" },
    ["@keyword.operator"]   = { link = "Keyword" },
    ["@keyword.import"]     = { link = "Keyword" },
    ["@keyword.type"]       = { link = "Keyword" },
    ["@keyword.modifier"]   = { link = "Keyword" },
    ["@keyword.repeat"]     = { link = "Keyword" },
    ["@keyword.return"]     = { link = "Keyword" },
    ["@keyword.debug"]      = { link = "Keyword" },
    ["@keyword.exception"]  = { link = "Keyword" },

    ["@keyword.conditional"]            = { link = "Keyword" },
    ["@keyword.conditional.ternary"]    = { link = "Keyword" },

    ["@keyword.directive"]          = { link = "Macro" },
    ["@keyword.directive.define"]   = { link = "Macro" },

    ["@punctuation.delimiter"] = { link = "Operator" },
    ["@punctuation.bracket"]   = { link = "Operator" },
    ["@punctuation.special"]   = { link = "Operator" },

    ["@comment"]               = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },

    ["@diff.plus"]  = { link = "DiffAdd" },
    ["@diff.minus"] = { link = "DiffDelete" },
}

M.updates = {
    SpellBad    = { undercurl = false, underline = true },
    SpellCap    = { undercurl = false, underline = true },
    SpellLocal  = { undercurl = false, underline = true },
    SpellRare   = { undercurl = false, underline = true },
}

function M.setup()
    vim.o.background = "dark"
    vim.cmd[[highlight clear]]
    if vim.fn.exists("syntax_on") then vim.cmd[[syntax reset]] end
    vim.g.colors_name = "grayscale"

    for group, opts in pairs(M.groups) do
        vim.api.nvim_set_hl(0, group, opts)
    end

    for group, opts in pairs(M.updates) do
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
        if ok then
            opts = vim.tbl_extend("force", hl, opts)
            vim.api.nvim_set_hl(0, group, opts)
        end
    end
end

return M
