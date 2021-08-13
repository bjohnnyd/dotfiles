" Source necessary functions
" Rather than having loads of comments above my mappings I
" try to make well named functions 
" TODO: A lot of function wont work with the git root module
source ~/.config/nvim/functions.vim

" Automatically Install Vim-plug if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" vim-plug packages section
"
" Autocomplete, Linting  and Coments
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align'
Plug 'cometsong/CommentFrame.vim'


" Nextflow
Plug 'LukeGoodsell/nextflow-vim'

" Appearance or GUI
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'


" Enhancements
Plug 'tpope/vim-surround'
Plug 'adelarsq/vim-matchit'
Plug 'machakann/vim-highlightedyank'
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'pdurbin/vim-tsv'
Plug 'preservim/nerdcommenter'
Plug 'mtth/scratch.vim'
" Plug 'justinmk/vim-sneak'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Justfile
Plug 'NoahTheDuke/vim-just'

" Fuzzy finder
 Plug 'airblade/vim-rooter'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'

" Syntactic language support
 Plug 'cespare/vim-toml'
 Plug 'stephpy/vim-yaml'
 Plug 'rust-lang/rust.vim'
 Plug 'rhysd/vim-clang-format'
 Plug 'godlygeek/tabular'
 Plug 'plasticboy/vim-markdown'

" Show hex colours
Plug 'gko/vim-coloresque'

" Rust Related RON ser
Plug 'ron-rs/ron.vim'

" Insert closing bracket
Plug 'jiangmiao/auto-pairs'

" Python 2020 Setup https://www.vimfromscratch.com/articles/vim-for-python/
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'numirias/semshi'
Plug 'Vimjas/vim-python-pep8-indent'

"Testing
Plug 'vim-test/vim-test'

" Zeal (https://zealdocs.org/usage.html) integration for multiple language
" docs
Plug 'KabbAmine/zeavim.vim'

" WebDev
Plug 'mattn/emmet-vim'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'othree/xml.vim'

" Configs
Plug 'editorconfig/editorconfig-vim'

call plug#end()


set nu
set autoindent
" Gruvbox Options
" e.g:let g:gruvbox_(option) = '(value)'
" let g:gruvbox_contrast_dark='soft'
" set background=dark
" set t_Co=256
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" let base16colorspace=256
" colorscheme gruvbox

""" BASE 16
" set termguicolors
colorscheme base16-gruvbox-dark-pale
if has("termguicolors")
    set termguicolors
endif
" colorscheme base16-dracula
" colorscheme base16-ocean
" colorscheme base16-tomorrow-night
" colorscheme base16-github-dark
" Taglist and NerdTree Settings

" let Tlist_Use_Split_Window = 1
" com TT NERDTree | TlistToggle

" Remapping Window jumping
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Airline Setting
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_eighties'
"
" Additonal mappings newer
let maplocalleader=' '
set relativenumber

" Proper reading of markdown files
"autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead,BufEnter *.nf set filetype=groovy
autocmd BufNewFile,BufRead,BufEnter *.bed set filetype=tsv

" Syntastic Settings
set statusline+=%#warningmsg#
"" Has errors
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Remap leader
let mapleader = " "

" Fix Backspace
set backspace=indent,eol,start

" Snakemake
map <leader>ss :set syntax=snakemake<CR>
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake

" Enable Paste Mode (formatting issues) in VIM
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" add yaml stuffs
au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" added autoformat shortcut
noremap <F3> :Autoformat<CR>

" added to be able to copy buffer to clipboard
set clipboard=unnamedplus

" added shortcut for copying and pasting from clipboard
" vmap <leader>yc "*y
" nmap <leader>pc "*p
vmap <Leader>y "*y
noremap <Leader>p "*p
vmap <Leader>Y "+y
noremap <Leader>P "+p
nnoremap <Leader><Leader> :bnext<CR>

" Markdown buffer preview with images
"let vim_markdown_preview_toggle=1
"let vim_markdown_preview_github=1

" Rust settings
let g:rustfmt_autosave = 1

" Sneak Related
" map f <Plug>Sneak_s
" map F <Plug>Sneak_S

" Rust Analyzer And Python Flake8
let g:ale_linters = { 'rust' : ['analyzer'], 'python' : ['flake8'] }
"FZF key bindings and commands ---------------- {{{

nnoremap <C-f> :FZF<CR>
nnoremap <C-t> :Find 

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-i': 'split',
"  \ 'ctrl-v': 'vsplit' }
" }}}

" Coc Custom
" Use K to show documentation in preview window.
nnoremap <silent> <C-q> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


"" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


"" Ale settings
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 0

" autocmd BufWrite *py ALEFix black


"" Rust customs
" Make CTRL-T work correctly with goto-definition.
" setlocal tagfunc=CocTagFunc

nmap <Leader>gt <Plug>(coc-type-definition)
nmap <Leader>gre <Plug>(coc-references)
nmap <Leader>grn <Plug>(coc-rename)
nmap <Leader>gd <Plug>(coc-diagnostic-info)
nmap <Leader>gp <Plug>(coc-diagnostic-prev)
nmap <Leader>gn <Plug>(coc-diagnostic-next)


" Trigger auto-completion with C-space.
inoremap <silent><expr> <c-space> coc#refresh()
" Make <TAB> select next completion and Shift-<TAB> to select previous.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <silent><expr> <S-TAB>
  \ pumvisible() ? "\<C-p>" :
  \ <SID>check_back_space() ? "\<S-TAB>" :
  \ coc#refresh()
" Make <CR> confirm completion.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"


" Fix highlighting issue common in nf files
autocmd BufEnter * :syntax sync fromstart

" Enable persistent scratch
let g:scratch_persistence_file = '/tmp/.scratch'


" Pyton Jedi
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = 1

" To avoid issues with python
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.8'

" JavaScript Indentation
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

" Linting Changes
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
autocmd BufWrite *.js ALEFix

" postgres setup instead of SQL
let g:sql_type_default = 'pgsql'


"" General Additional
set splitright                    " Open splits to the right

" Disable useless and annoying keys
noremap Q <Nop>
noremap K <Nop>


" Resize windows with the arrow keys
nnoremap <s-up> 10<C-W>-
nnoremap <s-down> 10<C-W>+
nnoremap <s-left> 3<C-W>>
nnoremap <s-right> 3<C-W><

" Quickly insert semicolon at end of line
noremap <leader>; maA;<esc>`a
noremap <leader>, maA,<esc>`a
noremap <leader>: maA:<esc>`a

" Definitions and open files commands
nnoremap <leader>J :call GotoDefinitionInSplit(1)<cr>
nnoremap <leader>O :!open %<cr><cr>

" Rust specific
nnoremap <leader>T :call <SID>run_rust_tests()<cr>
nnoremap <leader>D :w<cr>:Dispatch cargo doc<cr>
autocmd FileType rust nnoremap <buffer> <C-%> i=><Esc>

function! s:run_rust_tests()
  if &modified
    write
  end
  call SmartRun("cargo test --all")
endfunction

function! s:GoToDefinition(split)
  if a:split
    split
  endif
  if CocAction('jumpDefinition')
    return v:true
  endif
  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "error"
    call searchdecl(expand('<cword>'))
  endif
endfunction


nnoremap <leader>O viw<esc>a)<esc>biOk(<esc>lel
nnoremap <leader>S viw<esc>a)<esc>biSome(<esc>lel

augroup cargo_toml
	autocmd!
	autocmd Filetype toml nnoremap <leader>f f"i{version = <esc>2f"a, features = []
augroup END

" Go to definition of a funciton
nmap <silent> gd :call <SID>GoToDefinition(1)<CR>

" Close buffer without closing split window
nnoremap <C-c> :bp\|bd#<CR>

" Add case insensitive search
nnoremap <leader>/ /\c

" Add regex search
nnoremap <leader>%s  :%s/\v
nnoremap <leader>s  :s/\v

" Rust tests
nnoremap <leader>T :call <SID>run_rust_tests()<cr>

function! s:run_rust_tests()
	if &modified
		write
	end
	call SmartRun("cargo test --all")
endfunction

"" Allows to trigger import selection for coc-rust-analyzer
nmap <leader>a <Plug>(coc-codeaction-selected)

"" Testing settings
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nnoremap <silent> t<C-n> :TestNearest<CR>
noremap <silent> t<C-f> :TestFile<CR>
noremap <silent> t<C-s> :TestSuite<CR>
noremap <silent> t<C-l> :TestLast<CR>
noremap <silent> t<C-g> :TestVisit<CR>

" make test commands execute using neovim
let test#strategy = "neovim"


" quick key bindings
inoremap <c-u> <Esc>viwUea

" quick modification of VIMRC
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

"put surrounding quotes around word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" common typos fix ------------- {{{
iabbrev adn and
iabbrev thne then
iabbrev tehn then
" }}}

" might try to speed up exit from insert mode
inoremap jk <esc>


" Vimscript file settings ---------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" R-Markdown related---------------- {{{
nnoremap <c-k> :call KnitMarkdown()<cr>
"
" }}}


" Running Commands---------------- {{{
augroup  CMF_BUFFER_GROUP
	autocmd!
	au TermClose * silent call OnTermClose()
augroup END
"
" }}}

" WebDev Commands---------------- {{{
let g:user_emmet_leader_key='<Tab>'
" }}}

" EditorConfig global---------------- {{{
au FileType gitcommit let b:EditorConfig_disable = 1
" }}}

"
" EasyAlign Configs---------------- {{{

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}

" Radian Configs ---------------- {{{
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1
" }}}}

" Markdown Preview---------------- {{{
nmap <leader>m <Plug>MarkdownPreview
nmap <leader>ms <Plug>MarkdownPreviewStop
nmap <leader>mt <Plug>MarkdownPreviewToggle
let g:mkdp_filetypes = ['markdown']
let g:mkdp_browser = 'firefox'
" }}}
