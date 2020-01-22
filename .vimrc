" Required for Vim
set nocompatible

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin indent on

" Configure UI
set t_Co=256
if (has("termguicolors"))
 set termguicolors
endif

" colorscheme base16-default-dark
colorscheme base16-tomorrow-night
" colorscheme base16-gruvbox-dark-hard
" colorscheme base16-gruvbox-light-hard
" colorscheme base16-solarized-light

" Don't create backup files
set nobackup

" Don't wrap the lines
set nowrap

" Enable syntax highlighting
syntax on

" Better handling of multiple files in the same window
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" Encoding
set encoding=utf-8
set termencoding=utf-8

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number

" Display relative line numbers
set relativenumber

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set softtabstop=2
set expandtab

" Highlight the current line
" set cursorline

" Ignore common build directories and hidden files and directories
set wildignore=tags,.*,*/cmake-build/*

" Set my common tags files
set tags=tags
" set tags=tags,~/.conan/data/tags

" Easier leader
let mapleader=','

" vim-commentary settings
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Map NERDTree toggle
noremap <silent> <leader>nt :NERDTreeToggle<CR>

" Shortcut to toggle 'set list'
noremap <silent> <leader>l :set list!<CR>

" Change the characters used when listing whitespace
set listchars=tab:→\ ,eol:$,trail:·

" Clear the trailing whitespace in the file
noremap <F2> :%s/\s*$//<CR>

" Easy editing of .vimrc
noremap <silent> <leader>ev :e $MYVIMRC<CR>

" Auto-reload the .vimrc file when saved
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" C++ settings
set cindent

" Don't indent inside of a namespace block
set cinoptions+=N-s

" Don't dedent jump labels
set cinoptions+=L0

" Don't indent C++ scope declarations 
set cinoptions+=g0 

" Don't indent switch case
set cinoptions+=:0

" Don't indent inside C++ linkage specifications
set cinoptions+=E-s

" clang-format integration
map <C-K> :py3f /usr/local/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:py3f /usr/local/share/clang/clang-format.py<cr>

" fzf configuration
noremap <C-P> :Files<CR>
noremap <Leader>b :Buffers<CR>
noremap <Leader>t :tags<CR>
noremap <Leader>T :Tags<CR>
noremap <Leader>h :History<CR>
let g:fzf_tags_command = 'ctags -R --c++-kinds=+p --fields=+iaS --extras=+q'

