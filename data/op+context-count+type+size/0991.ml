
let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone ((x n) - 1));;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,57)-(2,73)
(2,65)-(2,68)
(2,65)-(2,73)
(2,67)-(2,68)
*)

(* type error slice
(2,4)-(2,77)
(2,15)-(2,73)
(2,57)-(2,62)
(2,57)-(2,73)
(2,65)-(2,66)
(2,65)-(2,68)
(2,65)-(2,73)
*)
