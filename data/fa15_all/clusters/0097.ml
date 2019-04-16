LamG (TuplePatG (fromList [VarPatG])) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
