-- インデントをLisp向けに
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2

-- SLIME送信用キーマップ
vim.keymap.set("v", "<C-c><C-c>", "<Plug>SlimeRegionSend", { buffer = true })
vim.keymap.set("n", "<C-c><C-c>", "<Plug>SlimeParagraphSend", { buffer = true })
