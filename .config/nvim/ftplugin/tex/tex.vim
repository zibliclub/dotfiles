" My LaTex settings

" Only load this plugin it has not yet been loaded for this buffer
" Note that using b:did_ftplugin would disable vimtex
if exists("b:did_mytexplugin")
  finish
endif
let b:did_mytexplugin = 1

let g:tex_flavor = 'latex'  " recognize tex files as latex

" setting indentation
setlocal expandtab
setlocal autoindent
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" Turn off automatic indenting in enumerated environments
let g:tex_indent_items = 0

" Compilation
noremap <leader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>

" BEGIN FORWARD SHOW
" ---------------------------------------------
nmap <leader>v <plug>(vimtex-view)

function! s:TexFocusVim() abort
    execute "!open -a Alacritty"
    redraw!
  endfunction

  augroup vimtex_event_focus
    au!
    au User VimtexEventViewReverse call s:TexFocusVim()
  augroup END

" ---------------------------------------------
" END COMPILATION AND PDF READER SUPPORT
