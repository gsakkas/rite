
let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = l then d else assoc (d, k, [t]);;


(* fix

let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = h then d else assoc (d, k, t);;

*)

(* changed spans
(5,25)-(5,26)
h
VarG

(5,52)-(5,55)
t
VarG

*)

(* type error slice
(2,4)-(5,58)
(2,16)-(5,56)
(5,16)-(5,22)
(5,16)-(5,26)
(5,25)-(5,26)
(5,39)-(5,44)
(5,39)-(5,56)
(5,45)-(5,56)
(5,52)-(5,55)
*)
