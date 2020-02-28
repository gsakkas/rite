
let rec clone x n = if n > 0 then clone [x] (n - 1) else [];;


(* fix

let rec clone x n = if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(2,41)-(2,44)
x
VarG

*)

(* type error slice
(2,4)-(2,62)
(2,15)-(2,60)
(2,35)-(2,40)
(2,35)-(2,52)
(2,41)-(2,44)
(2,42)-(2,43)
*)
