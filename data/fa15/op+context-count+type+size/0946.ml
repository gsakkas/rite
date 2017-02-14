
let rec additivePersistence n n = additivePersistence (n mod 10);;


(* fix

let rec additivePersistence n = (additivePersistence (n mod 10)) + n;;

*)

(* changed spans
(2,30)-(2,64)
*)

(* type error slice
(2,3)-(2,66)
(2,28)-(2,64)
(2,30)-(2,64)
(2,34)-(2,53)
(2,34)-(2,64)
*)
