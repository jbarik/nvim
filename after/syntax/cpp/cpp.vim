syn match langOper "||\|&&\|[-+.*]\|[<>]\|&"
syn match langOper "\(==\|!=\|>=\|<=\|=\~\|!\~\|>\|<\|=\)"
syn match langOper "(\|)"
syn match langOper "{\|}"
syn match langOper /\[/
syn match langOper /\]/
syn match langOper /</
syn match langOper />/
syn match langOper /!/
syn match langOper ",\|;\|:\|?"

"syn match cDelimiter ",\|;\|:\|?"
"hi def link cDelimiter Delimiter
hi def link langOper Operator

syn match   cCustomFunc  "\w\+\s*(\@="
hi def link cCustomFunc  Function
