
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,48)-(2,70)
(2,49)-(2,68)
(2,62)-(2,63)
(2,66)-(2,68)
*)

(* type error slice
(2,4)-(2,72)
(2,21)-(2,70)
(2,25)-(2,70)
(2,25)-(2,70)
(2,28)-(2,29)
(2,28)-(2,34)
(2,40)-(2,42)
(2,48)-(2,70)
(2,48)-(2,70)
(2,49)-(2,60)
(2,49)-(2,68)
*)
