LamG (TuplePatG (fromList [VarPatG])) (IteG EmptyG EmptyG EmptyG)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
