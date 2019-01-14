
let rec additivePersistence n n = additivePersistence (n mod 10);;


(* fix

let rec additivePersistence n = (additivePersistence (n mod 10)) + n;;

*)

(* changed spans
(2,30)-(2,64)
additivePersistence (n mod 10) + n
BopG (AppG (fromList [EmptyG])) VarG

*)
