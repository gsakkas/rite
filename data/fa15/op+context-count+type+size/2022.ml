
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then n else append (n mod 10) (digitsOfInt (n / 10));;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,17)-(5,18)
(5,31)-(5,41)
(5,32)-(5,33)
(5,38)-(5,40)
*)

(* type error slice
(2,21)-(2,71)
(2,21)-(2,71)
(2,59)-(2,71)
(2,60)-(2,66)
(2,67)-(2,68)
(5,24)-(5,30)
(5,24)-(5,64)
(5,31)-(5,41)
*)
