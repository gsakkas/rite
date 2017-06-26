
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10)] @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,5)-(3,10)
(3,24)-(3,46)
*)

(* type error slice
(2,3)-(3,61)
(2,20)-(3,59)
(3,2)-(3,59)
(3,24)-(3,46)
(3,24)-(3,59)
(3,25)-(3,36)
(3,25)-(3,45)
(3,47)-(3,48)
*)

(* all spans
(2,20)-(3,59)
(3,2)-(3,59)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,59)
(3,47)-(3,48)
(3,24)-(3,46)
(3,25)-(3,45)
(3,25)-(3,36)
(3,37)-(3,45)
(3,38)-(3,39)
(3,42)-(3,44)
(3,49)-(3,59)
(3,50)-(3,58)
(3,50)-(3,51)
(3,56)-(3,58)
*)
