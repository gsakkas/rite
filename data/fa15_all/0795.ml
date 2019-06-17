
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else (append digitsOfInt n) / (10 [n]);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,27)-(5,60)
append (digitsOfInt (n / 10))
       [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,22)-(2,72)
(2,43)-(2,44)
(2,55)-(2,72)
(2,60)-(2,72)
(2,61)-(2,67)
(2,70)-(2,71)
(5,3)-(5,60)
(5,6)-(5,7)
(5,6)-(5,12)
(5,11)-(5,12)
(5,18)-(5,21)
(5,27)-(5,49)
(5,27)-(5,60)
(5,28)-(5,34)
(5,47)-(5,48)
(5,52)-(5,60)
(5,53)-(5,55)
*)
