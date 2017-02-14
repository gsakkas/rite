
let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) :: x else n;;


(* fix

let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else [n];;

*)

(* changed spans
(3,38)-(3,57)
(3,38)-(3,64)
(3,63)-(3,64)
(3,70)-(3,71)
*)

(* type error slice
(2,4)-(3,73)
(2,21)-(3,71)
(3,3)-(3,71)
(3,3)-(3,71)
(3,11)-(3,12)
(3,11)-(3,19)
(3,11)-(3,19)
(3,23)-(3,71)
(3,23)-(3,71)
(3,38)-(3,49)
(3,38)-(3,57)
(3,38)-(3,64)
(3,38)-(3,64)
(3,38)-(3,64)
(3,63)-(3,64)
(3,70)-(3,71)
*)
