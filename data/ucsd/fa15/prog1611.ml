
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let f::e = h in if f = k then e else assoc d k t;;
