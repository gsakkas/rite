
let rec sumList xs = function | [] -> 0 | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,22)-(2,66)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(2,4)-(2,68)
(2,17)-(2,66)
(2,22)-(2,66)
(2,51)-(2,66)
(2,55)-(2,66)
(2,56)-(2,63)
*)
