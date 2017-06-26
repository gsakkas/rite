
let rec digitsOfInt n =
  let m = n in if n < 0 then [] else [[digitsOfInt (m / 10)]; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,2)-(3,71)
(3,10)-(3,11)
(3,37)-(3,71)
(3,38)-(3,60)
(3,39)-(3,59)
(3,52)-(3,53)
(3,62)-(3,70)
*)

(* type error slice
(2,3)-(3,73)
(2,20)-(3,71)
(3,2)-(3,71)
(3,15)-(3,71)
(3,37)-(3,71)
(3,38)-(3,60)
(3,39)-(3,50)
(3,39)-(3,59)
(3,62)-(3,70)
*)

(* all spans
(2,20)-(3,71)
(3,2)-(3,71)
(3,10)-(3,11)
(3,15)-(3,71)
(3,18)-(3,23)
(3,18)-(3,19)
(3,22)-(3,23)
(3,29)-(3,31)
(3,37)-(3,71)
(3,38)-(3,60)
(3,39)-(3,59)
(3,39)-(3,50)
(3,51)-(3,59)
(3,52)-(3,53)
(3,56)-(3,58)
(3,62)-(3,70)
(3,62)-(3,63)
(3,68)-(3,70)
*)
