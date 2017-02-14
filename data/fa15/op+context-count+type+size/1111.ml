
let rec digitsOfInt n = ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,46)
(2,24)-(2,59)
(2,38)-(2,39)
(2,50)-(2,51)
(2,50)-(2,58)
(2,56)-(2,58)
*)

(* type error slice
(2,24)-(2,46)
(2,24)-(2,59)
(2,47)-(2,48)
*)
