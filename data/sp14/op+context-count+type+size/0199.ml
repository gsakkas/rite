
let rec clone x n = if n > 0 then x :: (clone (x (n - 1))) else [];;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,24)-(2,29)
(2,28)-(2,29)
(2,35)-(2,56)
(2,41)-(2,56)
(2,48)-(2,56)
(2,65)-(2,67)
*)

(* type error slice
(2,4)-(2,69)
(2,15)-(2,67)
(2,41)-(2,46)
(2,41)-(2,56)
(2,48)-(2,49)
(2,48)-(2,56)
*)
