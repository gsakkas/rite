
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then (app digitsOfInt n) / (10 [n mod 10]) else app [3] [8];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10)) [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,23)-(5,34)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(5,35)-(5,36)
n / 10
BopG VarG LitG

*)
