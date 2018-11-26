
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [digitsOfInt n]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [n mod 10]);;

*)

(* changed spans
(3,47)-(3,58)
n mod 10
BopG VarG LitG

*)
