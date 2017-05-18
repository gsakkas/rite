
let rec assoc (d,k,l) =
  match l with
  | [] -> 0
  | h::t -> (match h with | hd::tl -> if hd = k then assoc (d, k, t) else d);;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
