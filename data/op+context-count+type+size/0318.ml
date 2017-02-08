
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> [digitsOfInt (n / 10); n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,40)-(5,72)
(5,41)-(5,60)
(5,63)-(5,71)
*)

(* type error slice
(2,4)-(5,75)
(2,21)-(5,72)
(3,3)-(5,72)
(5,9)-(5,72)
(5,29)-(5,32)
(5,40)-(5,72)
(5,40)-(5,72)
(5,41)-(5,52)
(5,41)-(5,60)
(5,63)-(5,71)
*)
