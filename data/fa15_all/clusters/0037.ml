LamG VarPatG (TupleG (fromList [EmptyG]))
fun x -> (x , f x = x)
fun b ->
  (f b , if f b = b
         then true
         else false)
fun x -> (2 , f b = b)
fun bt -> (bt , f bt = bt)
fun x -> (f b , 3 < 4)
fun input ->
  (f input , f input = b)
fun b ->
  (f b , (b = f b) = false)
fun y -> (f b , b = f b)
fun x -> (f x , x <> f x)
