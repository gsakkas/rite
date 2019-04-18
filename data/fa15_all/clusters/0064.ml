CaseG (fromList [(ConsPatG VarPatG (ConPatG Nothing),Nothing,AppG (fromList [EmptyG]))])
match l with
| x :: [] -> "[" ^ (x ^ "]")
