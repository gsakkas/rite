
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (d',k')::t -> if k = k' then d' else assoc (d, k, t);;

let _ = assoc ((-1), "bob", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
