
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10) [n mod 10]) else app [n] [];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,19)-(5,56)
app [5] [n mod 10]
AppG (fromList [ListG (fromList [EmptyG])])

(5,67)-(5,68)
3
LitG

(5,70)-(5,72)
[8]
ListG (fromList [LitG])

*)

(* type error slice
(5,3)-(5,72)
(5,19)-(5,22)
(5,19)-(5,56)
(5,62)-(5,65)
(5,62)-(5,72)
*)
