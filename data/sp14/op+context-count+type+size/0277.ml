
let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,29)-(5,61)
(5,30)-(5,50)
(5,52)-(5,60)
*)

(* type error slice
(2,3)-(5,63)
(2,20)-(5,61)
(3,2)-(5,61)
(5,7)-(5,61)
(5,29)-(5,61)
(5,29)-(5,61)
(5,30)-(5,41)
(5,30)-(5,50)
*)
