
let rec sumList xs = match sumList with | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,22)-(2,66)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(2,22)-(2,66)
(2,28)-(2,35)
(2,55)-(2,66)
(2,56)-(2,63)
*)
