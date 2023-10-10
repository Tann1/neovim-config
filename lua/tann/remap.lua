vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- e -> explore
vim.keymap.set("n", "<leader>rn", function () -- r -> relative; n -> number
   vim.wo.relativenumber = not vim.wo.relativenumber
end)
