
let rec clone x n =
  match n > 0 with | true  -> x :: ((clone x n) - 1) | false  -> x;;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,8)-(3,13)
n = 0
BopG VarG LitG

(3,30)-(3,52)
[]
ListG EmptyG Nothing

(3,45)-(3,46)
n - 1
BopG VarG LitG

*)
