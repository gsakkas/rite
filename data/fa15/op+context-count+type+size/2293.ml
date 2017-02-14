
let rec clone x n =
  match n <= 0 with | true  -> [] | false  -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  match n <= 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,54)-(3,68)
(3,62)-(3,63)
*)

(* type error slice
(2,4)-(3,71)
(2,15)-(3,68)
(2,17)-(3,68)
(3,3)-(3,68)
(3,47)-(3,68)
(3,47)-(3,68)
(3,54)-(3,59)
(3,54)-(3,63)
(3,54)-(3,68)
(3,54)-(3,68)
*)
