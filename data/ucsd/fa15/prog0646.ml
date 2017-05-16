
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t ->
      (match h with | (name,num) -> if name = d then num else assoc (d, k, t));;

let _ = assoc ((-1), "bob", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
