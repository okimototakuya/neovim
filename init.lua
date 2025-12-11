-- 基本設定
local opt = vim.opt
opt.number = true -- 行番号を表示
-- opt.relativenumber = true -- 相対行番号を表示
opt.mouse = 'a' -- マウス操作を有効化
opt.clipboard:append('unnamedplus') -- システムクリップボードと連携
opt.tabstop = 4 -- タブ幅を4に設定
opt.shiftwidth = 4 -- 自動インデント幅を4に設定
opt.expandtab = true -- タブをスペースに変換

-- カラースキーム設定
vim.cmd([[colorscheme desert]])
-- vim.cmd([[colorscheme darkblue]])
-- vim.cmd([[colorscheme morning]])
-- vim.cmd([[colorscheme elflord]])
-- vim.cmd([[colorscheme blue]])
