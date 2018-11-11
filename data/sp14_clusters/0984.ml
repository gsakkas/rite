
let rec clone x n = if n > 0 then x @ ((clone x n) - 1) else [];;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
n < 1
BopG VarG LitG

(2,34)-(2,35)
x :: (clone x (n - 1))
ConAppG (Just (TupleG [VarG,AppG [VarG,BopG VarG LitG]])) Nothing

(2,34)-(2,35)
[]
ListG EmptyG Nothing

(2,36)-(2,37)
1
LitG

(2,48)-(2,49)
n - 1
BopG VarG LitG

*)
