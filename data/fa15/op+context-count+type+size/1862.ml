
let rec clone x n = match n with | 0 -> [] | n -> x :: (clone (x (n - 1)));;


(* fix

let rec clone x n = match n with | 0 -> [] | n -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,57)-(2,72)
(2,64)-(2,72)
*)

(* type error slice
(2,4)-(2,77)
(2,15)-(2,72)
(2,57)-(2,62)
(2,57)-(2,72)
(2,64)-(2,65)
(2,64)-(2,72)
*)
