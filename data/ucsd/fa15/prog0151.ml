
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc d k t;;
