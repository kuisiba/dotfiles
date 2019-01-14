set nocompatible "vi互換モード解除
set t_Co=256 "256色モード
set number "行番号を表示
set title "file name 

set cursorline
hi clear cursorline

set showmatch "対応するカッコ表示
set matchtime=01 "カッコを強調する時間0.x秒

set tabstop=4 "インデントの幅
set shiftwidth=4 "indent時にズレる幅
"set expandtab "タブをスペースに変換

set foldmethod=indent "折り畳み

syntax on
filetype plugin indent on "ファイルの種類を検出してハイライト
"set autoindent "自動インデント
"set smartindent "auto indent
set ignorecase "大文字小文字区別なく検索
set smartcase "検索文字列に大文字が含まれてる場合は区別して検索
set wrapscan "検索時、最後までいったら最初に戻る
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
set clipboard=unnamed,autoselect "クリップボードにコピー
set hlsearch "検索してマッチした部分をハイライト
set cindent "C言語スタイルのインデント

set list "tabと半角スペースを可視化
set listchars=tab:>-,trail:-,eol:↲

set laststatus=2 "ライン表示・その設定
:set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[ENC=%{&fileencoding}]\[FORMAT=%{&ff}]\[POS=%04l,%04v][%p%%]\[LEN=%L]

set whichwrap=h,l "hとlで前行末、次行頭へ

set backspace=indent,eol,start "BSで削除できるものの指定

inoremap { {}<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>

call plug#begin('~/.vim/plugged')

Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'morhetz/gruvbox'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'
Plug 'ryanolsonx/vim-lsp-javascript'
"Plug 'prettier/vim-prettier', { 'do': 'npm install' }

call plug#end()

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
endif

let g:lsp_async_completion = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand("~/vim-lsp.log")
autocmd FileType javascript setlocal omnifunc=lsp#complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

set hidden
let g:racer_cmd = "/c/Users/kuisiba/.cargo/bin/racer.exe"
let $RUST_SRC_PATH="/c/Users/kuisiba/.rustup/toolchains/stable-x86_64-pc-windows-gnu/lib/rustlib/src/rust/src"
let g:rustfmt_autosave = 1
let g:rustfmt_command = '/c/Users/kuisiba/.cargo/bin/rustfmt.exe'

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1


set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

