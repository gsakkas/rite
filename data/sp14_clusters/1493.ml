
let rec clone x n =
  match n = 0 with | true  -> x | false  -> x @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,44)-(3,45)
x :: (clone x (n - 1))
ConAppG (Just (TupleG [VarG,AppG [VarG,BopG VarG LitG]])) Nothing

(3,46)-(3,47)
[]
ListG EmptyG Nothing

(3,58)-(3,59)
n - 1
BopG VarG LitG

*)
