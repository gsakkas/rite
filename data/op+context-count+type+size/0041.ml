
let rec clone x n = let i = 0 in if i < n then [(clone x n) - 1; x] else [];;



let rec clone x n = let i = 0 in if i < n then x :: (clone x (n - 1)) else [];;


(* changed spans
(2,48)-(2,49)
(2,59)-(2,60)
(2,64)-(2,68)
*)

(* type error slice
(2,50)-(2,59)
*)
