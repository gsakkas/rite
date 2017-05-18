
let rec assoc (d,k,l) = match l with | [] -> d | h::t -> h;;

let _ = assoc ((-1), "bob", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
