
let rec assoc (d,k,l) =
  match k with | [] -> d | h::t -> if k = h then v else assoc (d, k, t);;
