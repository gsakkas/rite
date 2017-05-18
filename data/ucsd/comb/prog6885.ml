
let rec assoc (d,k,l) =
  match l with | (x,y)::t when x = k -> y | h::t -> assoc d k t | _ -> (-1);;
