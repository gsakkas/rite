
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | [] -> [] | h::t -> h @ [digitsOfInt t]);;
