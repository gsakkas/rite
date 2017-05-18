
let rec assoc n (d,k,l) =
  match l with | x::l -> if n <= 0 then x else assoc (n - 1) l;;
