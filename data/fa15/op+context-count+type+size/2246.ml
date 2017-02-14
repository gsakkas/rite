
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then n else append (digitsOfInt (n / 10) [n mod 10]);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,18)-(5,19)
(5,25)-(5,31)
(5,25)-(5,64)
(5,33)-(5,44)
*)

(* type error slice
(2,61)-(2,67)
(2,61)-(2,71)
(4,4)-(5,67)
(4,21)-(5,64)
(5,3)-(5,64)
(5,3)-(5,64)
(5,6)-(5,7)
(5,6)-(5,12)
(5,6)-(5,12)
(5,11)-(5,12)
(5,18)-(5,19)
(5,25)-(5,31)
(5,25)-(5,64)
(5,33)-(5,44)
(5,33)-(5,64)
(5,46)-(5,52)
*)
