
let rec assoc (d,k,l) =
  match k with | [] -> d | h::t -> if k = l then l else assoc (d, k, t);;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
