
let rec clone x n =
  match n > 0 with | true  -> x :: ((clone x n) - 1) | false  -> x;;



let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;


(* changed spans
(3,11)-(3,12)
(3,37)-(3,38)
(3,47)-(3,48)
(3,54)-(3,67)
*)

(* type error slice
(3,31)-(3,52)
*)
