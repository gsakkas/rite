
let rec digitsOfInt n =
  if n < 0
  then []
  else if (n mod 10) = 0 then n else (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,6)-(3,11)
n <= 0
BopG VarG LitG

(5,8)-(5,74)
(n mod 10) :: (digitsOfInt (n / 10))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(5,8)-(5,74)
(5,31)-(5,32)
(5,38)-(5,74)
*)
