
let rec clone x n = let i = 0 in if i < n then x :: ((clone x n) - 1) else [];;


(* fix

let rec clone x n = let i = 0 in if i < n then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,52)-(2,69)
(2,62)-(2,63)
*)

(* type error slice
(2,3)-(2,79)
(2,14)-(2,77)
(2,16)-(2,77)
(2,20)-(2,77)
(2,33)-(2,77)
(2,47)-(2,69)
(2,47)-(2,69)
(2,52)-(2,69)
(2,52)-(2,69)
(2,53)-(2,64)
(2,54)-(2,59)
*)
