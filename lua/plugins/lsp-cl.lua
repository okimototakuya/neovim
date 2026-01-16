return {
  "neovim/nvim-lspconfig",
  ft = { "lisp" },   -- Lispの時だけロード
  config = function()
    require("lspconfig").cl_lsp.setup({
      cmd = { "cl-lsp.ros" }
    })
  end,
}
