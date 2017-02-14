
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone ((x n) - 1));;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,52)-(3,68)
(3,60)-(3,63)
(3,60)-(3,68)
(3,62)-(3,63)
*)

(* type error slice
(2,4)-(3,72)
(2,15)-(3,68)
(3,52)-(3,57)
(3,52)-(3,68)
(3,60)-(3,61)
(3,60)-(3,63)
(3,60)-(3,68)
*)
