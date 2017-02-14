
let rec clone x n =
  match n > 0 with | true  -> x :: ((clone x n) - 1) | false  -> x;;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,9)-(3,14)
(3,31)-(3,52)
(3,38)-(3,52)
(3,46)-(3,47)
(3,66)-(3,67)
*)

(* type error slice
(3,3)-(3,67)
(3,3)-(3,67)
(3,31)-(3,32)
(3,31)-(3,52)
(3,31)-(3,52)
(3,31)-(3,52)
(3,38)-(3,52)
(3,66)-(3,67)
*)
