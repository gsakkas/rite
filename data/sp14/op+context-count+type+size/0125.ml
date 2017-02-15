
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
(5,7)-(5,65)
(5,28)-(5,50)
(5,28)-(5,64)
(5,54)-(5,64)
(5,55)-(5,56)
(5,61)-(5,63)
*)

(* type error slice
(2,3)-(5,67)
(2,20)-(5,65)
(3,2)-(5,65)
(5,7)-(5,65)
(5,28)-(5,50)
(5,28)-(5,64)
(5,28)-(5,64)
(5,28)-(5,64)
(5,29)-(5,40)
(5,54)-(5,64)
*)
