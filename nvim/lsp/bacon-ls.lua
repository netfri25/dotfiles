return {
    cmd = { 'bacon-ls' },
    root_markers = { 'Cargo.toml' },
    settings = {
        bacon_ls = {
            backend = "bacon",
            bacon = {
                synchronizeAllOpenFilesWaitMillis = 10,
                updateOnSaveWaitMillis = 10,
                updateOnSave = true,
            }
        }
    }
}
