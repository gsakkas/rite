
let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt (n / 10)) :: n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,48)-(2,75)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(2,77)
(2,21)-(2,75)
(2,25)-(2,75)
(2,28)-(2,29)
(2,28)-(2,34)
(2,33)-(2,34)
(2,48)-(2,70)
(2,48)-(2,75)
(2,49)-(2,60)
(2,74)-(2,75)
*)
