"----------Plugins----------"
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'lifepillar/vim-solarized8'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Insert or delete brackets, parens, quotes in pair
Plug 'tpope/vim-surround'

" Comment smartly
Plug 'preservim/nerdcommenter'

" On-demand loading
Plug 'airblade/vim-gitgutter', {'on':'GitGutterEnable'}
Plug 'junegunn/goyo.vim', {'on':'Goyo'}
Plug 'preservim/nerdtree', {'on':'NERDTreeToggle'}
Plug 'xuyuanp/nerdtree-git-plugin', {'on':'NERDTreeToggle'}
Plug 'ekalinin/Dockerfile.vim', {'for':'docker'}
Plug 'fatih/vim-go', {'for':'go'}
Plug 'plasticboy/vim-markdown', {'for':['markdown', 'md']}
Plug 'chr4/nginx.vim', {'for':'nginx'}
Plug 'hashivim/vim-terraform', {'for':['terraform', 'tf']}
Plug 'cespare/vim-toml', {'for':['toml']}
Plug 'hashivim/vim-vagrant', {'for':['vagrant', 'Vagrantfile']}
Plug 'stephpy/vim-yaml', {'for':['yaml', 'yml']}

" Initialize plugin system
call plug#end()

" True color support
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"----------Theme-----------"
colorscheme solarized8

"----------Basic configs----------"
retab
syntax on
filetype on
filetype plugin indent on
set background=light
set number
set nobackup
set nocompatible
set cursorline
set encoding=utf-8
set ruler
set showmatch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autowriteall
set autoindent
set visualbell
set smartindent
set fileformat=unix
set backspace=indent,eol,start
set complete=.,w,b,u
set hlsearch
set incsearch

"----------Status Line--------------"
set statusline=
set statusline+=\ %Y\ %F\ %M\ %R
set statusline+=%=
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

"----------Special Configs----------"
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"----------Plugins Configs----------"
let g:goyo_width = '100%'
let g:goyo_height = '100%'
let g:vim_markdown_folding_disabled = 1
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

"----------Shortcuts----------"
let mapleader = ','

" make GitGutter easier to toggle
nmap <Leader>g :GitGutterEnable<cr>

"Toggle Fullscreen mode
nmap <Leader>f : Goyo<cr>

"make NERDTree easier
nmap <Leader><Bslash> :NERDTreeToggle<cr>
nmap <Leader>n :NERDTreeFocus<cr>