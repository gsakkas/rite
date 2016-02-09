let rec sumList xs = match xs with
  | []     -> []
  | x::xs' -> x + sumList xs'

let _ = sumList [1;2]
