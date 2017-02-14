
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,41)-(5,60)
(5,41)-(5,75)
(5,67)-(5,75)
*)

(* type error slice
(2,4)-(5,79)
(2,21)-(5,75)
(3,3)-(5,75)
(5,9)-(5,75)
(5,41)-(5,52)
(5,41)-(5,60)
(5,41)-(5,75)
(5,41)-(5,75)
(5,41)-(5,75)
(5,67)-(5,75)
*)
