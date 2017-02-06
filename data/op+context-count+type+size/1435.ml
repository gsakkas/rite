
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10; digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(3,26)-(3,58)
(3,37)-(3,56)
*)

(* type error slice
(2,21)-(3,58)
(3,3)-(3,58)
(3,6)-(3,7)
(3,6)-(3,12)
(3,18)-(3,20)
(3,37)-(3,48)
(3,37)-(3,56)
*)
