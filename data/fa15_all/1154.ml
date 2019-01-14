
let rec clone x n = if n > 1 then x @ (clone x (n - 1));;


(* fix

let rec clone x n = x :: (clone x (n - 1));;

*)

(* changed spans
(2,36)-(2,37)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

*)
