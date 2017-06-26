
let count = 0;;

let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then count;;


(* fix

let count = 0;;

let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then count else 8;;

*)

(* changed spans
(6,32)-(6,52)
*)

(* type error slice
(2,3)-(2,15)
(2,12)-(2,13)
(6,32)-(6,52)
(6,47)-(6,52)
*)

(* all spans
(2,12)-(2,13)
(4,9)-(4,19)
(4,13)-(4,19)
(4,13)-(4,14)
(4,17)-(4,19)
(6,28)-(6,52)
(6,32)-(6,52)
(6,35)-(6,41)
(6,35)-(6,39)
(6,40)-(6,41)
(6,47)-(6,52)
*)
