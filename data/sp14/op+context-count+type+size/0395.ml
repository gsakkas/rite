
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
(8,30)-(8,71)
(8,39)-(8,58)
*)

(* type error slice
(3,51)-(3,57)
(3,51)-(3,66)
(5,4)-(8,74)
(5,21)-(8,71)
(6,3)-(8,71)
(7,8)-(7,10)
(8,8)-(8,71)
(8,8)-(8,71)
(8,22)-(8,24)
(8,30)-(8,36)
(8,30)-(8,71)
(8,39)-(8,50)
(8,39)-(8,58)
(8,39)-(8,71)
*)
