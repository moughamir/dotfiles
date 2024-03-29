"General Settings
syntax on
set wrap
set updatetime=500
set ttyfast
set textwidth=80
set tabstop=2
set spr
set softtabstop=2
set smartcase
set showmode
set shiftwidth=2
set scrolloff=8
set sc
set sb
set ruler
set relativenumber
set number
set nu
set nomodeline "for security
set noincsearch
set nocp
set nocompatible "be IMproved, required
set mouse=a
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,nbsp:␣
set list
set lazyredraw
set ignorecase
set hlsearch
set history=10000
set hidden
set foldmethod=indent
set foldlevel=99
set fileencoding=utf-8
set expandtab
set cursorline
set conceallevel=2
set completeopt=menuone
set bg=dark
set backspace=indent,eol,start
set ai
let mapleader=" "
let g:netrw_dirhistmax = 0
filetype plugin indent on

"Automate Plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"Plugins
call plug#begin('~/.local/share/nvim/plugged')
"Autocomplete
Plug 'deoplete-plugins/deoplete-go', { 'for': 'go' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode=1
let g:AutoPairsShortcutBackInsert='<M-b>'
Plug 'othree/yajs.vim'
"Text Manipulation
Plug 'tpope/vim-surround'
Plug 'mxw/vim-jsx'
"Tools
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': { -> mkdp#util#install() } }
Plug 'dense-analysis/ale'

"Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
"Writing
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/limelight.vim'
"Visuals
Plug 'lilydjwg/colorizer'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle'}
"Aesthetics
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()




"Aesthetics
let g:solarized_termcolors=256
let g:solarized_use16=1
let g:solarized_extra_hi_groups=1
let g:solarized_statusline='flat'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme solarized8
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_symbols = {}
let g:airline_symbols.linenr = 'Ξ'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#whitespace#symbol= '!'

"Deoplete
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

"Vimtex
let g:vimtex_fold_enabled = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
call deoplete#custom#var('omni', 'input_patterns', {'tex': g:vimtex#re#deoplete})

"Goyo/Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <leader>g :Goyo<CR>

"Vim-Go
let g:go_fmt_fail_silently = 1
let g:go_fmt_experimental=1

"Markdown
nmap <C-p> <Plug>MarkdownPreviewToggle

"Terminal
au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>

"Keybindings
nnoremap <C-Space> :FZF<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-c> :Commands<CR>
nnoremap <space><space> :buffer #<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>z :x<CR>
nnoremap <leader>x :xa<CR>
nnoremap <leader>q :qa<CR>
noremap <leader>y "+y
nnoremap <leader><leader> ;
inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
imap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <cr>    pumvisible() ? deoplete#close_popup() : "\<cr>"

"Window Navigation
nnoremap <C-H> :vertical resize -5<CR>
nnoremap <C-J> :resize +5<CR>
nnoremap <C-K> :resize -5<CR>
nnoremap <C-L> :vertical resize +5<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>H <C-w>H
nnoremap <leader>j <C-w>j
nnoremap <leader>J <C-w>J
nnoremap <leader>k <C-w>k
nnoremap <leader>K <C-w>K
nnoremap <leader>l <C-w>l
nnoremap <leader>L <C-w>L
autocmd VimResized * wincmd =

"Tab Navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap td  :tabclose<CR>
nnoremap tn :tabnew<CR>

" Center searches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *N

"NerdTree
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" FZF
let $FZF_DEFAULT_COMMAND =  "rg --files --hidden"
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  let height = float2nr(min([10, &lines/2]))
  let width = float2nr(min([80, &columns/2]))
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  call nvim_open_win(buf, v:true, opts)
endfunction
