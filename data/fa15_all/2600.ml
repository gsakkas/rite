
let rec sumList xs = match xs with | o -> o | h::xs' -> h + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,21)-(2,73)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(2,42)-(2,43)
0
LitG

(2,69)-(2,72)
t
VarG

*)
