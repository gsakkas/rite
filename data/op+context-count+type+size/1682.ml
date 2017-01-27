
let rec clone x n = if n > 0 then clone [x] (n - 1) else [];;


(* fix

let rec clone x n = if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(2,41)-(2,44)
*)

(* type error slice
(2,4)-(2,62)
(2,15)-(2,60)
(2,17)-(2,60)
(2,21)-(2,60)
(2,24)-(2,25)
(2,24)-(2,29)
(2,28)-(2,29)
(2,35)-(2,40)
(2,35)-(2,51)
(2,41)-(2,44)
(2,42)-(2,43)
(2,46)-(2,51)
*)
