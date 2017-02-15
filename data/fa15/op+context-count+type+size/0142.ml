
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: ([] @ [n mod 10]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,46)
(3,24)-(3,67)
(3,25)-(3,36)
(3,37)-(3,45)
(3,38)-(3,39)
(3,42)-(3,44)
(3,57)-(3,65)
*)

(* type error slice
(2,3)-(3,69)
(2,20)-(3,67)
(3,2)-(3,67)
(3,24)-(3,46)
(3,24)-(3,67)
(3,24)-(3,67)
(3,25)-(3,36)
*)
