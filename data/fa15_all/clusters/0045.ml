TupleG (fromList [VarG,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG])
(let g =
   fun b ->
     (let t = f b in
      if b = t
      then (b , false)
      else (t , true)) in
 g , b)
(let f' =
   fun b -> (f b , b = f b) in
 f' , b)
