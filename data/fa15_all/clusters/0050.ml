LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
fun b ->
  (let result = f b in
   if result = b
   then (result , false)
   else (result , true))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun b ->
  (let f =
     fun a -> fun x -> x a in
   let base = b in
   List.fold_left f base fs)
fun b' ->
  (let x = f b' in
   (x , b' <> x))
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun x ->
  (let b' = f b in
   (b' , b' = b))
fun func ->
  (let result = f b in
   (result , result = b))
fun b' ->
  (let result = f b' in
   (result , result = b'))
fun b ->
  (let fb = f b in
   if fb = b
   then (true , fb)
   else (false , fb))
fun fixb ->
  (let b = f b in
   (b , fixb <> b))
