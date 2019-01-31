
let rec sumList xs = if xs == [] then 0;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,21)-(2,39)
h + sumList t
BopG VarG (AppG (fromList [EmptyG]))

(2,24)-(2,32)
match xs with
| [] -> 0
| h :: t -> h + sumList t
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

*)
