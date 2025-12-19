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
require("lazy").setup({
  -- {
  --   "tomasr/molokai", -- カラースキーム
  --   lazy = false, -- 起動時に必ずロード
  --   priority = 1000, -- 他より先に読む
  --   config = function()
  --     vim.cmd.colorscheme("molokai")
  --     vim.g.molokai_disable_italic_comment = 1 -- italic or bold
  --   end,
  -- },
  {
    "sainnhe/sonokai", -- カラースキーム
    lazy = false, -- 起動時に必ずロード
    priority = 1000, -- 他より先に読む
    init = function()
      -- vim.g.sonokai_style = "andromeda"
      -- vim.g.sonokai_style = "espresso"
      -- vim.g.sonokai_style = "atlantis"
      vim.g.sonokai_style = "shusia"
      -- vim.g.sonokai_style = "maia"
      vim.g.sonokai_better_performance = 1
    end,
    config = function()
      vim.cmd.colorscheme("sonokai")
    end,
  },
  -- {
  --   "folke/tokyonight.nvim", -- カラースキーム
  --   lazy = false, -- 起動時に必ずロード
  --   priority = 1000, -- 他より先に読む
  --   config = function()
  --     vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },
  -- {
  --   "ellisonleao/gruvbox.nvim", -- カラースキーム
  --   lazy = false, -- 起動時に必ずロード
  --   priority = 1000, -- 他より先に読む
  --   config = function()
  --     vim.cmd.colorscheme("gruvbox")
  --   end,
  -- },
  {
    "nvim-telescope/telescope.nvim", -- 曖昧な検索
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-treesitter/nvim-treesitter", -- treesitter
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "lukas-reineke/indent-blankline.nvim", -- インライン・インデントガイド
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "|" },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "dashboard",
          "lazy",
          "NvimTree",
        },
      },
    },
  }
})

-- 基本設定
-- vim.opt.termguicolors = true -- truecolorを明示
-- vim.opt.background = "dark" -- 背景
vim.opt.number = true -- 行番号を表示
-- vim.opt.relativenumber = true -- 相対行番号を表示
vim.opt.mouse = 'a' -- マウス操作を有効化
vim.opt.clipboard:append('unnamedplus') -- システムクリップボードと連携
vim.opt.tabstop = 4 -- タブ幅を4に設定
vim.opt.shiftwidth = 4 -- 自動インデント幅を4に設定
vim.opt.expandtab = true -- タブをスペースに変換
vim.api.nvim_create_autocmd("ColorScheme", { -- 色相などの詳細設定
  -- pattern = "molokai",
  pattern = "sonokai",
  callback = function()
--     vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff5f5f" }) -- LSP / diagnosticsが暗い問題への対処
--     vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = "#ffaf00" })
--     vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = "#5fd7ff" })
--     vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = "#5fffaf" })
--     vim.api.nvim_set_hl(0, "Comment",  { fg = "#6b6b6b", italic = true }) -- 色相・彩度
--     vim.api.nvim_set_hl(0, "String",   { fg = "#d7af5f" })
--     vim.api.nvim_set_hl(0, "Function", { fg = "#61afef" })
--     vim.api.nvim_set_hl(0, "Constant", { fg = "#e06c75" })
  local set = vim.api.nvim_set_hl
    set(0, "Keyword", { fg = "#7aa2f7" })  -- Keyword を青寄りに
    set(0, "Function", { fg = "#7dcfff" })  -- Function を少しシアン寄りに
    set(0, "String", { fg = "#9ece6a" })  -- String を低彩度ブルーグリーンに
    set(0, "Type", { fg = "#89b4fa" })  -- Type をクールに
  end,
})
-- vim.api.nvim_set_hl(0, "@comment", { fg = "#75715E", italic = true }) -- treesitterによるhighlightの上書き
-- vim.api.nvim_set_hl(0, "@string",  { fg = "#E6DB74" })

-- カラースキーム (デフォルト)
-- vim.cmd([[colorscheme desert]])
-- vim.cmd([[colorscheme darkblue]])
-- vim.cmd([[colorscheme morning]])
-- vim.cmd([[colorscheme elflord]])
-- vim.cmd([[colorscheme blue]])
