
let rec append first second =
  match first with | [] -> second | h::t -> h :: (append t second);;

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else append ((digitsOfInt (n / 10)) [n mod 10]);;


(* fix

let rec append first second =
  match first with | [] -> second | h::t -> h :: (append t second);;

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(8,29)-(8,71)
(8,37)-(8,59)
*)

(* type error slice
(3,49)-(3,66)
(3,50)-(3,56)
(8,7)-(8,71)
(8,21)-(8,23)
(8,29)-(8,35)
(8,29)-(8,71)
*)

(* all spans
(2,15)-(3,66)
(2,21)-(3,66)
(3,2)-(3,66)
(3,8)-(3,13)
(3,27)-(3,33)
(3,44)-(3,66)
(3,44)-(3,45)
(3,49)-(3,66)
(3,50)-(3,56)
(3,57)-(3,58)
(3,59)-(3,65)
(5,20)-(8,71)
(6,2)-(8,71)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(7,7)-(7,9)
(8,7)-(8,71)
(8,10)-(8,15)
(8,10)-(8,11)
(8,14)-(8,15)
(8,21)-(8,23)
(8,29)-(8,71)
(8,29)-(8,35)
(8,36)-(8,71)
(8,37)-(8,59)
(8,38)-(8,49)
(8,50)-(8,58)
(8,51)-(8,52)
(8,55)-(8,57)
(8,60)-(8,70)
(8,61)-(8,69)
(8,61)-(8,62)
(8,67)-(8,69)
*)
