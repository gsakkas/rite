
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
(5,3)-(8,73)
(5,20)-(8,71)
(6,2)-(8,71)
(7,7)-(7,9)
(8,7)-(8,71)
(8,7)-(8,71)
(8,21)-(8,23)
(8,29)-(8,35)
(8,29)-(8,71)
(8,36)-(8,71)
(8,37)-(8,59)
(8,38)-(8,49)
*)
