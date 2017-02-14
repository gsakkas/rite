
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then n else append digitsOfInt (n / 10) [n mod 10];;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,18)-(5,19)
(5,25)-(5,63)
(5,32)-(5,43)
*)

(* type error slice
(2,55)-(2,71)
(2,61)-(2,67)
(2,61)-(2,71)
(5,25)-(5,31)
(5,25)-(5,63)
*)
