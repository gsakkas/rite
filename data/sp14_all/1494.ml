
let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,46)-(3,67)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(2,4)-(3,69)
(2,15)-(3,67)
(2,17)-(3,67)
(3,3)-(3,67)
(3,31)-(3,33)
(3,46)-(3,67)
(3,48)-(3,49)
(3,50)-(3,67)
(3,51)-(3,62)
(3,52)-(3,57)
*)
