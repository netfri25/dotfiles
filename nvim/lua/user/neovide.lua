-- neovide specific settings. doesn't hurt to load when not using neovide

vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_scroll_animation_length = 0.2
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_profiler = false


local resize_gui_font = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta / 10
end

local increase = function() resize_gui_font(1) end
local decrease = function() resize_gui_font(-1) end

-- Keymaps
vim.keymap.set({ 'n' }, '<F11>', function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end, { desc = "Toggle fullscreen in neovide" })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-=>', increase, { silent = true, desc = 'Decrease GUI font size' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-->', decrease, { silent = true, desc = 'Increase GUI font size' })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-s-=>', increase, { silent = true, desc = 'Decrease GUI font size' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s-->', decrease, { silent = true, desc = 'Increase GUI font size' })
