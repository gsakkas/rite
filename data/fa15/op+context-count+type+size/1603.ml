
let rec clone x n = if x <= 0 then [] else x @ (clone x (n - 1));;


(* fix

let rec clone x n = if x <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,44)-(2,63)
(2,46)-(2,47)
*)

(* type error slice
(2,24)-(2,25)
(2,24)-(2,30)
(2,24)-(2,30)
(2,29)-(2,30)
(2,44)-(2,45)
(2,44)-(2,63)
(2,46)-(2,47)
*)
