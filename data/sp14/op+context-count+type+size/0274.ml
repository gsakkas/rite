
let rec digitsOfInt n =
  if n < 0 then [] else (match n mod 10 with | _ -> [digitsOfInt (n / 10)]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(3,24)-(3,75)
(3,31)-(3,32)
(3,31)-(3,39)
(3,52)-(3,74)
(3,53)-(3,73)
*)

(* type error slice
(2,3)-(3,77)
(2,20)-(3,75)
(3,2)-(3,75)
(3,24)-(3,75)
(3,52)-(3,74)
(3,52)-(3,74)
(3,53)-(3,64)
(3,53)-(3,73)
*)
