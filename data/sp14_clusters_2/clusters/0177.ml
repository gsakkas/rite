CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])
match digitsOfInt n with
| [] -> 0
| _ -> sumList (digitsOfInt n)
