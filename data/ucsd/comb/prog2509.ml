
let rec bssoc (d,k,l) =
  match l with | [] -> (-1) | h::t -> if (k, d) = h then d;;
