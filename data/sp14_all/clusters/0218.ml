CaseG VarG (fromList [(LitPatG,Nothing,ListG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])
match n with
| 0 -> [0]
| _ -> digitsOfInt (n / 10) @ [n mod 10]
