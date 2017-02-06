
let rec clone x n = let i = 0 in if i < n then [(clone x n) - 1; x] else [];;


(* fix

let rec clone x n = let i = 0 in if i < n then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,48)-(2,68)
(2,50)-(2,59)
(2,50)-(2,64)
(2,58)-(2,59)
(2,66)-(2,67)
*)

(* type error slice
(2,15)-(2,76)
(2,17)-(2,76)
(2,41)-(2,42)
(2,50)-(2,55)
(2,50)-(2,59)
(2,50)-(2,59)
(2,56)-(2,57)
(2,66)-(2,67)
(2,74)-(2,76)
*)
