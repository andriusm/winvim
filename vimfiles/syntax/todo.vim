syntax region todoDone start=/DONE\|^\s*:/ end=/$/
hi def todoDoneDefinition gui=italic guifg=#0080F0
hi link todoDone todoDoneDefinition
syntax region todoTodo start=/____/ end=/:/
hi def todoTodoDefinition guifg=DarkRed guibg=LightGray
hi link todoTodo todoTodoDefinition

" set up some mappings for todo list
map <F3> Go____: 
map <F4> ^4sDONE<esc>