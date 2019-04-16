CaseG VarG (fromList [(LitPatG,Nothing,VarG),(LitPatG,Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])
match i with
| 1 -> l
| 10 -> l @ [0]
| _ -> bigAdd l
              (mulByDigit (i - 1) l)
