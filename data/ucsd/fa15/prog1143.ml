
let rec assoc (d,k,l) =
  match k with
  | [] -> d
  | (k',d')::t -> if k = ((k', d') :: t) then d' else assoc (d, k, t);;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
