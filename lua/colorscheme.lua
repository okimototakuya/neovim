vim.cmd [[
try
  colorscheme dracula
  " colorscheme nightfox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
