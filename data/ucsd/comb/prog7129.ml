
let rec assoc (d,k,l) = match l with | [] -> d | h::t -> h;;

let _ =
  assoc ((-1), "william", [("ranjit", 84); ("william", 23); ("moose", 44)]);;
