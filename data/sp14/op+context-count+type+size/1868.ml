
let rec clone x n = if n <= 0 then [] else n :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else n :: (clone x (n - 1));;

*)

(* changed spans
(2,51)-(2,65)
(2,59)-(2,60)
*)

(* type error slice
(2,4)-(2,68)
(2,15)-(2,65)
(2,17)-(2,65)
(2,21)-(2,65)
(2,44)-(2,65)
(2,44)-(2,65)
(2,51)-(2,56)
(2,51)-(2,60)
(2,51)-(2,65)
(2,51)-(2,65)
*)
