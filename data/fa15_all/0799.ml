
let rec sumList xs = if xs == [] then 0;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,22)-(2,40)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(2,22)-(2,40)
(2,39)-(2,40)
(2,40)-(2,40)
*)
