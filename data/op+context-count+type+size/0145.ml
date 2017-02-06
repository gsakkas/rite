
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | _ -> (digitsOfInt (n / 10)) :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,9)-(5,64)
(5,30)-(5,49)
(5,30)-(5,64)
(5,56)-(5,57)
(5,56)-(5,64)
(5,62)-(5,64)
*)

(* type error slice
(2,4)-(5,68)
(2,21)-(5,64)
(3,3)-(5,64)
(3,3)-(5,64)
(3,6)-(3,7)
(3,6)-(3,11)
(4,8)-(4,10)
(5,9)-(5,64)
(5,30)-(5,41)
(5,30)-(5,49)
(5,30)-(5,64)
(5,56)-(5,64)
*)
