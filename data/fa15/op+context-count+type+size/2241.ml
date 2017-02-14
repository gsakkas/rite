
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append digitsOfInt (n / 10) [n];;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,26)-(5,57)
(5,33)-(5,44)
(5,55)-(5,56)
*)

(* type error slice
(2,54)-(2,71)
(2,59)-(2,71)
(2,60)-(2,66)
(5,26)-(5,32)
(5,26)-(5,57)
*)
