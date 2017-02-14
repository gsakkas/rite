
let rec clone x n = if n = 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,44)-(2,53)
(2,44)-(2,58)
(2,52)-(2,53)
*)

(* type error slice
(2,4)-(2,60)
(2,15)-(2,58)
(2,17)-(2,58)
(2,21)-(2,58)
(2,21)-(2,58)
(2,35)-(2,37)
(2,44)-(2,49)
(2,44)-(2,53)
(2,44)-(2,58)
(2,44)-(2,58)
*)
