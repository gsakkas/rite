
let rec digitsOfInt n =
  if n > 0 then let x = n mod 10 in (digitsOfInt n) :: x else [];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,6)-(3,11)
(3,17)-(3,57)
(3,25)-(3,33)
(3,38)-(3,51)
(3,38)-(3,57)
(3,56)-(3,57)
(3,63)-(3,65)
*)

(* type error slice
(2,4)-(3,67)
(2,21)-(3,65)
(3,3)-(3,65)
(3,17)-(3,57)
(3,17)-(3,57)
(3,25)-(3,33)
(3,38)-(3,49)
(3,38)-(3,51)
(3,38)-(3,57)
(3,38)-(3,57)
(3,38)-(3,57)
(3,56)-(3,57)
*)
