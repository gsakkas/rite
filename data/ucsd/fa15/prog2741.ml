
let rec assoc (d,k,l) =
  match (d, k, l) with
  | (str,num)::t -> if str = k then num else assoc (d, k, t)
  | [] -> d;;
