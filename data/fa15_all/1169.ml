
let rec assoc (d,k,l) =
  match k with
  | [] -> d
  | (k',d')::t -> if k = k' then d' else assoc (d, k, t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (k',d')::t -> if k = k' then d' else assoc (d, k, t);;

*)

(* changed spans
(3,8)-(3,9)
l
VarG

*)
