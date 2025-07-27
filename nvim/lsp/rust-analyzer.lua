return {
    cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml' },

    settings = {
        ['rust-analyzer'] = {
            semanticHighlighting = {
                nonStandardTokens = false
            },

            check = {
                command = 'clippy'
            },

            checkOnSave = true,

            inlayHints = {
                maxLength = 255,
            },

            imports = {
                granularity = {
                    group = 'module',
                },

                preferPrelude = true,
            },

            completion = {
                callable = {
                    snippets = 'none'
                },

                fullFunctionSignatures = {
                    enable = true,
                },

                postfix = {
                    enable = false,
                },
            },

            snippets = {
                custom = {
                },
            },
        },
    },
}
