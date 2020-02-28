LamG VarPatG (IteG EmptyG EmptyG EmptyG)
fun b ->
  if f b
  then (b , true)
  else (b , false)
EMPTY
fun b ->
  if f b = b
  then (b , true)
  else (f b , false)
fun x ->
  if f x = b
  then (b , true)
  else (f x , false)
fun b' ->
  if f b' = b'
  then (f b' , false)
  else (f b' , true)
