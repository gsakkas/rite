
let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else n;;


(* fix

let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else [n];;

*)

(* changed spans
(3,71)-(3,72)
*)

(* type error slice
(3,11)-(3,12)
(3,11)-(3,19)
(3,23)-(3,72)
(3,23)-(3,72)
(3,38)-(3,65)
(3,60)-(3,61)
(3,71)-(3,72)
*)
