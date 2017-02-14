
let rec additivePersistence n n = additivePersistence (n mod 10);;


(* fix

let rec additivePersistence n = (additivePersistence (n mod 10)) + n;;

*)

(* changed spans
(2,31)-(2,64)
*)

(* type error slice
(2,4)-(2,67)
(2,29)-(2,64)
(2,31)-(2,64)
(2,35)-(2,54)
(2,35)-(2,64)
*)
