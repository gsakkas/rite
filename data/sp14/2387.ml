
let rec digitsOfInt n =
  if n > 0 then let k = digitsOfInt (n / 10) in k :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then let k = digitsOfInt (n / 10) in (n mod 10) :: k else [];;

*)

(* changed spans
(3,49)-(3,50)
n mod 10
BopG VarG LitG

(3,54)-(3,64)
k
VarG

*)

(* type error slice
(2,4)-(3,74)
(2,21)-(3,72)
(3,3)-(3,72)
(3,17)-(3,64)
(3,25)-(3,36)
(3,25)-(3,45)
(3,49)-(3,50)
(3,49)-(3,64)
(3,54)-(3,64)
*)
