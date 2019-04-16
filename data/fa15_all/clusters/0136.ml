LetG NonRec (fromList [(VarPatG,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)]) (AppG (fromList [EmptyG]))
let n1 =
  (let x0 = digitsOfInt n in
   sumList x0) in
additivePersistence n1
