
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
(3,24)-(3,46)
(3,24)-(3,59)
(3,25)-(3,36)
(3,25)-(3,45)
(3,47)-(3,48)
*)
