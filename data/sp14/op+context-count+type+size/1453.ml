
let rec clone x n = if n < 1 then [] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,50)-(2,64)
(2,58)-(2,59)
*)

(* type error slice
(2,4)-(2,67)
(2,15)-(2,64)
(2,17)-(2,64)
(2,21)-(2,64)
(2,43)-(2,64)
(2,43)-(2,64)
(2,50)-(2,55)
(2,50)-(2,59)
(2,50)-(2,64)
(2,50)-(2,64)
*)
