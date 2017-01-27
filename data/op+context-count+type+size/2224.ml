
let rec digitsOfInt n =
  if n <= 0 then [] else ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,28)-(3,47)
(3,40)-(3,41)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,6)-(3,7)
(3,6)-(3,12)
(3,11)-(3,12)
(3,18)-(3,20)
(3,28)-(3,39)
(3,28)-(3,41)
(3,28)-(3,47)
(3,28)-(3,61)
(3,40)-(3,41)
(3,49)-(3,50)
(3,51)-(3,61)
(3,52)-(3,60)
*)
