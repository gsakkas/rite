
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if k = a then a else assoc (d, k, t);;

let _ = assoc ((-1), "bob", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
