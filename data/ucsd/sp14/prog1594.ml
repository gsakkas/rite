
let rec assoc (d,k,l) =
  match l with
  | [] -> (-1)
  | (s,i)::tl -> if s = k then (s, i) else assoc (d, k, tl);;
