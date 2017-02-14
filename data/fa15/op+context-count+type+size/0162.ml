
let rec digitsOfInt n =
  if n < 0 then [] else [] @ (([n mod 10] digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,29)-(3,62)
(3,30)-(3,56)
(3,42)-(3,53)
(3,54)-(3,55)
(3,59)-(3,61)
*)

(* type error slice
(3,24)-(3,62)
(3,27)-(3,28)
(3,29)-(3,62)
(3,30)-(3,56)
(3,31)-(3,41)
*)
