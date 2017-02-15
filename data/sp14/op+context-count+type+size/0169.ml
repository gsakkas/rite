
let rec clone x n = if n < 1 then [] else x :: (clone (x (n - 1)));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,47)-(2,66)
(2,54)-(2,65)
*)

(* type error slice
(2,3)-(2,68)
(2,14)-(2,66)
(2,47)-(2,66)
(2,48)-(2,53)
(2,54)-(2,65)
(2,55)-(2,56)
*)
