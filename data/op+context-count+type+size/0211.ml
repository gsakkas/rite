
let rec clone x n = if n > 0 then x :: (clone (x (n - 1))) else [];;



let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;


(* changed spans
(2,26)-(2,29)
(2,47)-(2,48)
(2,58)-(2,67)
*)

(* type error slice
(2,41)-(2,56)
*)
