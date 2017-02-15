
let rec clone x n = if n <= 0 then [] else [x] :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,43)-(2,46)
(2,50)-(2,67)
(2,60)-(2,61)
*)

(* type error slice
(2,3)-(2,69)
(2,14)-(2,67)
(2,16)-(2,67)
(2,20)-(2,67)
(2,43)-(2,67)
(2,43)-(2,67)
(2,50)-(2,67)
(2,50)-(2,67)
(2,51)-(2,62)
(2,52)-(2,57)
*)
