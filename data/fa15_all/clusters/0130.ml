LamG VarPatG (LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)
fun x ->
  (let (a1 , a2) = a in
   let val1 = (x * i) + a1 in
   if val1 > 9
   then (val1 / 10 , (val1 mod 10) :: a2)
   else (0 , val1 :: a2))
