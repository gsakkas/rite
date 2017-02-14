
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then n else append (digitsOfInt (n / 10) [n mod 10]);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,17)-(5,18)
(5,24)-(5,30)
(5,24)-(5,64)
(5,32)-(5,43)
*)

(* type error slice
(2,59)-(2,71)
(2,60)-(2,66)
(4,3)-(5,66)
(4,20)-(5,64)
(5,2)-(5,64)
(5,2)-(5,64)
(5,5)-(5,6)
(5,5)-(5,11)
(5,5)-(5,11)
(5,10)-(5,11)
(5,17)-(5,18)
(5,24)-(5,30)
(5,24)-(5,64)
(5,31)-(5,64)
(5,32)-(5,43)
(5,44)-(5,52)
*)
