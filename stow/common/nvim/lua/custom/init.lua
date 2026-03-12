vim.opt.relativenumber = true
vim.opt.autowriteall = true

-- Theme toggle: switch between poimandres and tokyonight
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>lua require("base46").toggle_theme()<CR>', { noremap = true, silent = true, desc = 'Toggle theme (poimandres/tokyonight)' })
