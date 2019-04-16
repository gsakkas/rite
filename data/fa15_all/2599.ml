
let rec sumList xs = match xs with | [] -> [] | h::xs' -> h + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,22)-(2,76)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(2,4)-(2,78)
(2,17)-(2,76)
(2,22)-(2,76)
(2,44)-(2,46)
(2,59)-(2,76)
(2,63)-(2,76)
(2,64)-(2,71)
*)
