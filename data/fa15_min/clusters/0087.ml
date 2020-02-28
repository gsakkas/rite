LetG NonRec [(VarPatG,LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)] (AppG [EmptyG])
let n1 =
  (let x0 = digitsOfInt n in
   sumList x0) in
additivePersistence n1
EMPTY
