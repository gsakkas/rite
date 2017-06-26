
let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else digitsOfInt (n / 10);;

*)

(* changed spans
(3,48)-(3,68)
(3,61)-(3,62)
*)

(* type error slice
(3,24)-(3,68)
(3,39)-(3,42)
(3,48)-(3,68)
*)

(* all spans
(2,20)-(3,68)
(3,2)-(3,68)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,68)
(3,27)-(3,33)
(3,27)-(3,28)
(3,31)-(3,33)
(3,39)-(3,42)
(3,40)-(3,41)
(3,48)-(3,68)
(3,48)-(3,63)
(3,49)-(3,60)
(3,61)-(3,62)
(3,66)-(3,68)
*)
