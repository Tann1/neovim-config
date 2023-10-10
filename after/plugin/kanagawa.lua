local status_ok, kanagawa = pcall(require, 'kanagawa')
if not status_ok then
    return
end

local colors
status_ok, colors = pcall(require, 'kanagawa.colors')
if not status_ok then
    return
end
colors = colors.setup()
local palette = colors.palette
kanagawa.setup({
    typeStyle = {bold = true},
    colors = {
        theme = {
            all = {
                ui = {
                    fg = "#e0e0de",
                    bg = "#000000",
                    bg_gutter = "none",
                    nontext = palette.lightBlue,
                    whitespace = palette.lightBlue
                }
            }
        }
    }
})
vim.cmd("colorscheme kanagawa-wave")
