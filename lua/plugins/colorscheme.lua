return {
  {
    "tomasr/molokai",
    lazy = false, -- 起動時に必ずロード
    priority = 1000, -- 他より先に読む
    config = function()
      vim.cmd.colorscheme("molokai")
      vim.g.molokai_disable_italic_comment = 1 -- italic or bold
    end,
  },
  {
    "sainnhe/sonokai",
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
    -- config = function()
    --   vim.cmd.colorscheme("sonokai")
    -- end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false, -- 起動時に必ずロード
    priority = 1000, -- 他より先に読む
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- 起動時に必ずロード
    priority = 1000, -- 他より先に読む
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
