
let rec append first second =
  match first with | [] -> second | h::t -> h :: (append t second);;

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else append ((digitsOfInt (n / 10)) [n mod 10]);;



let rec append first second =
  match first with | [] -> second | h::t -> h :: (append t second);;

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;


(* changed spans
(8,38)-(8,39)
(8,71)-(8,72)
*)

(* type error slice
(3,51)-(3,66)
(8,8)-(8,71)
(8,30)-(8,71)
*)
