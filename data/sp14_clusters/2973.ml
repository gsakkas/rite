
let rec app x y = match x with | [] -> y | h::t -> h :: (app t y);;

let rec digitsOfInt n =
  if n >= 10 then app digitsOfInt (n / 10) [n mod 10] else [n];;


(* fix

let rec digitsOfInt n =
  if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

*)

(* changed spans
(5,18)-(5,21)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(5,22)-(5,33)
(@)
VarG

(5,22)-(5,33)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)
