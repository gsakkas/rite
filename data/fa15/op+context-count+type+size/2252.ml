
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else (append digitsOfInt (n / 10) n) mod 10;;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,28)-(5,57)
(5,28)-(5,65)
(5,35)-(5,46)
(5,56)-(5,57)
*)

(* type error slice
(2,55)-(2,71)
(2,61)-(2,67)
(2,61)-(2,71)
(5,3)-(5,65)
(5,3)-(5,65)
(5,18)-(5,21)
(5,28)-(5,34)
(5,28)-(5,57)
(5,28)-(5,65)
*)
