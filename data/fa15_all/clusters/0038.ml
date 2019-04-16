LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))
let g =
  fun b ->
    (f b , if f b = b
           then false
           else true) in
(g , b)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
let h =
  fun x -> (f x , f x = x) in
(h , b)
let g =
  fun x ->
    match f x with
    | x -> (x , false)
    | y -> (y , true) in
(g , b)
let g =
  fun x ->
    (let calcfx = f x in
     (calcfx , calcfx = x)) in
(g , b)
let g =
  fun x ->
    (let calcx = f x in
     (calcx , calcx = x)) in
(g , b)
