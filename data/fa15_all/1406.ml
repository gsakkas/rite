
let rec additivePersistence n n = additivePersistence (n mod 10);;


(* fix

let rec additivePersistence n = (additivePersistence (n mod 10)) + n;;

*)

(* changed spans
(2,31)-(2,65)
additivePersistence (n mod 10) + n
BopG (AppG (fromList [EmptyG])) VarG

*)

(* type error slice
(2,4)-(2,67)
(2,29)-(2,65)
(2,31)-(2,65)
(2,35)-(2,54)
(2,35)-(2,65)
*)
