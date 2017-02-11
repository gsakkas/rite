
let rec assoc (d,k,l) =
  match l with | [] -> d | h::t -> if k = h then 10 else assoc (d, k, t);;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
