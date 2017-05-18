
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone (x (n - 1))) @ [x]);;
