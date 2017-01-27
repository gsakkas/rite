
let rec digitsOfInt n =
  if n > 0 then let k = digitsOfInt (n / 10) in k :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then let k = digitsOfInt (n / 10) in (n mod 10) :: k else [];;

*)

(* changed spans
(3,49)-(3,50)
(3,55)-(3,63)
(3,70)-(3,72)
*)

(* type error slice
(2,4)-(3,74)
(2,21)-(3,72)
(3,3)-(3,72)
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(3,17)-(3,63)
(3,25)-(3,36)
(3,25)-(3,44)
(3,38)-(3,44)
(3,49)-(3,50)
(3,49)-(3,63)
(3,55)-(3,63)
*)
