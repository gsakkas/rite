
let rec assoc (d,k,l) =
  match l with
  | [] -> raise Not_found
  | (s,i)::tl -> if s = k then (s, i) else assoc (d, k, tl);;

let _ = assoc ((-1), "william", ["ranjit"; "william"; "moose"]);;
