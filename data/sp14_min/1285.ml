
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [digitsOfInt n]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [n mod 10]);;

*)

(* changed spans
(3,48)-(3,61)
n mod 10
BopG VarG LitG

*)

(* type error slice
(2,4)-(3,65)
(2,21)-(3,63)
(3,3)-(3,63)
(3,26)-(3,63)
(3,47)-(3,62)
(3,48)-(3,59)
(3,48)-(3,61)
*)
