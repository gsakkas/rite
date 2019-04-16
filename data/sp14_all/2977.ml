
let rec app x y = match x with | [] -> y | h::t -> h :: (app t y);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10) [n mod 10]) else n;;


(* fix

let rec digitsOfInt n =
  if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

*)

(* changed spans
(5,19)-(5,56)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

(5,62)-(5,63)
[n]
ListG (fromList [VarG])

*)

(* type error slice
(2,57)-(2,66)
(2,58)-(2,61)
(4,4)-(5,65)
(4,21)-(5,63)
(5,3)-(5,63)
(5,6)-(5,7)
(5,6)-(5,13)
(5,11)-(5,13)
(5,19)-(5,22)
(5,19)-(5,56)
(5,23)-(5,56)
(5,24)-(5,35)
(5,36)-(5,44)
(5,62)-(5,63)
*)
