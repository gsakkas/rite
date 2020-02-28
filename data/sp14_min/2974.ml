
let rec app x y = match x with | [] -> y | h::t -> h :: (app t y);;

let rec digitsOfInt n =
  if n >= 10 then (app digitsOfInt (n / 10)) @ [n mod 10] else [n];;


(* fix

let rec digitsOfInt n =
  if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

*)

(* changed spans
(5,19)-(5,45)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,19)-(2,66)
(2,40)-(2,41)
(2,52)-(2,66)
(2,57)-(2,66)
(2,58)-(2,61)
(2,62)-(2,63)
(2,64)-(2,65)
(4,4)-(5,69)
(4,21)-(5,67)
(5,19)-(5,45)
(5,20)-(5,23)
(5,24)-(5,35)
(5,36)-(5,44)
*)
