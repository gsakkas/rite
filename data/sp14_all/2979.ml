
let rec app x y = match x with | [] -> y | h::t -> h :: (app t y);;

let rec digitsOfInt n =
  if n >= 10 then app ((digitsOfInt (n / 10)) [n mod 10]) else [n + 0];;


(* fix

let rec digitsOfInt n =
  if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

*)

(* changed spans
(5,19)-(5,58)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

(5,65)-(5,70)
n
VarG

*)

(* type error slice
(2,57)-(2,66)
(2,58)-(2,61)
(4,4)-(5,73)
(4,21)-(5,71)
(5,3)-(5,71)
(5,19)-(5,22)
(5,19)-(5,58)
(5,23)-(5,58)
(5,24)-(5,46)
(5,25)-(5,36)
(5,64)-(5,71)
*)
