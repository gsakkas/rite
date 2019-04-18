CaseG (fromList [(ConPatG Nothing,Nothing,LitG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])
match digitsOfInt n with
| [] -> 0
| _ -> sumList (digitsOfInt n)
