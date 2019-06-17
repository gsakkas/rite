LamG VarPatG (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)
fun b ->
  (let self = f b in
   match b with
   | self -> (self , false)
   | _ -> (self , true))
fun x ->
  (let bb = f x in
   (bb , bb = x))
fun x ->
  (let xi = f x in
   (xi , (f xi <> xi) || f (f xi)))
fun b' ->
  (let fOfB = f' b' in
   (fOfB , fOfB = b'))
fun z ->
  (let b = f z in (b , b <> z))
fun x ->
  (let y = f x in (y , y <> x))
