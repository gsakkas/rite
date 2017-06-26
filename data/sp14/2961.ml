
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
(5,20)-(5,48)
(5,21)-(5,40)
(5,54)-(5,55)
*)

(* all spans
(2,13)-(2,66)
(2,17)-(2,66)
(2,20)-(2,25)
(2,20)-(2,21)
(2,24)-(2,25)
(2,31)-(2,59)
(2,31)-(2,41)
(2,32)-(2,33)
(2,38)-(2,40)
(2,44)-(2,59)
(2,45)-(2,49)
(2,50)-(2,58)
(2,51)-(2,52)
(2,55)-(2,57)
(2,65)-(2,66)
(4,28)-(5,55)
(5,2)-(5,55)
(5,5)-(5,10)
(5,5)-(5,6)
(5,9)-(5,10)
(5,16)-(5,48)
(5,16)-(5,17)
(5,20)-(5,48)
(5,21)-(5,40)
(5,41)-(5,45)
(5,46)-(5,47)
(5,54)-(5,55)
*)
