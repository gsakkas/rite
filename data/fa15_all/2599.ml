
let rec sumList xs = match xs with | [] -> [] | h::xs' -> h + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,21)-(2,75)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(2,43)-(2,45)
0
LitG

(2,71)-(2,74)
t
VarG

*)
