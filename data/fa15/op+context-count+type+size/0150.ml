
let rec digitsOfInt n =
  if n < 0 then [] else [(digitsOfInt (n / 10)) @ (n mod 10)];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,61)
(3,50)-(3,60)
*)

(* type error slice
(3,25)-(3,60)
(3,48)-(3,49)
(3,50)-(3,60)
*)
