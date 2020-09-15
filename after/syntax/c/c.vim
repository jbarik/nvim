syn match langOper "||\|&&\|[-+.*]\|[<>]\|&"
syn match langOper "\(==\|!=\|>=\|<=\|=\~\|!\~\|>\|<\|=\)"
syn match langOper "(\|)"
syn match langOper "{\|}"
syn match langOper /\[/
syn match langOper /\]/

hi def link langOper Operator

syn match   cCustomFunc  "\w\+\s*(\@="
hi def link cCustomFunc  Function
