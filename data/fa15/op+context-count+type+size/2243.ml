
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then n else append digitsOfInt (n / 10) [n mod 10];;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,17)-(5,18)
(5,24)-(5,62)
(5,31)-(5,42)
*)

(* type error slice
(2,54)-(2,71)
(2,59)-(2,71)
(2,60)-(2,66)
(5,24)-(5,30)
(5,24)-(5,62)
*)
