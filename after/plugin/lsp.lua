local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gi", function () vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
local nvim_lsp = require('lspconfig')
local handlers = {
    lsp_zero.default_setup,
    ["lua_ls"] = function ()
       local lua_opts = lsp_zero.nvim_lua_ls()
       nvim_lsp.lua_ls.setup(lua_opts)
    end,
    ["svlangserver"] = function ()
       nvim_lsp.svlangserver.setup({
           on_init = function (client)
                client.config.settings.systemverilog = {
                    includeIndexing     = {"**/*.{sv,svh}"},
                    excludeIndexing     = {"sim/**/*.sv*"},
                    defines             = {},
                    launchConfiguration = "verilator -sv -Wall -Wno-style --lint-only"
                }
           end
       })
    end
}
require('mason-lspconfig').setup({
  ensure_installed = {'clangd'},
  handlers = handlers
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  formatting = {
    fields = {'abbr', 'kind', 'menu'},
    format = require("lspkind").cmp_format({
    mode = 'symbol',
    maxwidth = 50,
    ellipsis_char = '...'
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
