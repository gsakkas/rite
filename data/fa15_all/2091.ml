
let rec clone x n = if n = 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,42)-(2,53)
x
VarG

(2,42)-(2,57)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(2,51)-(2,52)
n - 1
BopG VarG LitG

*)
