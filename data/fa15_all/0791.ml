
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else ((append digitsOfInt (n / 10)), [n mod 10]);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,27)-(5,70)
append (digitsOfInt (n / 10))
       [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,22)-(2,72)
(2,43)-(2,44)
(2,55)-(2,72)
(2,60)-(2,72)
(2,61)-(2,67)
(2,70)-(2,71)
(5,3)-(5,70)
(5,18)-(5,21)
(5,27)-(5,70)
(5,28)-(5,57)
(5,29)-(5,35)
(5,48)-(5,56)
*)
