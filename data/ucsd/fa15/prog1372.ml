
let rec assoc (d,k,l) =
  match l with | [] -> [] | h::t -> if h = k then t else d;;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
