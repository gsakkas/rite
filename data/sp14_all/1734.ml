
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in [digit; n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,8)-(5,63)
(n mod 10) :: (digitsOfInt (n / 10))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(5,65)
(2,21)-(5,63)
(3,3)-(5,63)
(5,8)-(5,63)
(5,21)-(5,32)
(5,21)-(5,41)
(5,45)-(5,62)
(5,46)-(5,51)
*)
