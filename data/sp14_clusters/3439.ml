
let rec sumList xs = let x::t = xs in x + (if t != [] then sumList t);;


(* fix

let rec sumList xs = let x::t = xs in x + (if t = [] then 0 else sumList t);;

*)

(* changed spans
(2,46)-(2,53)
t = []
BopG VarG (ListG EmptyG Nothing)

(2,59)-(2,68)
0
LitG

*)
