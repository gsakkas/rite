
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
(2,21)-(5,72)
(3,3)-(5,72)
(3,6)-(3,7)
(3,6)-(3,11)
(4,8)-(4,10)
(5,40)-(5,72)
(5,41)-(5,52)
(5,41)-(5,60)
*)
