LamG VarPatG (IteG EmptyG EmptyG EmptyG)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
fun b' ->
  if f b' = b'
  then (b' , true)
  else (b' , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , false)
  else (f b , true)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
