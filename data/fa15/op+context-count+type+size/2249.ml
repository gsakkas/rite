
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then n else (append n) mod (10 digitsOfInt (n / 10));;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,18)-(5,19)
(5,26)-(5,32)
(5,26)-(5,34)
(5,26)-(5,63)
(5,41)-(5,43)
(5,44)-(5,55)
*)

(* type error slice
(2,22)-(2,71)
(2,22)-(2,71)
(2,61)-(2,67)
(2,61)-(2,71)
(2,68)-(2,69)
(5,6)-(5,7)
(5,6)-(5,12)
(5,6)-(5,12)
(5,11)-(5,12)
(5,26)-(5,32)
(5,26)-(5,34)
(5,33)-(5,34)
(5,41)-(5,43)
(5,41)-(5,63)
*)
