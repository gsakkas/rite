LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),TupleG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)
let (x , y) =
  (n mod 10 , n / 10) in
if x < 10
then [x]
else x :: (digitsOfInt y)
let (a , b) =
  (List.length l1 , List.length l2) in
if a < b
then (List.append (clone 0
                         (b - a)) l1 , l2)
else if b < a
     then (l1 , List.append (clone 0
                                   (a - b)) l2)
     else (l1 , l2)
