-- require("lazy").setup("plugins", {
-- --   defaults = { lazy = true },
--    defaults = { lazy = false },
-- --   install = { colorscheme = { "sonokai" } },
-- --   checker = { enabled = true },
-- })
-- -- require("lazy").setup("plugins")
-- -- plugins/init.lua
return {
  require("plugins.colorscheme"),
  require("plugins.others"),
}
