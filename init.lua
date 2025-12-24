-- 基本設定 
require("config.options")
require("config.keymaps")

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

-- lazy.nvimをsetup
require("lazy").setup("plugins")
-- require("colors.default")
-- require("colors.molokai")
require("colors.sonokai")
-- require("colors.tokyonight.nvim")
-- require("colors.gruvbox.nvim")
