
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,53)-(3,67)
(3,61)-(3,62)
*)

(* type error slice
(2,4)-(3,70)
(2,15)-(3,67)
(2,17)-(3,67)
(3,3)-(3,67)
(3,46)-(3,67)
(3,46)-(3,67)
(3,53)-(3,58)
(3,53)-(3,62)
(3,53)-(3,67)
(3,53)-(3,67)
*)
