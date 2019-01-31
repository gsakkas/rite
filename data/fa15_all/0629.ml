
let rec clone x n n = List.append (clone x (n - 1)) [x];;


(* fix

let rec clone x n = x :: (clone x (n - 1));;

*)

(* changed spans
(2,22)-(2,33)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(2,34)-(2,51)
x
VarG

*)
