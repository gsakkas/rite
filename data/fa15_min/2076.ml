
let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) :: x else n;;


(* fix

let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) @ [x] else [n];;

*)

(* changed spans
(3,37)-(3,64)
digitsOfInt (n / 10) @ [x]
AppG [AppG [EmptyG],ListG [EmptyG]]

(3,70)-(3,71)
[n]
ListG [VarG]

*)

(* type error slice
(3,3)-(3,71)
(3,11)-(3,12)
(3,11)-(3,19)
(3,23)-(3,71)
(3,37)-(3,64)
(3,63)-(3,64)
(3,70)-(3,71)
*)
