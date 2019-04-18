LetG NonRec (fromList [(VarPatG,LamG (TuplePatG (fromList [EmptyPatG])) EmptyG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let prevN =
  fun (n1 , n2) -> n1 in
let prev = prevN a in
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
