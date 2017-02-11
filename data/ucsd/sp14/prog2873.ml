
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> (clone t (n - 1)) :: h);;
