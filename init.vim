call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'preservim/vim-markdown'

" use fd to escape insert mode.
Plug 'jdhao/better-escape.vim'
let g:better_escape_shortcut = ['jk', 'fd']

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting





" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" git in/out 
nmap <leader>oi :!oi<cr>
nmap <leader>oo :!oo<cr>

" list all buffer and file names 
map <leader>bs :buffers<cr>
" go to next/prev buffer 
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>
map <leader>bl :blast<cr>
map <leader>bf :bfirst<cr>

" delete-other-windows  ;; C-w o
map <leader>v :on<cr>

"let g:vim_markdown_folding_style_pythonic = 1
set foldlevelstart=2