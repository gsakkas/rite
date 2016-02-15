let rec sumList xs = match xs with
  | []    -> []
  | y::ys -> y + sumList ys

let _ = sumList [1;2]
