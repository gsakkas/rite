
let rec clone x n = if n > 0 then x :: ((clone x n) - 1) else [];;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,42)-(2,56)
(2,50)-(2,51)
*)

(* type error slice
(2,4)-(2,67)
(2,15)-(2,65)
(2,17)-(2,65)
(2,21)-(2,65)
(2,35)-(2,56)
(2,35)-(2,56)
(2,42)-(2,47)
(2,42)-(2,51)
(2,42)-(2,56)
(2,42)-(2,56)
*)
