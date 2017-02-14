
let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else n;;


(* fix

let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else [n];;

*)

(* changed spans
(3,70)-(3,71)
*)

(* type error slice
(3,10)-(3,11)
(3,10)-(3,18)
(3,22)-(3,71)
(3,22)-(3,71)
(3,36)-(3,64)
(3,59)-(3,60)
(3,70)-(3,71)
*)
