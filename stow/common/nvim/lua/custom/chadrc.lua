---@type ChadrcConfig
local M = {}

-- Theme: poimandres (default), toggle between poimandres and tokyonight
-- Use :ToggleTheme command or <leader>tt after starting nvim
M.ui = {
  theme = 'onedark',
  theme_toggle = { 'onedark', 'tokyonight' }
}

M.plugins = "custom.plugins"

return M
