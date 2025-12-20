return  {
  -- {
  --   "nvim-telescope/telescope.nvim", -- 曖昧な検索
  --   cmd = "Telescope",
  --   dependencies = { "nvim-lua/plenary.nvim" }
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter", -- treesitter
  --   build = ":TSUpdate",
  --   event = { "BufReadPost", "BufNewFile" },
  -- },
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
}
