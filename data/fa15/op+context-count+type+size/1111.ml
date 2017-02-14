
let rec digitsOfInt n = ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,27)-(2,46)
(2,27)-(2,60)
(2,39)-(2,40)
(2,51)-(2,52)
(2,51)-(2,59)
(2,57)-(2,59)
*)

(* type error slice
(2,27)-(2,46)
(2,27)-(2,60)
(2,48)-(2,49)
*)
