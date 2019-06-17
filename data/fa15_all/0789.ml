
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
[n]
ListG [VarG]

(5,25)-(5,65)
append (digitsOfInt (n / 10))
       [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,60)-(2,72)
(2,61)-(2,67)
(5,3)-(5,65)
(5,6)-(5,7)
(5,6)-(5,12)
(5,11)-(5,12)
(5,18)-(5,19)
(5,25)-(5,31)
(5,25)-(5,65)
*)
