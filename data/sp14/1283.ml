
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [digitsOfInt (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,53)-(3,75)
n mod 10
BopG VarG LitG

*)

(* type error slice
(2,4)-(3,79)
(2,21)-(3,77)
(3,3)-(3,77)
(3,26)-(3,77)
(3,47)-(3,76)
(3,50)-(3,51)
(3,52)-(3,76)
(3,53)-(3,64)
(3,53)-(3,75)
*)
