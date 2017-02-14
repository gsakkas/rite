
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
(3,27)-(3,76)
(3,47)-(3,76)
(3,50)-(3,51)
(3,52)-(3,76)
(3,52)-(3,76)
(3,53)-(3,64)
(3,53)-(3,74)
*)
