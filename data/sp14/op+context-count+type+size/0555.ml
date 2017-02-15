
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,41)-(3,51)
*)

(* type error slice
(3,16)-(3,51)
(3,39)-(3,40)
(3,41)-(3,51)
*)
