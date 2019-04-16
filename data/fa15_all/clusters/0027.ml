LamG VarPatG (LamG VarPatG EmptyG)
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
fun i ->
  fun l ->
    if i > 0
    then bigAdd l
                (mulByDigit (i - 1) l)
    else []
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun a -> fun x -> a + (x * x)
fun f -> fun x -> x
fun x -> fun a -> a
