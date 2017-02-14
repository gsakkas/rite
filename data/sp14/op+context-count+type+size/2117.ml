
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app ([n / 10] [n mod 10]) else app [3] [8];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,18)-(5,43)
(5,22)-(5,43)
(5,24)-(5,25)
(5,24)-(5,30)
(5,28)-(5,30)
*)

(* type error slice
(5,2)-(5,60)
(5,2)-(5,60)
(5,18)-(5,21)
(5,18)-(5,43)
(5,22)-(5,43)
(5,23)-(5,31)
(5,49)-(5,52)
(5,49)-(5,60)
*)
