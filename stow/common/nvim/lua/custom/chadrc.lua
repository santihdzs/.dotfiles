---@type ChadrcConfig
local M = {}

-- Theme: poimandres (default), toggle between poimandres and tokyonight
-- Use :ToggleTheme command or <leader>tt after starting nvim
M.ui = {
  theme = 'poimandres',
  theme_toggle = { 'poimandres', 'tokyonight' }
}

M.plugins = "custom.plugins"

return M
