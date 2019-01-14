
let rec clone x n = if n = 1 then [] @ x else (clone x) @ ((x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
n <= 0
BopG VarG LitG

(2,37)-(2,38)
0
LitG

(2,39)-(2,40)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

*)
