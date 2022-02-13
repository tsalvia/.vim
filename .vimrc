" ============================================================
" プラグインの初期設定
" ============================================================

if &compatible
    set nocompatible
endif
set runtimepath+=$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('$HOME/.vim/bundle/'))
    call dein#begin(expand('$HOME/.vim/bundle/'))

    call dein#add('Shougo/dein.vim')

    " カラースキームの追加 (molokai)
    call dein#add('tomasr/molokai')

    " コメントアウトの補助
    call dein#add('tyru/caw.vim')

    " JavaScript の整形を行う
    call dein#add('pangloss/vim-javascript')

    " 不要なスペースを表示・削除する
    call dein#add('bronson/vim-trailing-whitespace')

    " j/kによる移動を速くする
    call dein#add('rhysd/accelerated-jk')

    " 自動補完機能
    call dein#add('Shougo/neocomplete')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on


" ============================================================
" プラグインの個別設定
" ============================================================

" Shougo/neocomplete
let g:neocomplete#enable_at_startup = 1 " vim 起動時に有効

" tyru/caw.vim
"     \\ でコメントあり/なしを切り替える
nmap \\ <Plug>(caw:i:toggle)
vmap \\ <Plug>(caw:i:toggle)

" rhysd/accelerated
"     j/kによる移動を速くする
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)


" ============================================================
" 基本設定
" ============================================================

set number                      " 行番号の表示
set hidden                      " 保存せずに他のファイルを表示できる
set virtualedit=block           " 矩形選択で文字のない場所も選択できるようにする
set backspace=indent,eol,start  " バックスペースを使えるようにする
set nobackup                    " バックアップを作成しない
set noswapfile                  " スワップファイルを作成しない
set noundofile                  " undoファイルを作成しない
set visualbell t_vb=            " ビープ音を全て無効にする
set clipboard=unnamedplus       " yankしたデータをクリップボードに入れる


" ============================================================
" インデント
" ============================================================

set cinoptions+=:0              " switch-case のインデント幅の調整
set expandtab                   " <TAB>をスペースに展開する

set tabstop=4                   " <TAB>の表示幅
set shiftwidth=4                " 自動インデントでずれる幅
set softtabstop=4

if has("autocmd")
    "ファイルタイプの検索を有効にする
    filetype plugin on
    "ファイルタイプに合わせたインデントを利用
    filetype indent on
    "sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtabの略
    autocmd FileType c      setlocal sw=8 sts=8 ts=8 et
    autocmd FileType yaml   setlocal sw=2 sts=2 ts=2 et
endif

" ============================================================
" 表示設定 - カラースキーマ
" ============================================================

set t_Co=256
set background=dark
colorscheme molokai

" 色を有効にする
syntax enable

" 構文ハイライトを有効にする
set cursorline


" ============================================================
" 表示設定 - その他
" ============================================================

" 背景を透過させる
highlight Normal ctermbg=none

" カッコのハイライトを消す
let loaded_matchparen = 1

" 全角スペースの表示
highlight ZenkakuSpace cterm=none ctermbg=gray ctermbg=gray
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

" ステータスラインの表示
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]
            \\ [TYPE=%Y]\[ENC=%{&fileencoding}]
            \\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set showcmd
set laststatus=2


" ============================================================
" 操作設定
" ============================================================

" インクリメント
nnoremap + <C-A>
nnoremap - <C-X>

" jjでインサートモードからノーマルモードへ
inoremap jj <ESC>

" 80文字を超えた場合、ハイライトする
noremap <Plug>(ToggleColorColumn)
            \ :<c-u>let &colorcolumn = len(&colorcolumn) > 0 ? '' :
            \   join(range(81, 9999), ',')<CR>
hi ColorColumn ctermbg=darkgray
" tt でハイライトを切り替える
nmap tt <Plug>(ToggleColorColumn)

" 貼り付けモードの切り替え
set pastetoggle=<F10>
nnoremap <F10> :set paste!<CR>:set paste?<CR>

" ============================================================
" 拡張子
" ============================================================

" NSE(Nmap Script Engine)
autocmd BufNewFile,BufRead *.nse  set filetype=lua

" ============================================================
" その他
" ============================================================

" カーソルの位置を記憶する
if has("autocmd")
    augroup redhat
        " In text files, always limit the width of text to 78 characters
        autocmd BufRead *.txt set tw=78
        " When editing a file, always jump to the last cursor position
        autocmd BufReadPost *
                    \ if line("'\"") > 0
                    \    && line ("'\"") <= line("$") |
                    \    exe "normal! g'\"" |
                    \ endif
    augroup END
endif
