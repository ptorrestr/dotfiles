""" Vim-Plug
call plug#begin()

" File tree
Plug 'scrooloose/nerdtree'
" Search in files
Plug 'junegunn/fzf.vim'
" Comment lines
Plug 'tpope/vim-commentary'
" Integration with poetry, pipenv
Plug 'petobens/poet-v'
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

call plug#end()

syntax on
colorscheme onedark

let g:ale_linters = {
      \   'python': ['pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✨ all good ✨' : printf(
    \   '😞 %dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}
