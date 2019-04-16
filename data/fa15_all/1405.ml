
let rec additivePersistence n = n = (additivePersistence (n / 10));;


(* fix

let rec additivePersistence n = (additivePersistence (n mod 10)) + n;;

*)

(* changed spans
(2,33)-(2,67)
additivePersistence (n mod 10) + n
BopG (AppG (fromList [EmptyG])) VarG

*)

(* type error slice
(2,4)-(2,69)
(2,29)-(2,67)
(2,33)-(2,34)
(2,33)-(2,67)
(2,37)-(2,67)
(2,38)-(2,57)
(2,58)-(2,66)
(2,59)-(2,60)
*)
