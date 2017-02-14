
let rec clone x n = if n > 0 then clone [x] (n - 1) else [];;


(* fix

let rec clone x n = if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(2,40)-(2,43)
*)

(* type error slice
(2,3)-(2,61)
(2,14)-(2,59)
(2,34)-(2,39)
(2,34)-(2,51)
(2,40)-(2,43)
(2,40)-(2,43)
(2,41)-(2,42)
*)
