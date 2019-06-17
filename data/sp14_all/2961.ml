
let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n > 0 then 1 + (additivePersistence help n) else 0;;


(* fix

let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n > 0 then 1 + (additivePersistence (help n)) else 0;;

*)

(* changed spans
(5,21)-(5,49)
additivePersistence (help n)
AppG [AppG [EmptyG]]

*)

(* type error slice
(4,4)-(5,58)
(4,29)-(5,56)
(5,3)-(5,56)
(5,21)-(5,49)
(5,22)-(5,41)
(5,55)-(5,56)
*)
