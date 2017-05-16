
let rec assoc (d,k,l) =
  match l with | [] -> 0 | h::t -> if h = k then assoc (d, k, t) else d;;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
