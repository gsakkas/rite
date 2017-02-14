
let rec clone x n = if n <= 0 then [] else x :: (clone (x, (n - 1)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,50)-(2,66)
(2,57)-(2,66)
*)

(* type error slice
(2,4)-(2,71)
(2,15)-(2,66)
(2,50)-(2,55)
(2,50)-(2,66)
(2,57)-(2,58)
(2,57)-(2,66)
*)
