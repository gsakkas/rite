
let rec digitsOfInt n = if n < 0 then [] else (match n with | f::b -> f);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(2,46)-(2,72)
(2,53)-(2,54)
(2,70)-(2,71)
*)

(* type error slice
(2,27)-(2,28)
(2,27)-(2,32)
(2,31)-(2,32)
(2,46)-(2,72)
(2,53)-(2,54)
*)

(* all spans
(2,20)-(2,72)
(2,24)-(2,72)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,40)
(2,46)-(2,72)
(2,53)-(2,54)
(2,70)-(2,71)
*)
