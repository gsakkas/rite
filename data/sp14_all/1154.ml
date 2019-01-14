
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let a = n / 10 in
     let b = n mod 10 in let c = [a; b] in if a > 9 then (digitsOfInt a) :: c);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let a = n / 10 in
     let b = n mod 10 in
     let c = [a; b] in if a < 10 then c else digitsOfInt (a / 10));;

*)

(* changed spans
(7,43)-(7,77)
10
LitG

(7,46)-(7,51)
a < 10
BopG VarG LitG

(7,57)-(7,72)
c
VarG

(7,57)-(7,77)
10
LitG

(7,70)-(7,71)
a / 10
BopG VarG LitG

*)
