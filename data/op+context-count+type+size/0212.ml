
let rec clone x n = if n > 0 then x :: (clone ((x n) - 1)) else x;;



let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;


(* changed spans
(2,26)-(2,29)
(2,47)-(2,49)
(2,52)-(2,53)
(2,60)-(2,66)
*)

(* type error slice
(2,21)-(2,66)
(2,49)-(2,52)
*)
