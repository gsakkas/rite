
let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if [(k, d)] = h then d else assoc (d, k, t);;
