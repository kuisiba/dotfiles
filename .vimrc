set encoding=utf-8
scriptencoding utf-8

set number "行番号を表示
set title "file name 

set ambiwidth=double "全角記号の表示ズレ対策

set foldmethod=indent "折り畳み

set cursorline
hi clear cursorline

set showmatch "対応するカッコ表示
set matchtime=01 "カッコを強調する時間0.x秒

set hlsearch "検索してマッチした部分をハイライト
set ignorecase
set smartcase
set wrapscan "検索時、最後までいったら最初に戻る
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
set clipboard+=unnamed

set list "tabと半角スペースを可視化
set listchars=tab:>-,trail:-,eol:↵

set laststatus=2 "常にライン表示
set statusline=%F%m%r%h%w\%=%y\[%{&fileencoding}]\[%{&fileformat}]\[pos:%04l,%04v][%p%%]

set whichwrap=h,l "hとlで前行末、次行頭へ

set backspace=indent,eol,start "BSで削除できるものの指定

set signcolumn=yes "LSPのerror表示とかでガタガタするやつの対策（常時表示

syntax on

call plug#begin('~/.vim/plugged')

Plug 'cohama/lexima.vim'
Plug 'rust-lang/rust.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'ryanolsonx/vim-lsp-javascript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install', 
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'posva/vim-vue'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'previm/previm'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'

call plug#end()

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

if executable('intelephense')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->['node', expand('/Users/kuisiba/.nodebrew/node/v10.15.3/lib/node_modules/intelephense/lib/intelephense.js'), '--stdio']},
        \ 'whitelist': ['php'],
        \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:lsp_async_completion = 1
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand("~/vim-lsp.log")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
augroup completion
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

"Rust lsp setting
let g:rustfmt_autosave = 1

"prettier setting
"let g:prettier#exec_cmd_path = "/Users/kuisiba/.nodebrew/current/bin/prettier"
"let g:prettier#exec_cmd_async = 1
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
"let g:prettier#autoformat = 1
"augroup prettier
"    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"augroup END

"previm setting
let g:previm_open_cmd = 'open -a Google\ Chrome'

"colorscheme setting
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"colorscheme ayu
"let ayucolor="dark"
colorscheme nord

"indent setting
set tabstop=4 "インデントの幅
set shiftwidth=4 "indent時にズレる幅
set expandtab "タブをスペースに変換
set softtabstop=4 "一度に空白を何個消すか
"set autoindent
"set smartindent
filetype plugin indent on "ファイル種類別インデント設定
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.json setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

"vim-indent-guides setting
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 1

"git-gutter setting
set updatetime=250
