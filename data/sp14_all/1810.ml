
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,26)-(3,62)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(3,64)
(2,21)-(3,62)
(3,3)-(3,62)
(3,26)-(3,48)
(3,26)-(3,62)
(3,27)-(3,38)
(3,52)-(3,62)
*)
