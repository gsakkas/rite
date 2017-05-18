
let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = l then d else assoc (d, k, l);;

let _ = assoc ((-1), "bob", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
