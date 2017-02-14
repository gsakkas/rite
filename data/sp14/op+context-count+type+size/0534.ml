
let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,46)-(3,66)
(3,48)-(3,49)
(3,52)-(3,66)
(3,60)-(3,61)
*)

(* type error slice
(2,4)-(3,69)
(2,15)-(3,66)
(2,17)-(3,66)
(3,3)-(3,66)
(3,31)-(3,33)
(3,46)-(3,66)
(3,48)-(3,49)
(3,52)-(3,57)
(3,52)-(3,61)
(3,52)-(3,66)
(3,52)-(3,66)
*)
