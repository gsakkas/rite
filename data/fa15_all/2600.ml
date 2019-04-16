
let rec sumList xs = match xs with | o -> o | h::xs' -> h + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,22)-(2,74)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(2,4)-(2,76)
(2,17)-(2,74)
(2,22)-(2,74)
(2,43)-(2,44)
(2,57)-(2,74)
(2,61)-(2,74)
(2,62)-(2,69)
*)
