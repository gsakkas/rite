
let rec additivePersistence n = n = (additivePersistence (n / 10));;


(* fix

let rec additivePersistence n = (additivePersistence (n mod 10)) + n;;

*)

(* changed spans
(2,32)-(2,33)
(2,32)-(2,66)
(2,57)-(2,65)
*)

(* type error slice
(2,3)-(2,68)
(2,28)-(2,66)
(2,32)-(2,33)
(2,32)-(2,66)
(2,36)-(2,66)
(2,37)-(2,56)
(2,57)-(2,65)
(2,58)-(2,59)
*)

(* all spans
(2,28)-(2,66)
(2,32)-(2,66)
(2,32)-(2,33)
(2,36)-(2,66)
(2,37)-(2,56)
(2,57)-(2,65)
(2,58)-(2,59)
(2,62)-(2,64)
*)
