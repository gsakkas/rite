
let rec clone x n =
  match n > 0 with | true  -> x @ ((clone x n) - 1) | false  -> x @ [];;



let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;


(* changed spans
(3,11)-(3,12)
(3,33)-(3,36)
(3,46)-(3,47)
(3,53)-(3,71)
*)

(* type error slice
(3,31)-(3,51)
*)
