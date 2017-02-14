
let rec clone x n = if n <= 0 then [] else x :: (clone (n - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,50)-(2,62)
(2,57)-(2,62)
*)

(* type error slice
(2,4)-(2,66)
(2,15)-(2,62)
(2,17)-(2,62)
(2,44)-(2,62)
(2,50)-(2,55)
(2,50)-(2,62)
*)
