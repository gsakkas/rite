
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> h :: (clone t (n - 1)));;

let _ = clone 3 5;;
