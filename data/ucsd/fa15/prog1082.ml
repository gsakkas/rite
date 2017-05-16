
let rec assoc (d,k,l) = if l = (k, d) then d;;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
