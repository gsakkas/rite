
let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) :: x);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,45)-(3,60)
(3,45)-(3,65)
(3,64)-(3,65)
*)

(* type error slice
(2,3)-(3,68)
(2,20)-(3,66)
(3,2)-(3,66)
(3,24)-(3,66)
(3,24)-(3,66)
(3,33)-(3,41)
(3,45)-(3,60)
(3,45)-(3,65)
(3,45)-(3,65)
(3,45)-(3,65)
(3,46)-(3,57)
(3,64)-(3,65)
*)
