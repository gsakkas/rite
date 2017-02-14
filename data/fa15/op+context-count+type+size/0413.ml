
let rec clone x n = if n <= 0 then [] else [x] :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,44)-(2,47)
(2,53)-(2,67)
(2,61)-(2,62)
*)

(* type error slice
(2,4)-(2,70)
(2,15)-(2,67)
(2,17)-(2,67)
(2,21)-(2,67)
(2,44)-(2,67)
(2,44)-(2,67)
(2,53)-(2,58)
(2,53)-(2,62)
(2,53)-(2,67)
(2,53)-(2,67)
*)
