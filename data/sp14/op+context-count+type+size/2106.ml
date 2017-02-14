
let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n > 0 then 1 + (additivePersistence help n) else 0;;


(* fix

let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n > 0 then 1 + (additivePersistence (help n)) else 0;;

*)

(* changed spans
(5,20)-(5,48)
(5,41)-(5,45)
*)

(* type error slice
(4,3)-(5,57)
(4,28)-(5,55)
(5,2)-(5,55)
(5,16)-(5,48)
(5,20)-(5,48)
(5,21)-(5,40)
*)
