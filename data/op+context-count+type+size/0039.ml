
let rec clone x n = let i = 0 in if i < n then x :: ((clone x n) - 1) else [];;


(* fix

let rec clone x n = let i = 0 in if i < n then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,55)-(2,69)
(2,63)-(2,64)
*)

(* type error slice
(2,4)-(2,80)
(2,15)-(2,78)
(2,17)-(2,78)
(2,21)-(2,78)
(2,34)-(2,78)
(2,48)-(2,69)
(2,48)-(2,69)
(2,55)-(2,60)
(2,55)-(2,64)
(2,55)-(2,69)
(2,55)-(2,69)
*)
