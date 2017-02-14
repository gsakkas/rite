
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
(6,32)-(6,52)
(6,32)-(6,52)
(6,47)-(6,52)
*)
