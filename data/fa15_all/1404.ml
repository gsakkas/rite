
let rec additivePersistence n =
  n = ((n mod 10) + (additivePersistence (n / 10)));;


(* fix

let rec additivePersistence n = (additivePersistence (n mod 10)) + n;;

*)

(* changed spans
(3,3)-(3,52)
additivePersistence (n mod 10) + n
BopG (AppG (fromList [EmptyG])) VarG

*)

(* type error slice
(2,4)-(3,54)
(2,29)-(3,52)
(3,3)-(3,52)
(3,7)-(3,52)
(3,21)-(3,51)
(3,22)-(3,41)
*)
