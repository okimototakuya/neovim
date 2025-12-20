-- ~/.config/nvim/init.lua --
require("colorscheme")


-- ~/.vimrc --
vim.cmd [[
"""""""""""""""""""""""""""""""""""""""""
"""""Vimプラグインマネージャー"""""""""""
"""""""""""""""""""""""""""""""""""""""""
" Vimプラグインのインストール＆ロード
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする・・・・・・①
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
NeoBundleFetch 'Shougo/neobundle.vim'   " NeoBundle自身を管理
"----------------------------------------------------------
" ここに追加したいVimプラグインを記述する・・・・・・②
" - 1. plugin from https://github.com/Yggdroot/indentLine
" - 2. plugin from https://github.com/nelstrom/vim-qargs
NeoBundle 'Yggdroot/indentLine' " 1. インデントラインの可視化
NeoBundle 'nelstrom/vim-qargs'  " 2. quickfixリストの値を、引数リストに移動する





"----------------------------------------------------------
call neobundle#end()

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定・・・・・・③
NeoBundleCheck


""""""""""""""""""""""""""
"""""補完"""""""""""""""""
""""""""""""""""""""""""""
" 括弧
" "inoremap { {}<LEFT>
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap {<Enter> {}<Left><ESC><S-o>
" map {<Enter> <Plug>(hoge-hoge)
" map e <Plug>(hoge-hoge)
" map j k                                       " OK
" map <C-a> k                                   " OK
" map <C-a> i                                   " OK
" map <C-a> <Enter>                             " OK
" map {<Enter> k                                " OK
" map {<Enter> <S-i>{}<Left><CR><ESC><S-o>      " OK
" map {<Enter> <S-i>{}                          " OK
" map {<Enter> <S-i>{}<Left>                    " OK
" map {<Enter> <S-i>{}<Left><CR>
" map {<Enter> <S-i>{}<Left><CR><ESC><S-o><Tab>   " OK (ただし、プレーンテキストの場合)
" map {<Enter> <S-i>{}<Left><CR><Left><Delete><Delete><Delete>    " NG
" map {<Enter> <S-i>{}<Left><CR><CR>
" inoremap {<Enter> k                           " NG
" inoremap {<Enter> <S-o>
" inoremap {<CR> <S-o>
inoremap [ []<LEFT>
inoremap [<Enter> []<Left><CR><ESC><S-o><Tab>
" inoremap [<Enter>  []<Left><CR>
inoremap ( ()<LEFT>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap { {}<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o><Tab>
" クオーテーション
inoremap " ""<LEFT>
inoremap ' ''<LEFT>


""""""""""""""""""""""""""
"""""カーソル移動"""""""""
""""""""""""""""""""""""""
if has("mac")
    inoremap <c-j> <Down>
    inoremap <c-k> <Up>
    inoremap <c-l> <Right>
    inoremap <c-h> <Left>
elseif has("win64")
    inoremap <F13-j> <Down>
    inoremap <F13-k> <Up>
    inoremap <F13-l> <Right>
    inoremap <F13-h> <Left>
endif

""""""""""""""""""""""""""
"""""可視化"""""""""""""""
""""""""""""""""""""""""""
set showcmd         " 入力したコマンドの可視化
set number          " 行番号の可視化
set cursorline      " カレント行に下線を引く。
syntax enable       " シンタックスハイライト
set visualbell      " ビープ音を可視化
set showmatch       " 対応する括弧を可視化
set laststatus=2    " ステータスラインを2行に。→ 常にステータスラインが見えるように。
" 不可視文字の設定
" - tab: タブ文字
" - trail: 行末スペース
" - eol: 改行文字
" - extends: 'wrap'がオフで,行が画面の右端よりも伸びているときに,最終列に表示される文字
" - precedes: 物理行の最初に目に見える列に表示される文字
" - nbsp: ノーブレークスペース文字(スペースの箇所での自動的な改行を防ぐ特殊なスペース)
set list                                    " 不可視文字を可視化できるようにする.
set listchars=tab:>-,trail:-,eol:↲,nbsp:%   " 不可視文字に記号を割り当てる.
" インデントレベルの可視化 (プラグインYggdroot/indentLine)
let g:indentLine_color_term = 239
let g:indentLine_list = ['|', '¦', '┆', '┊']


""""""""""""""""""""""""""
"""""検索"""""""""""""""""
""""""""""""""""""""""""""
set incsearch   " 検索がヒットした箇所から、ハイライトしていく。
set wrapscan    " 検索結果の末尾まで行ったら、最初に戻る。
set hlsearch    " 検索結果の単語をハイライトする。


""""""""""""""""""""""""""
"""インデント"""""""""""""
""""""""""""""""""""""""""
set autoindent              " カレント行のインデントをキープ. シンプル.
" set smartindent           " c言語風のプログラミング言語向けの自動インデント.
" set cindent               " c言語の特化したインデント(smartより厳密に文法を考慮).
set expandtab               " Tabキーで半角スペースを入力.
set tabstop=4               " - インデントの半角スペースの個数
set shiftwidth=4            " - インデントを増やす/減らす時の、個数
" 2022.2.28:HACK
" - ファイルタイプ別のインデント設定の詳細がわからない。→ コメントアウトして無効化
" - → 括弧+改行をする際に、filetype indent onだと、インデントを合わせるのが難しくなる。
" - → autoindentと、inoremap (<Enter> ()<LEFT>のみで対応するのが分かりやすい。
" filetype indent on


""""""""""""""""""""""""""
"""ウィンドウ"""""""""""""
""""""""""""""""""""""""""
set splitbelow                "新しいウィンドウを下に開く.
set splitright                "新しいウィンドウを右に開く.


""""""""""""""""""""""""""
"""ターミナルモード"""""""
""""""""""""""""""""""""""
""何故かエラー発生.→うまくいく時もある.
""executing job failed: No such file or directory
""単純な垂直・水平分割(sp,vsp)はうまくいく.
"bo term ++rows=15      "ターミナル(Vimと非同期)を1.ウィンドウ下に2.高さ15で開く.
"vert term ++cols=60    "ターミナル(Vimと非同期)を1.ウィンドウ右に2.幅60で開く.


""""""""""""""""""""""""""
"""IME設定""""""""""""""""
""""""""""""""""""""""""""
"ime ni tuite nokoto
"set runtimepath+=~/im_ctrl.vim-master
"set runtimepath+=~/skk.vim-master
"set cmdheight=2


""""""""""""""""""""""""""
"""""その他"""""""""""""""
""""""""""""""""""""""""""
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp    " 対応する文字コード
set fileformats=unix,dos,mac                        " 対応するファイルフォーマット
set backspace=indent,eol,start                      " vimの挿入モードで、deleteキーをサポート
set mouse=a                                         " vimの4つのモードで、マウスを有効化
"set ttymouse=xterm2                                 " ターミナルのvimで、ホイールを有効化: 24.6.22.~/.config/nvim/init.lua呼出時、エラー
"echo '~/.vimrcが参照されました。'
]]
