-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.mouse = ""
vim.opt.timeoutlen = 3000
vim.opt.ttimeoutlen = 100
-- Undercurl
--vim.cmd([[let &t_Cs = "\e[4:3m\e[58:2::240:143:104m"]])
--vim.cmd([[let &t_Ce = "\e[59m\e[4:0m"]])

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
--"\e[4:3m\e[58:2::240:143:104mfoobarbaz\e[59m\e[4:0m\n"