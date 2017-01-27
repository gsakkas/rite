
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [digitsOfInt (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,53)-(3,64)
(3,53)-(3,74)
*)

(* type error slice
(2,4)-(3,79)
(2,21)-(3,76)
(3,3)-(3,76)
(3,6)-(3,7)
(3,6)-(3,12)
(3,11)-(3,12)
(3,18)-(3,20)
(3,53)-(3,64)
(3,53)-(3,74)
(3,66)-(3,74)
*)
