
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc d k t;;
