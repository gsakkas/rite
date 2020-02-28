
let count = 0;;

let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then count;;


(* fix

let count = 0;;

let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then count else 8;;

*)

(* changed spans
(6,53)-(6,53)
8
LitG

*)

(* type error slice
(2,4)-(2,16)
(2,13)-(2,14)
(6,33)-(6,53)
(6,48)-(6,53)
(6,53)-(6,53)
*)
