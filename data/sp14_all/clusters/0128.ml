CaseG (AppG [EmptyG]) [(ConPatG Nothing,Nothing,LitG),(WildPatG,Nothing,AppG [EmptyG])]
match digitsOfInt n with
| [] -> 0
| _ -> sumList (digitsOfInt n)
