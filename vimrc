"Author: Jesse Chenhalls
"Created Date: 20230731
" Custom vimrc as of 2022/1/17 01
" try colorscheme dracula, but fallback to colorscheme elflord


try
    packadd! tender
    colorscheme tender
    catch
    try
        colorscheme elflord
        catch
    endtry
endtry

set rtp+=~/.fzf
" this is more
"
set number
" Searching highlight
set hlsearch
set ignorecase
set smartcase
set expandtab
set shiftwidth=2
set tabstop=2
set smartindent
set autoindent
filetype plugin indent on
set incsearch

" set leader key to space
nnoremap <SPACE> <Nop>
let mapleader =" "


set hidden
" set relativenumber
" set termguicolors
" set undofile
" set spell

" folding with {{{ and then }}}
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
" you then need to enable folding with :foldclose or :foldopen
map <leader>o  :foldopen<CR>
map <leader>c  :foldclose<CR>
highlight Folded cterm=bold ctermfg=red ctermbg=Black

set cursorline
highlight CursorLine ctermbg=Black cterm=None
highlight LineNr ctermbg=Black ctermfg=White
highlight CursorLineNr ctermbg=Black cterm=bold ctermfg=Blue

" Searching
highlight Search cterm=NONE ctermfg=red ctermbg=white
" set noh
map <C-h>   :noh<CR>

set title
set wildmode=longest:full,full
set wildmenu
set nowrap
" show hidden spaces
set list
set listchars=tab:▸\ ,trail:·
set mouse=n




" for neovim
" set signcolumn=yes:2

" set scrolling distance
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
" set backup
" set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
" set redrawtime=10000 " Allow more time for loading syntax on large files

"if &loadplugins
"  if has('packages')
"    packadd! nerdtree
"  endif
"endif



" shit+tab in normal mode unindents
map <S-Tab> <<
map <leader>h :history<CR>
map <leader>f :files<CR>
map <leader>l :ls<CR>

"buffers
"buffer create, buffer delete, buffer next, buffer list
map bc  :enew<CR>
map bd  :bd<CR>
map bn  :bn<CR>
map bl  :buffers<CR>:buffer<SPACE>

"tabs
map tc   :tabnew<CR>
map tn   :tabnext<CR>

" nerdtree config
let NERDTreeShowHidden=1
"nnoremap <expr> t   g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
"function NtToggle()
"  if exists("g:NERDTree") && g:NERDTree.IsOpen()
"    NERDTreeClose
"  else
"    NERDTree
"  endif
"endfunction
map <C-n>   :NERDTreeToggle<CR>

" map <leader>T :call NERDTreeFind<CR>

" force reload changed files in all buffers
" this is helpful when git changes files you had open
map <leader>e :bufdo e!<CR>


" CtrlP fuzzy search
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
nmap <leader>g :CtrlP<CR>

"fzf
map f   :FZF<CR>
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--preview-window 'right:60%' --layout reverse --preview 'batcat --color=always --style=plain --line-range :300 {}' --bind left:preview-page-up,right:preview-page-down"
" let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"

"command! -nargs=? -bang -complete=dir FZF
"    \ call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%') : {}, <bang>0)


" function to control the mouse
function ToggleMouse()
    if &mouse =~# 'n'
        set mouse=
    else
        set mouse=n
    endif
endfunction
map <C-m>  :call ToggleMouse()<CR>

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Try to set the Airline Theme to papercolor

try
    "packadd airline
    "packadd airline-themes
    " let g:airline_theme='papercolor'
    let g:airline_theme='tender'
    catch
endtry

"map <C-d>   :w !diff % - --color=always<CR>
"
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

