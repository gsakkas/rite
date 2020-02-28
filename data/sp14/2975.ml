
let rec app x y = match x with | [] -> y | h::t -> h :: (app t y);;

let rec digitsOfInt n =
  if n >= 10 then app ((digitsOfInt (n / 10)) @ [n mod 10]) else [n];;


(* fix

let rec digitsOfInt n =
  if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

*)

(* changed spans
(5,19)-(5,60)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,57)-(2,66)
(2,58)-(2,61)
(5,3)-(5,69)
(5,19)-(5,22)
(5,19)-(5,60)
(5,66)-(5,69)
*)
