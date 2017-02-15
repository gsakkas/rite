
let rec clone x n = if x <= 0 then [] else x @ (clone x (n - 1));;


(* fix

let rec clone x n = if x <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,43)-(2,64)
(2,45)-(2,46)
*)

(* type error slice
(2,23)-(2,24)
(2,23)-(2,29)
(2,23)-(2,29)
(2,28)-(2,29)
(2,43)-(2,44)
(2,43)-(2,64)
(2,45)-(2,46)
*)
