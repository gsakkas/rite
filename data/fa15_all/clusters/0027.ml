LamG VarPatG (LamG EmptyPatG EmptyG)
fun r -> fun a -> fun x -> a x
fun a -> fun x -> x a
fun x -> fun a -> x a
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
fun f ->
  fun b ->
    fun b ->
      (f b , if f b = b
             then true
             else false)
fun a -> fun x -> x
EMPTY
fun i ->
  fun l ->
    if i > 0
    then bigAdd l
                (mulByDigit (i - 1) l)
    else []
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + x
fun f -> fun x -> x
fun x -> fun a -> a
