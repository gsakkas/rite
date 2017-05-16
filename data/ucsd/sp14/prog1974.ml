
let rec assoc (d,k,l) =
  match l with | [] -> d | (s,i)::t -> if s = k then true else assoc d k t;;
