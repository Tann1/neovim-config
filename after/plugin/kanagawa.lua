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
print(colors)
print(palette.lightBlue)
kanagawa.setup({
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none",
                    nontext = palette.lightBlue
                }
            }
        }
    }
})
vim.cmd("colorscheme kanagawa-wave")
