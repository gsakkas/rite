
let rec clone x n =
  match n <= 0 with | true  -> [] | false  -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n <= 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,52)-(3,69)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(3,71)
(2,15)-(3,69)
(2,17)-(3,69)
(3,3)-(3,69)
(3,47)-(3,69)
(3,52)-(3,69)
(3,53)-(3,64)
(3,54)-(3,59)
*)
