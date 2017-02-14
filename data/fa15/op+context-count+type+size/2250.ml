
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else (append digitsOfInt (n / 10) n) mod 10;;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,26)-(5,57)
(5,26)-(5,64)
(5,34)-(5,45)
(5,55)-(5,56)
*)

(* type error slice
(2,54)-(2,71)
(2,59)-(2,71)
(2,60)-(2,66)
(5,2)-(5,64)
(5,2)-(5,64)
(5,17)-(5,20)
(5,26)-(5,57)
(5,26)-(5,64)
(5,27)-(5,33)
*)
