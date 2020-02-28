
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app ([n / 10] [n mod 10]) else app [3] [8];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,19)-(5,44)
app [5] [n mod 10]
AppG [ListG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(5,3)-(5,61)
(5,19)-(5,22)
(5,19)-(5,44)
(5,23)-(5,44)
(5,24)-(5,32)
(5,50)-(5,53)
(5,50)-(5,61)
*)
