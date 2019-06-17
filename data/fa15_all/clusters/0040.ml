LamG VarPatG (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)
fun b ->
  (let result = f b in
   if result = b
   then (result , false)
   else (result , true))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun b' ->
  (let x = f b' in
   (x , b' <> x))
fun x ->
  (let (a1 , a2) = a in
   let val1 = (x * i) + a1 in
   if val1 > 9
   then (val1 / 10 , (val1 mod 10) :: a2)
   else (0 , val1 :: a2))
EMPTY
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
