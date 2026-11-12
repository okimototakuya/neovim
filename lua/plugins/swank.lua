return {
  {
    "corigne/swank.nvim",
    ft = { "lisp", "commonlisp" },
    opts = {
      leader = "<Leader>",
      autostart = {
        enabled = true,
        implementation = "sbcl",
      },
      ui = {
        repl = {
          position = "right",
          size = 0.40,
        },
      },
    },
  },
}
