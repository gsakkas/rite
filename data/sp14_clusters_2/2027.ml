
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone ((x n) - 1));;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,50)-(3,69)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(3,61)-(3,62)
n - 1
BopG VarG LitG

*)
