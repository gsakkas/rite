LetG NonRec [(TuplePatG (fromList [EmptyPatG]),TupleG [EmptyG,EmptyG])] (IteG EmptyG EmptyG EmptyG)
let (x , y) =
  (n mod 10 , n / 10) in
if x < 10
then [x]
else x :: (digitsOfInt y)
