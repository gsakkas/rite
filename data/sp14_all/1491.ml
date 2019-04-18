
let rec clone x n =
  match n > 0 with | true  -> x @ ((clone x n) - 1) | false  -> x @ [];;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,9)-(3,14)
n = 0
BopG VarG LitG

(3,31)-(3,52)
[]
ListG (fromList [])

(3,65)-(3,71)
x :: (clone x (n - 1))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,73)
(2,15)-(3,71)
(2,17)-(3,71)
(3,3)-(3,71)
(3,31)-(3,52)
(3,33)-(3,34)
(3,35)-(3,52)
(3,36)-(3,47)
(3,37)-(3,42)
(3,65)-(3,71)
(3,67)-(3,68)
*)
