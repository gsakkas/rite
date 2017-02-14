
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

*)

(* changed spans
(3,54)-(3,74)
*)

(* type error slice
(3,3)-(3,74)
(3,3)-(3,74)
(3,54)-(3,59)
(3,54)-(3,74)
(3,61)-(3,64)
(3,61)-(3,74)
(3,65)-(3,69)
(5,4)-(6,65)
(5,21)-(6,62)
(6,3)-(6,62)
(6,26)-(6,29)
(6,26)-(6,62)
(6,31)-(6,42)
(6,31)-(6,50)
*)
