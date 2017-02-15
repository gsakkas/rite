
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10; (digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,57)
(3,26)-(3,34)
(3,36)-(3,56)
(3,49)-(3,50)
*)

(* type error slice
(2,3)-(3,59)
(2,20)-(3,57)
(3,2)-(3,57)
(3,25)-(3,57)
(3,36)-(3,51)
(3,36)-(3,56)
(3,37)-(3,48)
*)
