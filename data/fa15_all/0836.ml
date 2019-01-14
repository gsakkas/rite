
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (digitsOfInt (n / 10)) :: (n_ mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (n_ mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(5,29)-(5,51)
n_
VarG

(5,29)-(5,51)
n_ mod 10
BopG VarG LitG

(5,29)-(5,51)
10
LitG

*)
