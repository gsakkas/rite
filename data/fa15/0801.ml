
let rec digitsOfInt n =
  if n < 0
  then []
  else (fun n  -> let d = digitsOfInt (n / 10) in (n mod 10) :: d);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let d = digitsOfInt (n / 10) in (n mod 10) :: d);;

*)

(* changed spans
(5,7)-(5,66)
*)

(* type error slice
(3,2)-(5,66)
(4,7)-(4,9)
(5,7)-(5,66)
*)

(* all spans
(2,20)-(5,66)
(3,2)-(5,66)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(5,7)-(5,66)
(5,18)-(5,65)
(5,26)-(5,46)
(5,26)-(5,37)
(5,38)-(5,46)
(5,39)-(5,40)
(5,43)-(5,45)
(5,50)-(5,65)
(5,50)-(5,60)
(5,51)-(5,52)
(5,57)-(5,59)
(5,64)-(5,65)
*)
