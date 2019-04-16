LetG Rec (fromList [(VarPatG,LamG (TuplePatG (fromList [EmptyPatG])) EmptyG)]) (AppG (fromList [EmptyG]))
let rec cloneHelper =
  fun (x , n , acc) ->
    if n < 0
    then acc
    else cloneHelper (x , n - 1 , x :: acc) in
cloneHelper (x , n , [])
let rec helper =
  fun (f , b) ->
    (let b' = f b in
     if b' = b
     then b'
     else helper (f , b')) in
helper (f , b)
