
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else [digitsOfInt (n mod 10)];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,44)-(3,68)
(3,45)-(3,67)
(3,57)-(3,67)
*)

(* type error slice
(2,3)-(3,70)
(2,20)-(3,68)
(3,2)-(3,68)
(3,21)-(3,68)
(3,44)-(3,68)
(3,45)-(3,56)
(3,45)-(3,67)
*)

(* all spans
(2,20)-(3,68)
(3,2)-(3,68)
(3,15)-(3,17)
(3,21)-(3,68)
(3,24)-(3,30)
(3,24)-(3,25)
(3,29)-(3,30)
(3,36)-(3,38)
(3,44)-(3,68)
(3,45)-(3,67)
(3,45)-(3,56)
(3,57)-(3,67)
(3,58)-(3,59)
(3,64)-(3,66)
*)
