execute pathogen#infect()
call pathogen#helptags()
map <C-n> :NERDTreeToggle<CR>
set rs term=builtin_ansi ai et smarttab ts=4 shiftwidth=4 binary noeol t_ti=[?47h t_te=[?47l
set et
set encoding=utf-8
let mapleader = ","

" vim airline
set laststatus=2
set t_Co=256
set timeoutlen=200
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

nnoremap <silent> <leader>[ :vertical resize -1<CR>
nnoremap <silent> <leader>] :vertical resize +1<CR>
nnoremap <silent> <leader>- :resize -1<CR>
nnoremap <silent> <leader>= :resize +1<CR>

" Vdebug
    let g:vdebug_keymap = {
    \    "run" : "<Leader>r",
    \    "run_to_cursor" : "<up>",
    \    "step_over" : "<down>",
    \    "step_into" : "<left>",
    \    "step_out" : "<right>",
    \    "close" : "q",
    \    "detach" : "<Leader>x",
    \    "set_breakpoint" : "<Leader>b",
    \    "get_context" : "<F11>",
    \    "eval_under_cursor" : "<leader>e",
    \    "eval_visual" : "E",
    \}

syntax on
syn sync fromstart
" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

map [15~ <F5>
map [17~ <F6>
map [18~ <F7>
map [19~ <F8>
map [20~ <F9>
map [21~ <F10>
map [23~ <F11>
map [24~ <F12>

cmap w!! w !sudo tee %

" Fast saves
nmap <leader>w :w!<cr>
nmap <leader>e :e<cr>
nmap <leader>q :q<cr>
nmap <leader>t :! clear && phpunit %<cr>

"Easy escaping to normal model
imap jj <esc>
 
"Auto change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

colo putty
