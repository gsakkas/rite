
let rec assoc (d,k,l) =
  match l with
  | [] -> []
  | (num,name)::tail ->
      if (num, name) = (d, k) then name else assoc (d, k, tail);;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
