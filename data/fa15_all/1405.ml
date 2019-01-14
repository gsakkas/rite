
let rec additivePersistence n = n = (additivePersistence (n / 10));;


(* fix

let rec additivePersistence n = (additivePersistence (n mod 10)) + n;;

*)

(* changed spans
(2,32)-(2,33)
additivePersistence (n mod 10) + n
BopG (AppG (fromList [EmptyG])) VarG

(2,57)-(2,65)
n mod 10
BopG VarG LitG

*)
