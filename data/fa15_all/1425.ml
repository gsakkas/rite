
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n mod 10)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt (n mod 10)) @ [];;

*)

(* changed spans
(2,48)-(2,72)
digitsOfInt (n mod 10) @ []
AppG [AppG [EmptyG],ListG []]

*)

(* type error slice
(2,4)-(2,74)
(2,21)-(2,72)
(2,25)-(2,72)
(2,48)-(2,72)
(2,49)-(2,60)
(2,49)-(2,71)
*)
