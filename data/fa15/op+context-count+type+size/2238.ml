
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | h::t -> h + (digitsOfInt t));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,69)
(3,32)-(3,33)
(3,49)-(3,50)
(3,49)-(3,68)
(3,53)-(3,68)
(3,66)-(3,67)
*)

(* type error slice
(3,2)-(3,69)
(3,2)-(3,69)
(3,5)-(3,6)
(3,5)-(3,11)
(3,5)-(3,11)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,69)
(3,25)-(3,69)
(3,25)-(3,69)
(3,32)-(3,33)
(3,49)-(3,68)
*)
