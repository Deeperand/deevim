if exists('b:current_syntax')
  finish
endif

" avoid auto fold
setlocal nofoldenable

let b:current_syntax = 'which_key'

" let s:sep = which_key#util#get_sep() this command is used at old mac
let s:sep = g:which_key_sep

execute 'syntax match WhichKeySeperator' '/'.s:sep.'/' 'contained'
" execute 'syntax match WhichKey' '/\(^\s*\|\s\{2,}\)\S.\{-}'.s:sep.'/' 'contains=WhichKeySeperator'
execute 'syntax match WhichKey' '/\(^\s*\|\s\{2,}\)\S.\{-}'.s:sep.'/' 'contains=WhichKeySeperator'
" syntax match WhichKeyGroup / +[0-9A-Za-z_/-]*/
syntax match WhichKeyGroup " \({[-A-Za-z0-9()&;,/"\. ]*}\)\|\(+[0-9A-Za-z_/-]*\)" " 后面的那一条正则表达式的 group 是为了兼容插件默认的高亮模式
syntax region WhichKeyDesc start="^" end="$" contains=WhichKey, WhichKeyGroup, WhichKeySeperator

" color of key hint
    highlight WhichKey gui=bold guifg=#49a328
" color of seperator (the arrow)
    highlight WhichKeySeperator gui=bold guifg=#7283ff
" color of group
    highlight WhichKeyGroup gui=bold guifg=#e636cc
" color of describe text
    highlight WhichKeyDesc guifg=#5881ac
