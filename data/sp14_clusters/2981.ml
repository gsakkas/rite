
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10) [n mod 10]) else [n];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,40)-(5,42)
app
VarG

(5,45)-(5,53)
5
LitG

(5,45)-(5,53)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(5,61)-(5,64)
app
VarG

(5,61)-(5,64)
app [3] [8]
AppG [ListG EmptyG Nothing,ListG EmptyG Nothing]

(5,62)-(5,63)
3
LitG

*)
