CaseG (AppG [EmptyG]) [(Nothing,LitG),(Nothing,AppG [EmptyG])]
match digitsOfInt n with
| [] -> 0
| _ -> sumList (digitsOfInt n)
