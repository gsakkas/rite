
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,47)
(3,25)-(3,60)
(3,48)-(3,49)
(3,50)-(3,60)
(3,51)-(3,52)
(3,57)-(3,59)
*)

(* type error slice
(3,25)-(3,60)
(3,48)-(3,49)
(3,50)-(3,60)
*)
