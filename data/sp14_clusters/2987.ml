
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app digitsOfInt (n / 10) [n mod 10] else [n];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10)) [n mod 10] else [n];;

*)

(* changed spans
(5,18)-(5,53)
app (digitsOfInt (n / 10))
    [n mod 10]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(5,22)-(5,33)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)
