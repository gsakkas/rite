
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;



let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;


(* changed spans
(3,49)-(3,53)
(3,61)-(3,62)
*)

(* type error slice
(3,27)-(3,61)
*)
