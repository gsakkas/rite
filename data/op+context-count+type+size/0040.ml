
let rec clone x n = let i = 0 in if i < n then x :: ((clone x n) - 1) else [];;



let rec clone x n = let i = 0 in if i < n then x :: (clone x (n - 1)) else [];;


(* changed spans
(2,54)-(2,55)
(2,64)-(2,65)
*)

(* type error slice
(2,48)-(2,69)
*)
