
let rec assoc (d,k,l) =
  match k with
  | [] -> d
  | (k',d')::t -> if k = k' then d' else assoc (d, k, t);;
