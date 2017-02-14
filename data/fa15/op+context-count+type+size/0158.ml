
let rec digitsOfInt n =
  if n < 0 then [] else (match n with | h::t -> [h; digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,26)-(3,67)
(3,32)-(3,33)
(3,49)-(3,67)
(3,50)-(3,51)
(3,53)-(3,64)
(3,53)-(3,66)
(3,65)-(3,66)
*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,6)-(3,11)
(3,10)-(3,11)
(3,26)-(3,67)
(3,26)-(3,67)
(3,32)-(3,33)
*)
