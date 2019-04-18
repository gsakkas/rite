TupleG (fromList [VarG,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG])
(let d =
   fun x ->
     (let xx = f b in
      (xx , xx = b)) in
 d , b)
(let f =
   fun x ->
     (let xx = (x * x) * x in
      (xx , xx < 100)) in
 f , b)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
