
let rec digitsOfInt n =
  if n < 0 then [] else ((digitsOfInt n) / 10) @ ([] @ [n mod 10]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,46)
(3,25)-(3,40)
(3,26)-(3,37)
(3,38)-(3,39)
(3,49)-(3,66)
*)

(* type error slice
(2,3)-(3,68)
(2,20)-(3,66)
(3,2)-(3,66)
(3,16)-(3,18)
(3,24)-(3,46)
(3,24)-(3,46)
(3,24)-(3,66)
(3,25)-(3,40)
(3,26)-(3,37)
(3,47)-(3,48)
*)
