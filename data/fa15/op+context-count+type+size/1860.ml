
let rec clone x n = match n with | 0 -> [] | n -> x :: (clone (x (n - 1)));;


(* fix

let rec clone x n = match n with | 0 -> [] | n -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,55)-(2,74)
(2,62)-(2,73)
*)

(* type error slice
(2,3)-(2,76)
(2,14)-(2,74)
(2,55)-(2,74)
(2,56)-(2,61)
(2,62)-(2,73)
(2,63)-(2,64)
*)
