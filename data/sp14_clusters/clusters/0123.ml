CaseG VarG [(Nothing,VarG),(Nothing,AppG [EmptyG,EmptyG])]
match i with
| 1 -> l
| _ -> bigAdd (mulByDigit (i - 1)
                          l) l
