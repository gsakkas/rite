
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append digitsOfInt (n / 10) [n];;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,27)-(5,58)
(5,34)-(5,45)
(5,56)-(5,57)
*)

(* type error slice
(2,55)-(2,71)
(2,61)-(2,67)
(2,61)-(2,71)
(5,27)-(5,33)
(5,27)-(5,58)
*)
