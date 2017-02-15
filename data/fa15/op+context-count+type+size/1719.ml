
let rec clone x n = if n = 0 then [] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,47)-(2,64)
(2,57)-(2,58)
*)

(* type error slice
(2,3)-(2,66)
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,42)-(2,64)
(2,42)-(2,64)
(2,47)-(2,64)
(2,47)-(2,64)
(2,48)-(2,59)
(2,49)-(2,54)
*)
