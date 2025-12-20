-- lazy.nvimをruntimepathに追加
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインを宣言
-- require("plugins")
require("lazy").setup("plugins")
-- require("lazy").setup({
-- })
require("colors.sonokai")

-- 基本設定
-- vim.opt.termguicolors = true -- truecolorを明示
-- vim.opt.background = "dark" -- 背景
-- vim.opt.number = true -- 行番号を表示
-- vim.opt.relativenumber = true -- 相対行番号を表示
-- vim.opt.mouse = 'a' -- マウス操作を有効化
-- vim.opt.clipboard:append('unnamedplus') -- システムクリップボードと連携
-- vim.api.nvim_create_autocmd("ColorScheme", { -- 色相などの詳細設定
--   -- pattern = "molokai",
--   pattern = "sonokai",
--   callback = function()
--     -- vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff5f5f" }) -- LSP / diagnosticsが暗い問題への対処
--     -- vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = "#ffaf00" })
--     -- vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = "#5fd7ff" })
--     -- vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = "#5fffaf" })
--     -- vim.api.nvim_set_hl(0, "Comment",  { fg = "#6b6b6b", italic = true }) -- 色相・彩度
--     -- vim.api.nvim_set_hl(0, "String",   { fg = "#d7af5f" })
--     -- vim.api.nvim_set_hl(0, "Function", { fg = "#61afef" })
--     -- vim.api.nvim_set_hl(0, "Constant", { fg = "#e06c75" })
--     vim.api.nvim_set_hl(0, "Keyword", { fg = "#7aa2f7" })  -- Keyword を青寄りに
--     vim.api.nvim_set_hl(0, "Function", { fg = "#7dcfff" })  -- Function を少しシアン寄りに
--     vim.api.nvim_set_hl(0, "String", { fg = "#9ece6a" })  -- String を低彩度ブルーグリーンに
--     vim.api.nvim_set_hl(0, "Type", { fg = "#89b4fa" })  -- Type をクールに
--   end,
-- })
-- vim.api.nvim_set_hl(0, "@comment", { fg = "#75715E", italic = true }) -- treesitterによるhighlightの上書き
-- vim.api.nvim_set_hl(0, "@string",  { fg = "#E6DB74" })

-- カラースキーム (デフォルト)
-- vim.cmd([[colorscheme desert]])
-- vim.cmd([[colorscheme darkblue]])
-- vim.cmd([[colorscheme morning]])
-- vim.cmd([[colorscheme elflord]])
-- vim.cmd([[colorscheme blue]])
