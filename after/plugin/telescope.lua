local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- p -> project; f -> files
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {}) -- p -> project; g -> grep
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- <C-p> (ctrl + p)
vim.keymap.set('n', '<leader>ps', function() -- p -> project; s -> search 
	builtin.grep_string({search  = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>pb', builtin.buffers, {}) -- p -> project; b -> buffers
vim.keymap.set('n', '<leader>prf', builtin.oldfiles, {}) -- p -> project; r -> recent -> f -> files
