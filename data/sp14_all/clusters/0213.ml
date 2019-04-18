CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG]))])
match xs with
| hd :: tl -> f (f hd hd) tl
