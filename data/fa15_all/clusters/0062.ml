LamG (TuplePatG (fromList [EmptyPatG])) (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
EMPTY
