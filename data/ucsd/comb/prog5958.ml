
let rec assoc (d,k,l) =
  match l with | [] -> d | (x,y)::l -> if k = x then y else assoc (d, k, y);;
