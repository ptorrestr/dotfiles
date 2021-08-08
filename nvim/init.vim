""" Vim-Plug
call plug#begin()

" File tree
Plug 'scrooloose/nerdtree'
" Search in files
Plug 'junegunn/fzf.vim'
" Comment lines
Plug 'tpope/vim-commentary'
" Integration with poetry, pipenv
"Plug 'petobens/poet-v'
" Bar
Plug 'liuchengxu/vista.vim'
" Auto pair parentisis and others
Plug 'jiangmiao/auto-pairs'
" Colour theme
Plug 'joshdick/onedark.vim'
" Syntaxis highlight
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Linting
Plug 'dense-analysis/ale'
" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
let g:deoplete#enable_at_startup = 1
" Status bar
Plug 'itchyny/lightline.vim'
" Status bar - linting
Plug 'maximbaz/lightline-ale'
" Git integration
Plug 'tpope/vim-fugitive'

call plug#end()

syntax on
set nu
colorscheme onedark
":let mapleader = "\\"

" Configure ALE linters
let g:ale_linters = {
      \   'python': ['pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}
let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_auto_pipenv = 1
let g:airline#extensions#ale#enabled = 1

" Configure Lightline - ale
let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.colorscheme = 'one'
let g:lightline.component_function = {
      \   'gitbranch': 'FugitiveHead'
      \ }
let g:lightline.active = {
      \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \            [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype'] ],
      \ 'left':  [ [ 'mode', 'paste' ],
      \            [ 'gitbranch', 'readonly', 'filename', 'modified' ] ] }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
