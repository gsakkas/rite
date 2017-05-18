
let rec assoc (d,k,l) =
  match (d, k, l) with | (k,_) -> d | h::t -> assoc (d, k, t) | _ -> d;;
