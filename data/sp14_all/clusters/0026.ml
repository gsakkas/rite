LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
(g , b)
let g =
  fun x ->
    (let bb = f b in
     (bb , bb = b)) in
(g , b)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
let h =
  fun x -> (f x , false) in
(h , b)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
let func =
  fun x ->
    fun x ->
      (f b , not (f b = b)) in
(func b , b)
