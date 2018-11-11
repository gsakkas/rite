
let rec clone x n = let i = 0 in if i < n then [(clone x n) - 1; x] else [];;


(* fix

let rec clone x n = let i = 0 in if i < n then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,48)-(2,59)
x
VarG

(2,48)-(2,63)
x :: (clone x (n - 1))
ConAppG (Just (TupleG [VarG,AppG [VarG,BopG VarG LitG]])) Nothing

(2,57)-(2,58)
n - 1
BopG VarG LitG

*)
