
let rec digitsOfInt n =
  if n < 0 then [] else ((digitsOfInt n) / 10) @ ([] @ [n mod 10]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,47)
[]
ListG []

(3,50)-(3,67)
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(3,69)
(2,21)-(3,67)
(3,3)-(3,67)
(3,25)-(3,47)
(3,25)-(3,67)
(3,26)-(3,41)
(3,27)-(3,38)
(3,48)-(3,49)
*)
