
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
(2,41)-(2,42)
*)

(* all spans
(2,14)-(2,59)
(2,16)-(2,59)
(2,20)-(2,59)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,51)
(2,34)-(2,39)
(2,40)-(2,43)
(2,41)-(2,42)
(2,44)-(2,51)
(2,45)-(2,46)
(2,49)-(2,50)
(2,57)-(2,59)
*)
