require("tann")

-- set highlight on serach
vim.o.hlsearch = false
-- enable mouse mode
vim.o.mouse = 'a'

vim.cmd("colorscheme kanagawa-wave")
vim.diagnostic.config({signs = false})
