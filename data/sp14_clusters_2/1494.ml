
let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,47)-(3,48)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(3,59)-(3,60)
n - 1
BopG VarG LitG

*)
