
let rec filter l a =
  match l with
  | [] -> []
  | h::t -> if a = h then filter t else h :: (filter t);;
