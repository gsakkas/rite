
let rec clone x n = if n = 0 then [] else x :: (clone ((x n) - 1));;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,49)-(2,65)
(2,57)-(2,60)
(2,57)-(2,65)
(2,59)-(2,60)
*)

(* type error slice
(2,4)-(2,69)
(2,15)-(2,65)
(2,49)-(2,54)
(2,49)-(2,65)
(2,57)-(2,58)
(2,57)-(2,60)
(2,57)-(2,65)
*)
