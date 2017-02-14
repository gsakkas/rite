
let rec digitsOfInt n =
  if n < 0 then [] else (match n with | h::t -> [h; digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,67)
(3,31)-(3,32)
(3,48)-(3,66)
(3,49)-(3,50)
(3,52)-(3,63)
(3,52)-(3,65)
(3,64)-(3,65)
*)

(* type error slice
(3,5)-(3,6)
(3,5)-(3,10)
(3,5)-(3,10)
(3,9)-(3,10)
(3,24)-(3,67)
(3,24)-(3,67)
(3,31)-(3,32)
*)
