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
--
--opts = {
--  signs = {
--    add = { text = "▎" },
--    change = { text = "▎" },
--    delete = { text = "" },
--    topdelete = { text = "" },
--    changedelete = { text = "▎" },
--    untracked = { text = "▎" },
--  },
--  on_attach = function(buffer)
--    local gs = package.loaded.gitsigns
--
--    local function map(mode, l, r, desc)
--      vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
--    end
--
--    -- stylua: ignore start
--    map("n", "]h", gs.next_hunk, "Next Hunk")
--    map("n", "[h", gs.prev_hunk, "Prev Hunk")
--    map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
--    map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
--    map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
--    map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
--    map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
--    map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
--    map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
--    map("n", "<leader>ghd", gs.diffthis, "Diff This")
--    map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
--    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
--  end,
--}
