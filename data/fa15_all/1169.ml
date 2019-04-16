
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
(3,9)-(3,10)
l
VarG

*)

(* type error slice
(3,3)-(5,57)
(3,9)-(3,10)
(5,22)-(5,23)
(5,22)-(5,28)
(5,26)-(5,28)
*)
