
let rec digitsOfInt n =
  if n < 0 then [] else (match n mod 10 with | _ -> [digitsOfInt (n / 10)]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(3,26)-(3,75)
(3,32)-(3,33)
(3,32)-(3,40)
(3,53)-(3,75)
(3,54)-(3,73)
*)

(* type error slice
(2,4)-(3,78)
(2,21)-(3,75)
(3,3)-(3,75)
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(3,17)-(3,19)
(3,54)-(3,65)
(3,54)-(3,73)
(3,67)-(3,73)
*)
