
let rec clone x n = if n > 0 then x :: ((clone x n) - 1) else [];;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,39)-(2,56)
(2,49)-(2,50)
*)

(* type error slice
(2,3)-(2,66)
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,34)-(2,56)
(2,34)-(2,56)
(2,39)-(2,56)
(2,39)-(2,56)
(2,40)-(2,51)
(2,41)-(2,46)
*)
