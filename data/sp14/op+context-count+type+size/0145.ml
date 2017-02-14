
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,38)-(5,60)
(5,38)-(5,74)
(5,64)-(5,74)
*)

(* type error slice
(2,3)-(5,77)
(2,20)-(5,75)
(3,2)-(5,75)
(5,7)-(5,75)
(5,38)-(5,60)
(5,38)-(5,74)
(5,38)-(5,74)
(5,38)-(5,74)
(5,39)-(5,50)
(5,64)-(5,74)
*)
