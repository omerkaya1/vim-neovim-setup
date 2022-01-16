set number relativenumber
set autoindent
set mouse=a
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Install vim-plug if not found
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Language agnostic, general purpose plugins
Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround
Plug 'tpope/vim-fugitive' " https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary
Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'ctrlpvim/ctrlp.vim' "https://github.com/ctrlpvim/ctrlp.vim
Plug 'airblade/vim-gitgutter' " https://github.com/airblade/vim-gitgutter
Plug 'mkitt/tabline.vim' " https://github.com/mkitt/tabline.vim
" Code completion
Plug 'neoclide/coc.nvim', {'branch':'release'} " https://github.com/neoclide/coc.nvim
" Golang specific
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " https://github.com/fatih/vim-go
" Color schemas
Plug 'ajmwagar/vim-deus' " https://github.com/ajmwagar/vim-deus

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

map <C-z> :NERDTreeToggle<CR> “ Toggle side window with `CTRL+z`.
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1 " Show hidden files

filetype plugin indent on

set autowrite

" Go syntax highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" Highlight all uses of the selected item
let g:go_auto_sameids = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports" " We can use goimports or gofmt

" Status line types/signatures
let g:go_auto_type_info = 1

" LSP related settings
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" JSON tags
let g:go_addtags_transform = "snakecase"

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

au FileType go nmap <leader>gt :GoDeclsDir<cr>

" Run tests
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)

au FileType go nmap <F10> :GoTest -short<cr> " do ,ga to switch to the test (, - leader key) or ,gav / ,gah to open in a vertical / horizontal split.
au FileType go nmap <F9> :GoCoverageToggle -short<cr> " Applies coverage mode

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" Set up color schema
syntax enable
set background=dark
colors deus
