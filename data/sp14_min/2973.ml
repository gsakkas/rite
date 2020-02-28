
let rec app x y = match x with | [] -> y | h::t -> h :: (app t y);;

let rec digitsOfInt n =
  if n >= 10 then app digitsOfInt (n / 10) [n mod 10] else [n];;


(* fix

let rec digitsOfInt n =
  if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

*)

(* changed spans
(5,19)-(5,54)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,52)-(2,66)
(2,57)-(2,66)
(2,58)-(2,61)
(5,19)-(5,22)
(5,19)-(5,54)
*)
