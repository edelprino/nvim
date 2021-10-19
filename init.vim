set t_Co=256
set clipboard+=unnamedplus
packloadall
silent! helptags ALL

lua require('init')
let g:vsnip_snippet_dir = expand('~/.config/nvim/snippets')
let g:CheatSheetStayInOrigBuf=0
nnoremap gf <C-W>gf

filetype plugin indent on
syntax on
silent! colorscheme material
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi CursorLineNr guibg=NONE ctermbg=NONE

" Avoid showing message extra message when using completion
set shortmess+=c
" set completeopt=menuone,noinsert,noselect
set completeopt=menu,menuone,noselect

imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

augroup Terminal
  autocmd TermOpen * setlocal statusline=%{b:term_title}
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd TermOpen * setlocal bufhidden=hide
  autocmd TermOpen * startinsert
  tmap <Esc> <C-\><C-n>
augroup END

augroup VisualActions
  au!
  " Default Visual block
  nnoremap v <c-v>
  " This keeps the current visual block selection active after changing indent with '<' or '>'
  vmap > >gv
  vmap < <gv
  vmap <silent> <leader>c :'<,'>Commentary<CR>
  " Move block up and down
  vnoremap <C-k> :m '<-2<CR>gv=gv
  vnoremap <C-j> :m '>+1<CR>gv=gv
  vnoremap p "0p
augroup END

function! ConfirmQuit()
    if (winnr('$')==1 && tabpagenr('$')==1)
        if (confirm("Do you really want to quit?", "&Yes\n&No", 2)==1)
            :quit
        endif
    else
        :quit
    endif
endfunction

set updatetime=1000

autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType php set iskeyword+=$
autocmd BufEnter _cheat map <Esc> :q<cr>
autocmd BufLeave,FocusLost * silent! wall
autocmd BufWritePost nvim/* source %
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
autocmd CursorHold *.* lua require'lspsaga.diagnostic'.show_line_diagnostics()
autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 300)

command! -nargs=1 Google execute ':silent !open "http://www.google.com/search?q='.<q-args>.'"'
