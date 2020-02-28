
let rec digitsOfInt n =
  if n > 0 then [] else ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,47)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(3,62)
(2,21)-(3,60)
(3,3)-(3,60)
(3,25)-(3,47)
(3,25)-(3,60)
(3,26)-(3,41)
(3,27)-(3,38)
(3,48)-(3,49)
*)
