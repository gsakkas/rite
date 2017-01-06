
let rec clone x n = if n < 1 then [] else x :: (clone (x (n - 1)));;



let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;


(* changed spans
(2,55)-(2,56)
(2,66)-(2,67)
*)

(* type error slice
(2,49)-(2,64)
*)
