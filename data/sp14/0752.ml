
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,41)-(3,51)
*)

(* type error slice
(3,16)-(3,51)
(3,39)-(3,40)
(3,41)-(3,51)
*)

(* all spans
(2,20)-(3,59)
(3,2)-(3,59)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,51)
(3,39)-(3,40)
(3,16)-(3,38)
(3,17)-(3,28)
(3,29)-(3,37)
(3,30)-(3,31)
(3,34)-(3,36)
(3,41)-(3,51)
(3,42)-(3,43)
(3,48)-(3,50)
(3,57)-(3,59)
*)
