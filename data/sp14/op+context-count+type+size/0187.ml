
let rec digitsOfInt n =
  if n <= 0 then [] else ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,47)
(3,39)-(3,40)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,17)-(3,19)
(3,25)-(3,47)
(3,25)-(3,47)
(3,25)-(3,60)
(3,26)-(3,41)
(3,27)-(3,38)
(3,48)-(3,49)
*)
