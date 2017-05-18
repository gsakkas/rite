
let rec assoc (d,k,l) =
  match (d, k, l) with
  | (ki,vi::t) -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;
