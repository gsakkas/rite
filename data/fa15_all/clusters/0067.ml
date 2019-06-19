CaseG VarG [(LitPatG,Nothing,VarG),(WildPatG,Nothing,AppG [EmptyG,EmptyG])]
EMPTY
match a with
| "" -> x
| _ -> a ^ (sep ^ x)
match i with
| 1 -> l
| 10 -> l @ [0]
| _ -> bigAdd l
              (mulByDigit (i - 1) l)
