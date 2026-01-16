return {
  "jpalardy/vim-slime",
  init = function()
    -- tmuxを使う
    vim.g.slime_target = "tmux"

    -- デフォルト設定
    vim.g.slime_default_config = {
      socket_name = "default",
      target_pane = "{right-of}",
    }

    -- セル送信をEnterで確認しない
    vim.g.slime_dont_ask_default = 1
  end,
}
