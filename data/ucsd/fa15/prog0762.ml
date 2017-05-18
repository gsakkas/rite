
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::l' -> if (h [0]) = k then h [1] else assoc (d, k, l');;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
