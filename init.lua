require("tann")

-- set highlight on serach
vim.o.hlsearch = false
-- enable mouse mode
vim.o.mouse = 'a'

vim.cmd("colorscheme github_light")

vim.diagnostic.config({underline = false})
vim.api.nvim_create_user_command(
  'DiagnosticsToggleVirtualText',
  function()
    local current_value = vim.diagnostic.config().virtual_text
    if current_value then
      vim.diagnostic.config({virtual_text = false})
    else
      vim.diagnostic.config({virtual_text = true})
    end
  end,
  {}
)
vim.keymap.set("n", "<leader>td", vim.cmd.DiagnosticsToggleVirtualText) -- t -> toggle; d -> diagnostics
vim.keymap.set("n", "<leader>so", vim.cmd.SymbolsOutline) -- -> s -> symbols; o -> outline
