
let rec clone x n = let i = 0 in if i < n then [(clone x n) - 1; x] else [];;


(* fix

let rec clone x n = let i = 0 in if i < n then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,47)-(2,67)
(2,48)-(2,59)
(2,48)-(2,63)
(2,57)-(2,58)
(2,65)-(2,66)
*)

(* type error slice
(2,3)-(2,77)
(2,14)-(2,75)
(2,16)-(2,75)
(2,20)-(2,75)
(2,33)-(2,75)
(2,47)-(2,67)
(2,48)-(2,59)
(2,48)-(2,63)
(2,49)-(2,54)
*)
