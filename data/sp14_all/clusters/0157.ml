CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,LitG)])
match xs with
| [] -> 0
| hd :: tl -> f 0 hd
