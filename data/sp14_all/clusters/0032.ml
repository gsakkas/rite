LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = fun n -> 0 in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
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
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun b' ->
  (let fOfB = f' b' in
   (fOfB , fOfB = b'))
fun num ->
  (let f =
     fun a -> fun x -> x a in
   let base = num in
   List.fold_left f base fs)
fun p ->
  (let f =
     fun a -> fun x -> x a in
   let base = p in
   List.fold_left f base fs)
fun z ->
  (let b = f z in (b , b <> z))
fun x ->
  (let y = f x in (y , y <> x))
