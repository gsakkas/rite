
let rec sumList xs = let x::t = xs in if t != [] then x + (sumList t);;


(* fix

let rec sumList xs = let x::t = xs in x + (if t = [] then 0 else sumList t);;

*)

(* changed spans
(2,38)-(2,69)
x
VarG

(2,38)-(2,69)
x + (if t = []
     then 0
     else sumList t)
BopG VarG (IteG EmptyG EmptyG EmptyG)

(2,41)-(2,48)
t = []
BopG VarG (ListG EmptyG Nothing)

(2,54)-(2,55)
0
LitG

*)
