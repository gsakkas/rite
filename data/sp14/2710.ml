
let rec digitsOfInt n = if n > 0 then [n; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(2,24)-(2,51)
(2,38)-(2,51)
(2,39)-(2,40)
*)

(* type error slice
(2,24)-(2,51)
(2,38)-(2,51)
*)

(* all spans
(2,20)-(2,51)
(2,24)-(2,51)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,51)
(2,39)-(2,40)
(2,42)-(2,50)
(2,42)-(2,43)
(2,48)-(2,50)
*)
