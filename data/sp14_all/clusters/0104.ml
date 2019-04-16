LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))
let ans = f b in
match ans with
| (num , boo) -> if boo = true
                 then wwhile (f , num)
                 else num
